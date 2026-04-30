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

/// An artist's brand identity. One Account can have many Artist Profiles.
abstract class ArtistProfile implements _i1.SerializableModel {
  ArtistProfile._({
    this.id,
    required this.authUserId,
    required this.name,
    required this.handle,
    int? expirationAlertDays,
    int? storageQuotaBytes,
  }) : expirationAlertDays = expirationAlertDays ?? 30,
       storageQuotaBytes = storageQuotaBytes ?? 524288000;

  factory ArtistProfile({
    _i1.UuidValue? id,
    required _i1.UuidValue authUserId,
    required String name,
    required String handle,
    int? expirationAlertDays,
    int? storageQuotaBytes,
  }) = _ArtistProfileImpl;

  factory ArtistProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtistProfile(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      name: jsonSerialization['name'] as String,
      handle: jsonSerialization['handle'] as String,
      expirationAlertDays: jsonSerialization['expirationAlertDays'] as int?,
      storageQuotaBytes: jsonSerialization['storageQuotaBytes'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  /// The auth user this profile belongs to.
  _i1.UuidValue authUserId;

  /// Display name for the artist.
  String name;

  /// Unique URL slug for the profile.
  String handle;

  /// Days before expiration to trigger alerts (default 30).
  int expirationAlertDays;

  /// Storage quota in bytes (default 500MB free tier).
  int storageQuotaBytes;

  /// Returns a shallow copy of this [ArtistProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtistProfile copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? authUserId,
    String? name,
    String? handle,
    int? expirationAlertDays,
    int? storageQuotaBytes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ArtistProfile',
      if (id != null) 'id': id?.toJson(),
      'authUserId': authUserId.toJson(),
      'name': name,
      'handle': handle,
      'expirationAlertDays': expirationAlertDays,
      'storageQuotaBytes': storageQuotaBytes,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtistProfileImpl extends ArtistProfile {
  _ArtistProfileImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue authUserId,
    required String name,
    required String handle,
    int? expirationAlertDays,
    int? storageQuotaBytes,
  }) : super._(
         id: id,
         authUserId: authUserId,
         name: name,
         handle: handle,
         expirationAlertDays: expirationAlertDays,
         storageQuotaBytes: storageQuotaBytes,
       );

  /// Returns a shallow copy of this [ArtistProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtistProfile copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    String? name,
    String? handle,
    int? expirationAlertDays,
    int? storageQuotaBytes,
  }) {
    return ArtistProfile(
      id: id is _i1.UuidValue? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      name: name ?? this.name,
      handle: handle ?? this.handle,
      expirationAlertDays: expirationAlertDays ?? this.expirationAlertDays,
      storageQuotaBytes: storageQuotaBytes ?? this.storageQuotaBytes,
    );
  }
}
