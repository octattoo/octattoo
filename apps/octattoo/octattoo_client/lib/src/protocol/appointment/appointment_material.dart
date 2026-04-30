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

/// A material linked to an appointment with snapshot data for traceability.
abstract class AppointmentMaterial implements _i1.SerializableModel {
  AppointmentMaterial._({
    this.id,
    required this.appointmentId,
    required this.materialId,
    required this.manufacturer,
    required this.productName,
    required this.batchNumber,
    this.linkedAt,
  });

  factory AppointmentMaterial({
    _i1.UuidValue? id,
    required _i1.UuidValue appointmentId,
    required _i1.UuidValue materialId,
    required String manufacturer,
    required String productName,
    required String batchNumber,
    DateTime? linkedAt,
  }) = _AppointmentMaterialImpl;

  factory AppointmentMaterial.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppointmentMaterial(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      appointmentId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['appointmentId'],
      ),
      materialId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['materialId'],
      ),
      manufacturer: jsonSerialization['manufacturer'] as String,
      productName: jsonSerialization['productName'] as String,
      batchNumber: jsonSerialization['batchNumber'] as String,
      linkedAt: jsonSerialization['linkedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['linkedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  /// The appointment this material is linked to.
  _i1.UuidValue appointmentId;

  /// The source material from inventory.
  _i1.UuidValue materialId;

  /// Snapshot: manufacturer at link time.
  String manufacturer;

  /// Snapshot: product name at link time.
  String productName;

  /// Snapshot: batch number at link time.
  String batchNumber;

  /// When this material was linked.
  DateTime? linkedAt;

  /// Returns a shallow copy of this [AppointmentMaterial]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppointmentMaterial copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? appointmentId,
    _i1.UuidValue? materialId,
    String? manufacturer,
    String? productName,
    String? batchNumber,
    DateTime? linkedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppointmentMaterial',
      if (id != null) 'id': id?.toJson(),
      'appointmentId': appointmentId.toJson(),
      'materialId': materialId.toJson(),
      'manufacturer': manufacturer,
      'productName': productName,
      'batchNumber': batchNumber,
      if (linkedAt != null) 'linkedAt': linkedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppointmentMaterialImpl extends AppointmentMaterial {
  _AppointmentMaterialImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue appointmentId,
    required _i1.UuidValue materialId,
    required String manufacturer,
    required String productName,
    required String batchNumber,
    DateTime? linkedAt,
  }) : super._(
         id: id,
         appointmentId: appointmentId,
         materialId: materialId,
         manufacturer: manufacturer,
         productName: productName,
         batchNumber: batchNumber,
         linkedAt: linkedAt,
       );

  /// Returns a shallow copy of this [AppointmentMaterial]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppointmentMaterial copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? appointmentId,
    _i1.UuidValue? materialId,
    String? manufacturer,
    String? productName,
    String? batchNumber,
    Object? linkedAt = _Undefined,
  }) {
    return AppointmentMaterial(
      id: id is _i1.UuidValue? ? id : this.id,
      appointmentId: appointmentId ?? this.appointmentId,
      materialId: materialId ?? this.materialId,
      manufacturer: manufacturer ?? this.manufacturer,
      productName: productName ?? this.productName,
      batchNumber: batchNumber ?? this.batchNumber,
      linkedAt: linkedAt is DateTime? ? linkedAt : this.linkedAt,
    );
  }
}
