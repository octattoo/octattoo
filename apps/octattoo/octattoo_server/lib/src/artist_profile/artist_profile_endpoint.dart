import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../theming/css_palette.dart';
import 'handle_validator.dart';

class ArtistProfileEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Creates a new Artist Profile for the authenticated account.
  Future<ArtistProfile> createProfile(
    Session session,
    String name,
    String handle,
  ) async {
    if (!HandleValidator.isValid(handle)) {
      throw ArgumentError('Invalid handle format');
    }

    final existing = await ArtistProfile.db.findFirstRow(
      session,
      where: (t) => t.handle.equals(handle),
    );
    if (existing != null) {
      throw ArgumentError('Handle already taken');
    }

    final authUserId = session.authenticated!.userIdentifier;
    return await ArtistProfile.db.insertRow(
      session,
      ArtistProfile(
        authUserId: UuidValue.fromString(authUserId),
        name: name,
        handle: handle,
      ),
    );
  }

  /// Checks if a handle is available.
  Future<bool> isHandleAvailable(Session session, String handle) async {
    if (!HandleValidator.isValid(handle)) {
      throw ArgumentError('Invalid handle format');
    }

    final existing = await ArtistProfile.db.findFirstRow(
      session,
      where: (t) => t.handle.equals(handle),
    );
    return existing == null;
  }

  /// Returns all profiles for the authenticated account.
  Future<List<ArtistProfile>> listMyProfiles(Session session) async {
    final authUserId = session.authenticated!.userIdentifier;
    return await ArtistProfile.db.find(
      session,
      where: (t) => t.authUserId.equals(UuidValue.fromString(authUserId)),
    );
  }

  /// Updates the handle for a profile owned by the authenticated account.
  Future<ArtistProfile> updateHandle(
    Session session,
    UuidValue profileId,
    String newHandle,
  ) async {
    if (!HandleValidator.isValid(newHandle)) {
      throw ArgumentError('Invalid handle format');
    }

    final authUserId = session.authenticated!.userIdentifier;
    final profile = await ArtistProfile.db.findById(session, profileId);

    if (profile == null ||
        profile.authUserId != UuidValue.fromString(authUserId)) {
      throw ArgumentError('Profile not found');
    }

    final taken = await ArtistProfile.db.findFirstRow(
      session,
      where: (t) => t.handle.equals(newHandle),
    );
    if (taken != null && taken.id != profileId) {
      throw ArgumentError('Handle already taken');
    }

    final updated = profile.copyWith(handle: newHandle);
    return await ArtistProfile.db.updateRow(session, updated);
  }

  /// Suggests an available handle based on a display name.
  Future<String> suggestHandle(Session session, String name) async {
    var base = name
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9_\s]'), '')
        .trim()
        .replaceAll(RegExp(r'\s+'), '_');

    // Ensure starts with letter
    base = base.replaceAll(RegExp(r'^[^a-z]+'), '');

    // Pad if too short
    if (base.length < 3) {
      base = '${base}artist'.substring(0, 3);
    }

    // Truncate if too long
    if (base.length > 30) {
      base = base.substring(0, 30);
    }

    if (HandleValidator.isValid(base)) {
      final taken = await ArtistProfile.db.findFirstRow(
        session,
        where: (t) => t.handle.equals(base),
      );
      if (taken == null) return base;
    }

    // Append numeric suffix
    for (var i = 1; i < 1000; i++) {
      final suffix = i.toString();
      final candidate =
          '${base.substring(0, (30 - suffix.length).clamp(0, base.length))}$suffix';
      if (!HandleValidator.isValid(candidate)) continue;
      final taken = await ArtistProfile.db.findFirstRow(
        session,
        where: (t) => t.handle.equals(candidate),
      );
      if (taken == null) return candidate;
    }

    throw StateError('Could not generate available handle');
  }

  /// Updates the seed color for a profile and regenerates the CSS palette.
  Future<ArtistProfile> updateSeedColor(
    Session session,
    UuidValue profileId,
    int? seedColor,
  ) async {
    final authUserId = session.authenticated!.userIdentifier;
    final profile = await ArtistProfile.db.findById(session, profileId);

    if (profile == null ||
        profile.authUserId != UuidValue.fromString(authUserId)) {
      throw ArgumentError('Profile not found');
    }

    String? cssLight;
    String? cssDark;
    if (seedColor != null) {
      final palette = generateCssPalette(seedColor);
      cssLight = palette.light;
      cssDark = palette.dark;
    }

    final updated = profile.copyWith(
      seedColor: seedColor,
      themeCssLight: cssLight,
      themeCssDark: cssDark,
    );
    return await ArtistProfile.db.updateRow(session, updated);
  }
}
