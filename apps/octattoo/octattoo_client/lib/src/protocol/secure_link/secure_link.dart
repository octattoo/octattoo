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
import '../secure_link/secure_link_type.dart' as _i2;
import '../secure_link/secure_link_status.dart' as _i3;

/// A tokenized, expiring link for client-facing features.
abstract class SecureLink implements _i1.SerializableModel {
  SecureLink._({
    this.id,
    required this.artistProfileId,
    required this.token,
    required this.type,
    required this.targetId,
    required this.expiresAt,
    required this.createdAt,
    this.renewedAt,
    required this.status,
  });

  factory SecureLink({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required String token,
    required _i2.SecureLinkType type,
    required _i1.UuidValue targetId,
    required DateTime expiresAt,
    required DateTime createdAt,
    DateTime? renewedAt,
    required _i3.SecureLinkStatus status,
  }) = _SecureLinkImpl;

  factory SecureLink.fromJson(Map<String, dynamic> jsonSerialization) {
    return SecureLink(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      artistProfileId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['artistProfileId'],
      ),
      token: jsonSerialization['token'] as String,
      type: _i2.SecureLinkType.fromJson((jsonSerialization['type'] as String)),
      targetId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['targetId'],
      ),
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      renewedAt: jsonSerialization['renewedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['renewedAt']),
      status: _i3.SecureLinkStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  /// The artist profile that owns this link.
  _i1.UuidValue artistProfileId;

  /// Unique base62 token (10 chars), permanently claimed.
  String token;

  /// The type of resource this link points to.
  _i2.SecureLinkType type;

  /// The ID of the target resource (quote, consent, etc.).
  _i1.UuidValue targetId;

  /// When this link expires.
  DateTime expiresAt;

  /// When this link was created.
  DateTime createdAt;

  /// When this link was last renewed (null if never renewed).
  DateTime? renewedAt;

  /// Current status of the link.
  _i3.SecureLinkStatus status;

  /// Returns a shallow copy of this [SecureLink]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SecureLink copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? artistProfileId,
    String? token,
    _i2.SecureLinkType? type,
    _i1.UuidValue? targetId,
    DateTime? expiresAt,
    DateTime? createdAt,
    DateTime? renewedAt,
    _i3.SecureLinkStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SecureLink',
      if (id != null) 'id': id?.toJson(),
      'artistProfileId': artistProfileId.toJson(),
      'token': token,
      'type': type.toJson(),
      'targetId': targetId.toJson(),
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      if (renewedAt != null) 'renewedAt': renewedAt?.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SecureLinkImpl extends SecureLink {
  _SecureLinkImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required String token,
    required _i2.SecureLinkType type,
    required _i1.UuidValue targetId,
    required DateTime expiresAt,
    required DateTime createdAt,
    DateTime? renewedAt,
    required _i3.SecureLinkStatus status,
  }) : super._(
         id: id,
         artistProfileId: artistProfileId,
         token: token,
         type: type,
         targetId: targetId,
         expiresAt: expiresAt,
         createdAt: createdAt,
         renewedAt: renewedAt,
         status: status,
       );

  /// Returns a shallow copy of this [SecureLink]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SecureLink copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? artistProfileId,
    String? token,
    _i2.SecureLinkType? type,
    _i1.UuidValue? targetId,
    DateTime? expiresAt,
    DateTime? createdAt,
    Object? renewedAt = _Undefined,
    _i3.SecureLinkStatus? status,
  }) {
    return SecureLink(
      id: id is _i1.UuidValue? ? id : this.id,
      artistProfileId: artistProfileId ?? this.artistProfileId,
      token: token ?? this.token,
      type: type ?? this.type,
      targetId: targetId ?? this.targetId,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      renewedAt: renewedAt is DateTime? ? renewedAt : this.renewedAt,
      status: status ?? this.status,
    );
  }
}
