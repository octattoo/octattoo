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

/// The immutable, hash-sealed snapshot of an Appointment's traceability fields.
abstract class SessionRecord implements _i1.SerializableModel {
  SessionRecord._({
    this.id,
    required this.appointmentId,
    required this.hash,
    required this.sealedAt,
    required this.version,
    this.previousHash,
    this.reason,
  });

  factory SessionRecord({
    _i1.UuidValue? id,
    required _i1.UuidValue appointmentId,
    required String hash,
    required DateTime sealedAt,
    required int version,
    String? previousHash,
    String? reason,
  }) = _SessionRecordImpl;

  factory SessionRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return SessionRecord(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      appointmentId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['appointmentId'],
      ),
      hash: jsonSerialization['hash'] as String,
      sealedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['sealedAt'],
      ),
      version: jsonSerialization['version'] as int,
      previousHash: jsonSerialization['previousHash'] as String?,
      reason: jsonSerialization['reason'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  /// The appointment this record seals.
  _i1.UuidValue appointmentId;

  /// SHA-256 hex hash of canonical traceability fields.
  String hash;

  /// When this record was sealed.
  DateTime sealedAt;

  /// Version number (starts at 1, increments on amendment).
  int version;

  /// Hash of the previous version (null for v1).
  String? previousHash;

  /// Reason for amendment (null for v1, required for v2+).
  String? reason;

  /// Returns a shallow copy of this [SessionRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SessionRecord copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? appointmentId,
    String? hash,
    DateTime? sealedAt,
    int? version,
    String? previousHash,
    String? reason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SessionRecord',
      if (id != null) 'id': id?.toJson(),
      'appointmentId': appointmentId.toJson(),
      'hash': hash,
      'sealedAt': sealedAt.toJson(),
      'version': version,
      if (previousHash != null) 'previousHash': previousHash,
      if (reason != null) 'reason': reason,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SessionRecordImpl extends SessionRecord {
  _SessionRecordImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue appointmentId,
    required String hash,
    required DateTime sealedAt,
    required int version,
    String? previousHash,
    String? reason,
  }) : super._(
         id: id,
         appointmentId: appointmentId,
         hash: hash,
         sealedAt: sealedAt,
         version: version,
         previousHash: previousHash,
         reason: reason,
       );

  /// Returns a shallow copy of this [SessionRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SessionRecord copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? appointmentId,
    String? hash,
    DateTime? sealedAt,
    int? version,
    Object? previousHash = _Undefined,
    Object? reason = _Undefined,
  }) {
    return SessionRecord(
      id: id is _i1.UuidValue? ? id : this.id,
      appointmentId: appointmentId ?? this.appointmentId,
      hash: hash ?? this.hash,
      sealedAt: sealedAt ?? this.sealedAt,
      version: version ?? this.version,
      previousHash: previousHash is String? ? previousHash : this.previousHash,
      reason: reason is String? ? reason : this.reason,
    );
  }
}
