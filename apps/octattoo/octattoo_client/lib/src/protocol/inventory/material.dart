/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../inventory/material_type.dart' as _i2;
import '../inventory/material_status.dart' as _i3;

/// A physical item (ink or needle) in an artist's personal inventory.
abstract class Material implements _i1.SerializableModel {
  Material._({
    this.id,
    required this.artistProfileId,
    required this.type,
    required this.manufacturer,
    required this.supplier,
    required this.productName,
    required this.batchNumber,
    required this.expirationDate,
    required this.status,
    this.quantity,
    this.createdAt,
  });

  factory Material({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required _i2.MaterialType type,
    required String manufacturer,
    required String supplier,
    required String productName,
    required String batchNumber,
    required DateTime expirationDate,
    required _i3.MaterialStatus status,
    int? quantity,
    DateTime? createdAt,
  }) = _MaterialImpl;

  factory Material.fromJson(Map<String, dynamic> jsonSerialization) {
    return Material(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      artistProfileId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['artistProfileId'],
      ),
      type: _i2.MaterialType.fromJson((jsonSerialization['type'] as String)),
      manufacturer: jsonSerialization['manufacturer'] as String,
      supplier: jsonSerialization['supplier'] as String,
      productName: jsonSerialization['productName'] as String,
      batchNumber: jsonSerialization['batchNumber'] as String,
      expirationDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expirationDate'],
      ),
      status: _i3.MaterialStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      quantity: jsonSerialization['quantity'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  /// The artist profile this material belongs to.
  _i1.UuidValue artistProfileId;

  /// Ink or needle.
  _i2.MaterialType type;

  /// Manufacturer name.
  String manufacturer;

  /// Supplier name.
  String supplier;

  /// Product name.
  String productName;

  /// Batch number (key field for recall searches).
  String batchNumber;

  /// Expiration date.
  DateTime expirationDate;

  /// Current stock status.
  _i3.MaterialStatus status;

  /// Quantity (needles only, null for ink).
  int? quantity;

  /// When this material was created.
  DateTime? createdAt;

  /// Returns a shallow copy of this [Material]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Material copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? artistProfileId,
    _i2.MaterialType? type,
    String? manufacturer,
    String? supplier,
    String? productName,
    String? batchNumber,
    DateTime? expirationDate,
    _i3.MaterialStatus? status,
    int? quantity,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Material',
      if (id != null) 'id': id?.toJson(),
      'artistProfileId': artistProfileId.toJson(),
      'type': type.toJson(),
      'manufacturer': manufacturer,
      'supplier': supplier,
      'productName': productName,
      'batchNumber': batchNumber,
      'expirationDate': expirationDate.toJson(),
      'status': status.toJson(),
      if (quantity != null) 'quantity': quantity,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MaterialImpl extends Material {
  _MaterialImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required _i2.MaterialType type,
    required String manufacturer,
    required String supplier,
    required String productName,
    required String batchNumber,
    required DateTime expirationDate,
    required _i3.MaterialStatus status,
    int? quantity,
    DateTime? createdAt,
  }) : super._(
         id: id,
         artistProfileId: artistProfileId,
         type: type,
         manufacturer: manufacturer,
         supplier: supplier,
         productName: productName,
         batchNumber: batchNumber,
         expirationDate: expirationDate,
         status: status,
         quantity: quantity,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Material]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Material copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? artistProfileId,
    _i2.MaterialType? type,
    String? manufacturer,
    String? supplier,
    String? productName,
    String? batchNumber,
    DateTime? expirationDate,
    _i3.MaterialStatus? status,
    Object? quantity = _Undefined,
    Object? createdAt = _Undefined,
  }) {
    return Material(
      id: id is _i1.UuidValue? ? id : this.id,
      artistProfileId: artistProfileId ?? this.artistProfileId,
      type: type ?? this.type,
      manufacturer: manufacturer ?? this.manufacturer,
      supplier: supplier ?? this.supplier,
      productName: productName ?? this.productName,
      batchNumber: batchNumber ?? this.batchNumber,
      expirationDate: expirationDate ?? this.expirationDate,
      status: status ?? this.status,
      quantity: quantity is int? ? quantity : this.quantity,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}
