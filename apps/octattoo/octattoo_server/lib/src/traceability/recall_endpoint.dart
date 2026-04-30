import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class RecallEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Search AppointmentMaterial snapshots by batchNumber across all
  /// ArtistProfiles owned by the authenticated Account.
  Future<List<RecallMatch>> searchByBatch(
    Session session,
    String batchNumber,
  ) async {
    final authUserId = session.authenticated!.userIdentifier;

    // Get all profiles for this account
    final profiles = await ArtistProfile.db.find(
      session,
      where: (t) => t.authUserId.equals(UuidValue.fromString(authUserId)),
    );
    if (profiles.isEmpty) return [];

    final profileIds = profiles.map((p) => p.id!).toList();
    final profileMap = {for (final p in profiles) p.id!: p.name};

    // Find all appointment materials with this batch number
    final materials = await AppointmentMaterial.db.find(
      session,
      where: (t) => t.batchNumber.equals(batchNumber),
    );
    if (materials.isEmpty) return [];

    // Get the appointments for these materials, scoped to our profiles
    final appointmentIds = materials.map((m) => m.appointmentId).toSet();
    final appointments = await Appointment.db.find(
      session,
      where: (t) =>
          t.id.inSet(appointmentIds) &
          t.artistProfileId.inSet(profileIds.toSet()),
    );
    if (appointments.isEmpty) return [];

    final appointmentMap = {for (final a in appointments) a.id!: a};

    // Get customers
    final customerIds = appointments.map((a) => a.customerId).toSet();
    final customers = await Customer.db.find(
      session,
      where: (t) => t.id.inSet(customerIds),
    );
    final customerMap = {for (final c in customers) c.id!: c};

    // Get existing recall contacts for this batch
    final contacts = await RecallContact.db.find(
      session,
      where: (t) =>
          t.batchNumber.equals(batchNumber) &
          t.artistProfileId.inSet(profileIds.toSet()),
    );
    final contactedSet = {
      for (final c in contacts) '${c.artistProfileId}|${c.customerId}',
    };

    // Build results
    final results = <RecallMatch>[];
    for (final mat in materials) {
      final appt = appointmentMap[mat.appointmentId];
      if (appt == null) continue;

      final customer = customerMap[appt.customerId];
      if (customer == null) continue;

      results.add(RecallMatch(
        appointmentId: appt.id!,
        appointmentDate: appt.scheduledAt,
        customerName: customer.name,
        customerContact: customer.email ?? customer.phone ?? '',
        artistProfileName: profileMap[appt.artistProfileId] ?? '',
        contacted: contactedSet
            .contains('${appt.artistProfileId}|${appt.customerId}'),
      ));
    }

    return results;
  }

  /// Mark a customer as contacted for a specific batch recall.
  Future<void> markContacted(
    Session session,
    UuidValue customerId,
    String batchNumber,
  ) async {
    final authUserId = session.authenticated!.userIdentifier;
    final profiles = await ArtistProfile.db.find(
      session,
      where: (t) => t.authUserId.equals(UuidValue.fromString(authUserId)),
    );
    final profileIds = profiles.map((p) => p.id!).toSet();

    // Find which profile owns this customer
    final customer = await Customer.db.findById(session, customerId);
    if (customer == null || !profileIds.contains(customer.artistProfileId)) {
      throw ArgumentError('Customer not found');
    }

    // Upsert recall contact
    final existing = await RecallContact.db.findFirstRow(
      session,
      where: (t) =>
          t.artistProfileId.equals(customer.artistProfileId) &
          t.customerId.equals(customerId) &
          t.batchNumber.equals(batchNumber),
    );
    if (existing == null) {
      await RecallContact.db.insertRow(
        session,
        RecallContact(
          artistProfileId: customer.artistProfileId,
          customerId: customerId,
          batchNumber: batchNumber,
        ),
      );
    }
  }

  /// Unmark a customer as contacted for a specific batch recall.
  Future<void> unmarkContacted(
    Session session,
    UuidValue customerId,
    String batchNumber,
  ) async {
    final authUserId = session.authenticated!.userIdentifier;
    final profiles = await ArtistProfile.db.find(
      session,
      where: (t) => t.authUserId.equals(UuidValue.fromString(authUserId)),
    );
    final profileIds = profiles.map((p) => p.id!).toSet();

    final customer = await Customer.db.findById(session, customerId);
    if (customer == null || !profileIds.contains(customer.artistProfileId)) {
      throw ArgumentError('Customer not found');
    }

    final existing = await RecallContact.db.findFirstRow(
      session,
      where: (t) =>
          t.artistProfileId.equals(customer.artistProfileId) &
          t.customerId.equals(customerId) &
          t.batchNumber.equals(batchNumber),
    );
    if (existing != null) {
      await RecallContact.db.deleteRow(session, existing);
    }
  }
}
