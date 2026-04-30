import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../traceability/session_record_hash.dart';

class AppointmentEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Creates a new appointment in Scheduled status.
  Future<Appointment> createAppointment(
    Session session, {
    required AppointmentType type,
    required UuidValue customerId,
    required DateTime scheduledAt,
    String? notes,
  }) async {
    final artistProfileId = await _getArtistProfileId(session);

    // Use a hardcoded default workplace until Workplace slice lands.
    final workplaceId = UuidValue.fromString(
      'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    );

    return Appointment.db.insertRow(
      session,
      Appointment(
        artistProfileId: artistProfileId,
        customerId: customerId,
        workplaceId: workplaceId,
        type: type,
        status: AppointmentStatus.scheduled,
        scheduledAt: scheduledAt,
        notes: notes,
      ),
    );
  }

  /// Transitions appointment from Scheduled to In Progress.
  Future<Appointment> startAppointment(
    Session session,
    UuidValue appointmentId,
  ) async {
    final appointment = await _getOwnedAppointment(session, appointmentId);

    if (appointment.status != AppointmentStatus.scheduled) {
      throw StateError(
        'Cannot start appointment: current status is ${appointment.status}',
      );
    }

    appointment.status = AppointmentStatus.inProgress;
    appointment.startedAt = DateTime.now();

    return Appointment.db.updateRow(session, appointment);
  }

  /// Transitions appointment from In Progress to Finalized.
  /// Returns a warning flag if tattoo-type with zero materials.
  Future<Appointment> finalizeAppointment(
    Session session,
    UuidValue appointmentId, {
    bool overrideZeroMaterials = false,
  }) async {
    final appointment = await _getOwnedAppointment(session, appointmentId);

    if (appointment.status != AppointmentStatus.inProgress) {
      throw StateError(
        'Cannot finalize appointment: current status is ${appointment.status}',
      );
    }

    if (appointment.type == AppointmentType.tattoo && !overrideZeroMaterials) {
      final materials = await AppointmentMaterial.db.find(
        session,
        where: (t) => t.appointmentId.equals(appointmentId),
      );
      if (materials.isEmpty) {
        throw StateError('zero_materials_warning');
      }
    }

    appointment.status = AppointmentStatus.finalized;
    appointment.finalizedAt = DateTime.now();

    final updated = await Appointment.db.updateRow(session, appointment);

    // Seal: compute hash and create SessionRecord
    final sealMaterials = await AppointmentMaterial.db.find(
      session,
      where: (t) => t.appointmentId.equals(appointmentId),
    );

    final hash = computeSessionRecordHash(
      appointmentId: appointmentId,
      artistProfileId: appointment.artistProfileId,
      customerId: appointment.customerId,
      finalizedAt: updated.finalizedAt!,
      type: appointment.type,
      materials: sealMaterials,
    );

    await SessionRecord.db.insertRow(
      session,
      SessionRecord(
        appointmentId: appointmentId,
        hash: hash,
        sealedAt: DateTime.now(),
        version: 1,
      ),
    );

    return updated;
  }

  /// Records a material from inventory, creating a snapshot.
  /// Only allowed when appointment is In Progress.
  Future<AppointmentMaterial> recordMaterial(
    Session session, {
    required UuidValue appointmentId,
    required UuidValue materialId,
  }) async {
    final appointment = await _getOwnedAppointment(session, appointmentId);

    if (appointment.status != AppointmentStatus.inProgress) {
      throw StateError(
        'Can only record materials when appointment is in progress',
      );
    }

    final material = await Material.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(materialId) &
          t.artistProfileId.equals(appointment.artistProfileId),
    );

    if (material == null) {
      throw ArgumentError('Material not found in your inventory');
    }

    // Decrement needle quantity
    if (material.type == MaterialType.needle) {
      final qty = material.quantity ?? 0;
      if (qty <= 0) {
        throw StateError('Needle has no remaining quantity');
      }
      material.quantity = qty - 1;
      material.status = qty - 1 == 0
          ? MaterialStatus.empty
          : MaterialStatus.inStock;
      await Material.db.updateRow(session, material);
    }

    // Create snapshot
    return AppointmentMaterial.db.insertRow(
      session,
      AppointmentMaterial(
        appointmentId: appointmentId,
        materialId: materialId,
        manufacturer: material.manufacturer,
        productName: material.productName,
        batchNumber: material.batchNumber,
      ),
    );
  }

  /// Lists appointments for the current artist profile.
  Future<List<Appointment>> listAppointments(Session session) async {
    final artistProfileId = await _getArtistProfileId(session);

    return Appointment.db.find(
      session,
      where: (t) => t.artistProfileId.equals(artistProfileId),
      orderBy: (t) => t.scheduledAt,
      orderDescending: true,
    );
  }

  Future<Appointment> _getOwnedAppointment(
    Session session,
    UuidValue appointmentId,
  ) async {
    final artistProfileId = await _getArtistProfileId(session);

    final appointment = await Appointment.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(appointmentId) &
          t.artistProfileId.equals(artistProfileId),
    );

    if (appointment == null) {
      throw ArgumentError('Appointment not found');
    }

    return appointment;
  }

  Future<UuidValue> _getArtistProfileId(Session session) async {
    final authUserId = session.authenticated!.userIdentifier;

    final profile = await ArtistProfile.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(UuidValue.fromString(authUserId)),
    );

    if (profile == null) {
      throw StateError('No artist profile found for user');
    }

    return profile.id!;
  }
}
