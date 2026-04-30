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
    this.seedColor,
    this.themeCssLight,
    this.themeCssDark,
  }) : expirationAlertDays = expirationAlertDays ?? 30,
       storageQuotaBytes = storageQuotaBytes ?? 524288000;

  factory ArtistProfile({
    _i1.UuidValue? id,
    required _i1.UuidValue authUserId,
    required String name,
    required String handle,
    int? expirationAlertDays,
    int? storageQuotaBytes,
    int? seedColor,
    String? themeCssLight,
    String? themeCssDark,
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
      seedColor: jsonSerialization['seedColor'] as int?,
      themeCssLight: jsonSerialization['themeCssLight'] as String?,
      themeCssDark: jsonSerialization['themeCssDark'] as String?,
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

  /// ARGB seed color for Material You theming (null = default theme).
  int? seedColor;

  /// Pre-computed light-mode CSS custom properties.
  String? themeCssLight;

  /// Pre-computed dark-mode CSS custom properties.
  String? themeCssDark;

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
    int? seedColor,
    String? themeCssLight,
    String? themeCssDark,
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
      if (seedColor != null) 'seedColor': seedColor,
      if (themeCssLight != null) 'themeCssLight': themeCssLight,
      if (themeCssDark != null) 'themeCssDark': themeCssDark,
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
    int? seedColor,
    String? themeCssLight,
    String? themeCssDark,
  }) : super._(
         id: id,
         authUserId: authUserId,
         name: name,
         handle: handle,
         expirationAlertDays: expirationAlertDays,
         storageQuotaBytes: storageQuotaBytes,
         seedColor: seedColor,
         themeCssLight: themeCssLight,
         themeCssDark: themeCssDark,
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
    Object? seedColor = _Undefined,
    Object? themeCssLight = _Undefined,
    Object? themeCssDark = _Undefined,
  }) {
    return ArtistProfile(
      id: id is _i1.UuidValue? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      name: name ?? this.name,
      handle: handle ?? this.handle,
      expirationAlertDays: expirationAlertDays ?? this.expirationAlertDays,
      storageQuotaBytes: storageQuotaBytes ?? this.storageQuotaBytes,
      seedColor: seedColor is int? ? seedColor : this.seedColor,
      themeCssLight: themeCssLight is String?
          ? themeCssLight
          : this.themeCssLight,
      themeCssDark: themeCssDark is String? ? themeCssDark : this.themeCssDark,
    );
  }
}
