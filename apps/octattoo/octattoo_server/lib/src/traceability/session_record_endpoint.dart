import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'session_record_hash.dart';

class SessionRecordEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Returns the latest SessionRecord for a given appointment, or null if not sealed.
  Future<SessionRecord?> getByAppointmentId(
    Session session,
    UuidValue appointmentId,
  ) async {
    return SessionRecord.db.findFirstRow(
      session,
      where: (t) => t.appointmentId.equals(appointmentId),
      orderBy: (t) => t.version,
      orderDescending: true,
    );
  }

  /// Returns all versions of a SessionRecord for an appointment, ordered by version ascending.
  Future<List<SessionRecord>> getVersionHistory(
    Session session,
    UuidValue appointmentId,
  ) async {
    return SessionRecord.db.find(
      session,
      where: (t) => t.appointmentId.equals(appointmentId),
      orderBy: (t) => t.version,
    );
  }

  /// Creates a new version of the SessionRecord with updated materials.
  Future<SessionRecord> amendSessionRecord(
    Session session,
    UuidValue appointmentId,
    List<UuidValue> materialIds,
    String reason,
  ) async {
    if (reason.trim().isEmpty) {
      throw ArgumentError('Reason is required for amendments');
    }

    // Verify appointment is finalized
    final appointment = await Appointment.db.findFirstRow(
      session,
      where: (t) => t.id.equals(appointmentId),
    );
    if (appointment == null) {
      throw ArgumentError('Appointment not found');
    }
    if (appointment.status != AppointmentStatus.finalized) {
      throw StateError('Can only amend finalized appointments');
    }

    // Get current latest version
    final current = await getByAppointmentId(session, appointmentId);
    if (current == null) {
      throw StateError('No session record found to amend');
    }

    // Build material snapshots from inventory
    final materials = <AppointmentMaterial>[];
    for (final materialId in materialIds) {
      final mat = await Material.db.findFirstRow(
        session,
        where: (t) => t.id.equals(materialId),
      );
      if (mat == null) {
        throw ArgumentError('Material $materialId not found');
      }
      materials.add(AppointmentMaterial(
        appointmentId: appointmentId,
        materialId: materialId,
        manufacturer: mat.manufacturer,
        productName: mat.productName,
        batchNumber: mat.batchNumber,
      ));
    }

    final hash = computeSessionRecordHash(
      appointmentId: appointmentId,
      artistProfileId: appointment.artistProfileId,
      customerId: appointment.customerId,
      finalizedAt: appointment.finalizedAt!,
      type: appointment.type,
      materials: materials,
      previousHash: current.hash,
    );

    return SessionRecord.db.insertRow(
      session,
      SessionRecord(
        appointmentId: appointmentId,
        hash: hash,
        sealedAt: DateTime.now(),
        version: current.version + 1,
        previousHash: current.hash,
        reason: reason,
      ),
    );
  }
}
