import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class CustomerEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Validates that at least one of email/phone is provided.
  void validateContact({required String? email, required String? phone}) {
    if (email == null && phone == null) {
      throw ArgumentError('At least one of email or phone is required');
    }
  }

  /// Finds duplicates in a list by matching email or phone.
  List<Customer> findDuplicatesIn({
    required String? email,
    required String? phone,
    required List<Customer> existing,
  }) {
    return existing.where((c) {
      if (email != null && c.email == email) return true;
      if (phone != null && c.phone == phone) return true;
      return false;
    }).toList();
  }

  /// Creates a customer, returning potential duplicates.
  Future<CreateCustomerResult> createCustomer(
    Session session, {
    required String name,
    String? email,
    String? phone,
    String? notes,
  }) async {
    validateContact(email: email, phone: phone);

    final artistProfileId = await _getArtistProfileId(session);

    // Check for duplicates
    final existing = await Customer.db.find(
      session,
      where: (t) {
        final conditions = <Expression>[];
        conditions.add(t.artistProfileId.equals(artistProfileId));
        if (email != null) conditions.add(t.email.equals(email));
        if (phone != null) conditions.add(t.phone.equals(phone));
        // Match any contact field within same profile
        if (email != null || phone != null) {
          final contactMatch = <Expression>[];
          if (email != null) contactMatch.add(t.email.equals(email));
          if (phone != null) contactMatch.add(t.phone.equals(phone));
          return t.artistProfileId.equals(artistProfileId) &
              contactMatch.reduce((a, b) => a | b);
        }
        return t.artistProfileId.equals(artistProfileId);
      },
    );

    final customer = await Customer.db.insertRow(
      session,
      Customer(
        artistProfileId: artistProfileId,
        name: name,
        email: email,
        phone: phone,
        notes: notes,
      ),
    );

    return CreateCustomerResult(
      customer: customer,
      potentialDuplicates: existing,
    );
  }

  /// Lists customers for the current artist profile.
  Future<List<Customer>> listCustomers(
    Session session, {
    String? search,
  }) async {
    final artistProfileId = await _getArtistProfileId(session);

    return Customer.db.find(
      session,
      where: (t) {
        var condition = t.artistProfileId.equals(artistProfileId);
        if (search != null && search.isNotEmpty) {
          condition =
              condition &
              (t.name.ilike('%$search%') |
                  t.email.ilike('%$search%') |
                  t.phone.ilike('%$search%'));
        }
        return condition;
      },
      orderBy: (t) => t.name,
    );
  }

  /// Gets a single customer by ID (scoped to artist profile).
  Future<Customer?> getCustomer(Session session, UuidValue customerId) async {
    final artistProfileId = await _getArtistProfileId(session);

    return Customer.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(customerId) & t.artistProfileId.equals(artistProfileId),
    );
  }

  /// Updates a customer (scoped to artist profile).
  Future<Customer?> updateCustomer(
    Session session, {
    required UuidValue customerId,
    required String name,
    String? email,
    String? phone,
    String? notes,
  }) async {
    validateContact(email: email, phone: phone);

    final artistProfileId = await _getArtistProfileId(session);

    final existing = await Customer.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(customerId) & t.artistProfileId.equals(artistProfileId),
    );

    if (existing == null) return null;

    existing.name = name;
    existing.email = email;
    existing.phone = phone;
    existing.notes = notes;

    return Customer.db.updateRow(session, existing);
  }

  /// Deletes a customer (scoped to artist profile).
  Future<bool> deleteCustomer(Session session, UuidValue customerId) async {
    final artistProfileId = await _getArtistProfileId(session);

    final existing = await Customer.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(customerId) & t.artistProfileId.equals(artistProfileId),
    );

    if (existing == null) return false;

    await Customer.db.deleteRow(session, existing);
    return true;
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
