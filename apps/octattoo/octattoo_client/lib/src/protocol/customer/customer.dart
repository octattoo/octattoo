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

/// A person who receives tattoos. Scoped to a single Artist Profile.
abstract class Customer implements _i1.SerializableModel {
  Customer._({
    this.id,
    required this.artistProfileId,
    required this.name,
    this.email,
    this.phone,
    this.notes,
    this.createdAt,
  });

  factory Customer({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required String name,
    String? email,
    String? phone,
    String? notes,
    DateTime? createdAt,
  }) = _CustomerImpl;

  factory Customer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Customer(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      artistProfileId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['artistProfileId'],
      ),
      name: jsonSerialization['name'] as String,
      email: jsonSerialization['email'] as String?,
      phone: jsonSerialization['phone'] as String?,
      notes: jsonSerialization['notes'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  /// The artist profile this customer belongs to.
  _i1.UuidValue artistProfileId;

  /// Display name.
  String name;

  /// Contact email (at least one of email/phone required).
  String? email;

  /// Contact phone (at least one of email/phone required).
  String? phone;

  /// Free-form notes.
  String? notes;

  /// When this customer was created.
  DateTime? createdAt;

  /// Returns a shallow copy of this [Customer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Customer copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? artistProfileId,
    String? name,
    String? email,
    String? phone,
    String? notes,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Customer',
      if (id != null) 'id': id?.toJson(),
      'artistProfileId': artistProfileId.toJson(),
      'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerImpl extends Customer {
  _CustomerImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required String name,
    String? email,
    String? phone,
    String? notes,
    DateTime? createdAt,
  }) : super._(
         id: id,
         artistProfileId: artistProfileId,
         name: name,
         email: email,
         phone: phone,
         notes: notes,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Customer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Customer copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? artistProfileId,
    String? name,
    Object? email = _Undefined,
    Object? phone = _Undefined,
    Object? notes = _Undefined,
    Object? createdAt = _Undefined,
  }) {
    return Customer(
      id: id is _i1.UuidValue? ? id : this.id,
      artistProfileId: artistProfileId ?? this.artistProfileId,
      name: name ?? this.name,
      email: email is String? ? email : this.email,
      phone: phone is String? ? phone : this.phone,
      notes: notes is String? ? notes : this.notes,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}
