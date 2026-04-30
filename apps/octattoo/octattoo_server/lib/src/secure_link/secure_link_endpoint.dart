import 'dart:math';

import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class SecureLinkEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _base62Chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  static const _tokenLength = 10;

  static const _defaultExpirationDays = {
    SecureLinkType.quote: 14,
    SecureLinkType.consent: 7,
    SecureLinkType.booking: 14,
    SecureLinkType.aftercare: 90,
    SecureLinkType.invoice: 365,
  };

  /// Creates a new secure link with a unique token.
  Future<SecureLink> createLink(
    Session session, {
    required SecureLinkType type,
    required UuidValue targetId,
    int? expiresInDays,
  }) async {
    final artistProfileId = await _getArtistProfileId(session);
    final token = await _generateUniqueToken(session);
    final now = DateTime.now().toUtc();
    final days = expiresInDays ?? _defaultExpirationDays[type]!;
    final expiresAt = now.add(Duration(days: days));

    return SecureLink.db.insertRow(
      session,
      SecureLink(
        artistProfileId: artistProfileId,
        token: token,
        type: type,
        targetId: targetId,
        expiresAt: expiresAt,
        createdAt: now,
        status: SecureLinkStatus.active,
      ),
    );
  }

  /// Resolves a token to its link data. Returns null if not found or expired.
  Future<SecureLink?> resolveLink(Session session, String token) async {
    final link = await SecureLink.db.findFirstRow(
      session,
      where: (t) => t.token.equals(token),
    );
    if (link == null) return null;
    if (link.expiresAt.isBefore(DateTime.now().toUtc())) return null;
    return link;
  }

  /// Renews an expired link, extending its expiration by the type default.
  Future<SecureLink?> renewLink(Session session, UuidValue linkId) async {
    final artistProfileId = await _getArtistProfileId(session);
    final link = await SecureLink.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(linkId) & t.artistProfileId.equals(artistProfileId),
    );
    if (link == null) return null;

    final now = DateTime.now().toUtc();
    link.expiresAt = now.add(Duration(days: _defaultExpirationDays[link.type]!));
    link.renewedAt = now;
    link.status = SecureLinkStatus.active;

    return SecureLink.db.updateRow(session, link);
  }

  String _generateToken() {
    final random = Random.secure();
    return String.fromCharCodes(
      List.generate(
        _tokenLength,
        (_) => _base62Chars.codeUnitAt(random.nextInt(_base62Chars.length)),
      ),
    );
  }

  Future<String> _generateUniqueToken(Session session) async {
    for (var i = 0; i < 10; i++) {
      final token = _generateToken();
      final existing = await SecureLink.db.findFirstRow(
        session,
        where: (t) => t.token.equals(token),
      );
      if (existing == null) return token;
    }
    throw StateError('Failed to generate unique token after 10 attempts');
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
