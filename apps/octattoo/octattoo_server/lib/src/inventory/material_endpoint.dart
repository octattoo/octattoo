import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'expiration_filter.dart';

class MaterialEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Validates type-specific fields on create/update.
  void validateMaterial({
    required MaterialType type,
    required int? quantity,
  }) {
    if (type == MaterialType.needle) {
      if (quantity == null || quantity <= 0) {
        throw ArgumentError('Needle materials require quantity > 0');
      }
    }
    if (type == MaterialType.ink && quantity != null) {
      throw ArgumentError('Ink materials must not have a quantity');
    }
  }

  /// Creates a material in the artist's personal inventory.
  Future<Material> createMaterial(
    Session session, {
    required MaterialType type,
    required String manufacturer,
    required String supplier,
    required String productName,
    required String batchNumber,
    required DateTime expirationDate,
    int? quantity,
  }) async {
    validateMaterial(type: type, quantity: quantity);

    final artistProfileId = await _getArtistProfileId(session);

    final status = MaterialStatus.inStock;

    return Material.db.insertRow(
      session,
      Material(
        artistProfileId: artistProfileId,
        type: type,
        manufacturer: manufacturer,
        supplier: supplier,
        productName: productName,
        batchNumber: batchNumber,
        expirationDate: expirationDate,
        status: status,
        quantity: quantity,
      ),
    );
  }

  /// Lists materials for the current artist profile.
  Future<List<Material>> listMaterials(
    Session session, {
    MaterialType? type,
    String? search,
  }) async {
    final artistProfileId = await _getArtistProfileId(session);

    return Material.db.find(
      session,
      where: (t) {
        var condition = t.artistProfileId.equals(artistProfileId);
        if (type != null) {
          condition = condition & t.type.equals(type);
        }
        if (search != null && search.isNotEmpty) {
          condition = condition &
              (t.productName.ilike('%$search%') |
                  t.manufacturer.ilike('%$search%') |
                  t.batchNumber.ilike('%$search%'));
        }
        return condition;
      },
      orderBy: (t) => t.productName,
    );
  }

  /// Gets a single material by ID (scoped to artist profile).
  Future<Material?> getMaterial(Session session, UuidValue materialId) async {
    final artistProfileId = await _getArtistProfileId(session);

    return Material.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(materialId) & t.artistProfileId.equals(artistProfileId),
    );
  }

  /// Updates a material (scoped to artist profile).
  Future<Material?> updateMaterial(
    Session session, {
    required UuidValue materialId,
    required String manufacturer,
    required String supplier,
    required String productName,
    required String batchNumber,
    required DateTime expirationDate,
  }) async {
    final artistProfileId = await _getArtistProfileId(session);

    final existing = await Material.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(materialId) & t.artistProfileId.equals(artistProfileId),
    );

    if (existing == null) return null;

    existing.manufacturer = manufacturer;
    existing.supplier = supplier;
    existing.productName = productName;
    existing.batchNumber = batchNumber;
    existing.expirationDate = expirationDate;

    return Material.db.updateRow(session, existing);
  }

  /// Deletes a material (scoped to artist profile).
  Future<bool> deleteMaterial(Session session, UuidValue materialId) async {
    final artistProfileId = await _getArtistProfileId(session);

    final existing = await Material.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(materialId) & t.artistProfileId.equals(artistProfileId),
    );

    if (existing == null) return false;

    await Material.db.deleteRow(session, existing);
    return true;
  }

  /// Toggles ink status between inStock and empty.
  Future<Material?> toggleInkStatus(
    Session session,
    UuidValue materialId,
  ) async {
    final artistProfileId = await _getArtistProfileId(session);

    final existing = await Material.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(materialId) & t.artistProfileId.equals(artistProfileId),
    );

    if (existing == null) return null;
    if (existing.type != MaterialType.ink) {
      throw ArgumentError('toggleInkStatus is only valid for ink materials');
    }

    existing.status = existing.status == MaterialStatus.inStock
        ? MaterialStatus.empty
        : MaterialStatus.inStock;

    return Material.db.updateRow(session, existing);
  }

  /// Sets needle quantity. Auto-marks empty when quantity reaches 0.
  Future<Material?> setNeedleQuantity(
    Session session, {
    required UuidValue materialId,
    required int quantity,
  }) async {
    if (quantity < 0) {
      throw ArgumentError('Quantity cannot be negative');
    }

    final artistProfileId = await _getArtistProfileId(session);

    final existing = await Material.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(materialId) & t.artistProfileId.equals(artistProfileId),
    );

    if (existing == null) return null;
    if (existing.type != MaterialType.needle) {
      throw ArgumentError('setNeedleQuantity is only valid for needle materials');
    }

    existing.quantity = quantity;
    existing.status =
        quantity == 0 ? MaterialStatus.empty : MaterialStatus.inStock;

    return Material.db.updateRow(session, existing);
  }

  /// Lists materials nearing expiration for the current artist profile.
  Future<List<Material>> listExpiringMaterials(Session session) async {
    final artistProfileId = await _getArtistProfileId(session);

    final profile = await ArtistProfile.db.findFirstRow(
      session,
      where: (t) => t.id.equals(artistProfileId),
    );

    final materials = await Material.db.find(
      session,
      where: (t) =>
          t.artistProfileId.equals(artistProfileId) &
          t.status.equals(MaterialStatus.inStock),
    );

    return ExpirationFilter.filterExpiring(
      materials,
      thresholdDays: profile?.expirationAlertDays ?? 30,
      now: DateTime.now(),
    );
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
