import 'package:serverpod/serverpod.dart' show UuidValue;
import 'package:test/test.dart';
import 'package:octattoo_server/src/generated/protocol.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Secure Links', (sessionBuilder, endpoints) {
    final authUserId1 = '550e8400-e29b-41d4-a716-446655440001';
    final authUserId2 = '550e8400-e29b-41d4-a716-446655440002';

    late TestSessionBuilder session1;
    late TestSessionBuilder session2;

    setUp(() {
      session1 = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          authUserId1,
          {},
        ),
      );
      session2 = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          authUserId2,
          {},
        ),
      );
    });

    test('createLink generates a 10-char base62 token with correct expiration',
        () async {
      await endpoints.artistProfile.getMyProfileId(session1);

      final link = await endpoints.secureLink.createLink(
        session1,
        type: SecureLinkType.quote,
        targetId: UuidValue.fromString('a0000000-0000-4000-8000-000000000001'),
      );

      expect(link.id, isNotNull);
      expect(link.token, hasLength(10));
      expect(link.token, matches(RegExp(r'^[A-Za-z0-9]+$')));
      expect(link.type, SecureLinkType.quote);
      expect(link.status, SecureLinkStatus.active);
      expect(
        link.expiresAt.difference(link.createdAt).inDays,
        closeTo(14, 1),
      );
    });

    test('resolveLink returns active link data', () async {
      await endpoints.artistProfile.getMyProfileId(session1);

      final created = await endpoints.secureLink.createLink(
        session1,
        type: SecureLinkType.quote,
        targetId: UuidValue.fromString('a0000000-0000-4000-8000-000000000001'),
      );

      final resolved = await endpoints.secureLink.resolveLink(
        session1,
        created.token,
      );

      expect(resolved, isNotNull);
      expect(resolved!.id, created.id);
      expect(resolved.targetId, created.targetId);
      expect(resolved.status, SecureLinkStatus.active);
    });

    test('resolveLink returns null for expired link', () async {
      await endpoints.artistProfile.getMyProfileId(session1);

      final created = await endpoints.secureLink.createLink(
        session1,
        type: SecureLinkType.quote,
        targetId: UuidValue.fromString('a0000000-0000-4000-8000-000000000001'),
        expiresInDays: 0,
      );

      final resolved = await endpoints.secureLink.resolveLink(
        session1,
        created.token,
      );

      expect(resolved, isNull);
    });

    test('renewLink extends expiration on expired link', () async {
      await endpoints.artistProfile.getMyProfileId(session1);

      final created = await endpoints.secureLink.createLink(
        session1,
        type: SecureLinkType.quote,
        targetId: UuidValue.fromString('a0000000-0000-4000-8000-000000000001'),
        expiresInDays: 0,
      );

      final renewed = await endpoints.secureLink.renewLink(
        session1,
        created.id!,
      );

      expect(renewed, isNotNull);
      expect(renewed!.token, created.token);
      expect(renewed.renewedAt, isNotNull);
      expect(renewed.expiresAt.isAfter(DateTime.now().toUtc()), isTrue);

      // Should now be resolvable
      final resolved = await endpoints.secureLink.resolveLink(
        session1,
        created.token,
      );
      expect(resolved, isNotNull);
    });

    test('cross-profile isolation: cannot renew another profile link',
        () async {
      await endpoints.artistProfile.getMyProfileId(session1);
      await endpoints.artistProfile.getMyProfileId(session2);

      final created = await endpoints.secureLink.createLink(
        session1,
        type: SecureLinkType.quote,
        targetId: UuidValue.fromString('a0000000-0000-4000-8000-000000000001'),
        expiresInDays: 0,
      );

      final result = await endpoints.secureLink.renewLink(
        session2,
        created.id!,
      );
      expect(result, isNull);
    });

    test('rejects unauthenticated calls', () async {
      expect(
        () => endpoints.secureLink.createLink(
          sessionBuilder,
          type: SecureLinkType.quote,
          targetId:
              UuidValue.fromString('a0000000-0000-4000-8000-000000000001'),
        ),
        throwsA(isA<ServerpodUnauthenticatedException>()),
      );
    });
  });
}
