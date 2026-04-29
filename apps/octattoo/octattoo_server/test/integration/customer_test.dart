import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Customer CRUD', (sessionBuilder, endpoints) {
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

    test('creates a customer and returns it', () async {
      // Ensure artist profile exists
      await endpoints.artistProfile.getMyProfileId(session1);

      final result = await endpoints.customer.createCustomer(
        session1,
        name: 'Alice',
        email: 'alice@example.com',
      );

      expect(result.customer.name, 'Alice');
      expect(result.customer.email, 'alice@example.com');
      expect(result.customer.id, isNotNull);
      expect(result.potentialDuplicates, isEmpty);
    });

    test('detects duplicate by email on create', () async {
      await endpoints.artistProfile.getMyProfileId(session1);

      await endpoints.customer.createCustomer(
        session1,
        name: 'Bob',
        email: 'bob@example.com',
      );

      final result = await endpoints.customer.createCustomer(
        session1,
        name: 'Robert',
        email: 'bob@example.com',
      );

      expect(result.customer.name, 'Robert');
      expect(result.potentialDuplicates, hasLength(1));
      expect(result.potentialDuplicates.first.name, 'Bob');
    });

    test('detects duplicate by phone on create', () async {
      await endpoints.artistProfile.getMyProfileId(session1);

      await endpoints.customer.createCustomer(
        session1,
        name: 'Charlie',
        phone: '+33612345678',
      );

      final result = await endpoints.customer.createCustomer(
        session1,
        name: 'Charles',
        phone: '+33612345678',
      );

      expect(result.potentialDuplicates, hasLength(1));
      expect(result.potentialDuplicates.first.name, 'Charlie');
    });

    test('lists customers for current profile', () async {
      await endpoints.artistProfile.getMyProfileId(session1);

      await endpoints.customer.createCustomer(
        session1,
        name: 'Dave',
        email: 'dave@example.com',
      );

      final list = await endpoints.customer.listCustomers(session1);
      expect(list.any((c) => c.name == 'Dave'), isTrue);
    });

    test('search filters customers by name', () async {
      await endpoints.artistProfile.getMyProfileId(session1);

      await endpoints.customer.createCustomer(
        session1,
        name: 'Eve',
        email: 'eve@example.com',
      );
      await endpoints.customer.createCustomer(
        session1,
        name: 'Frank',
        phone: '+33600000001',
      );

      final results = await endpoints.customer.listCustomers(
        session1,
        search: 'Eve',
      );
      expect(results, hasLength(1));
      expect(results.first.name, 'Eve');
    });

    test('updates a customer', () async {
      await endpoints.artistProfile.getMyProfileId(session1);

      final created = await endpoints.customer.createCustomer(
        session1,
        name: 'Grace',
        email: 'grace@example.com',
      );

      final updated = await endpoints.customer.updateCustomer(
        session1,
        customerId: created.customer.id!,
        name: 'Grace Updated',
        email: 'grace.new@example.com',
      );

      expect(updated, isNotNull);
      expect(updated!.name, 'Grace Updated');
      expect(updated.email, 'grace.new@example.com');
    });

    test('deletes a customer', () async {
      await endpoints.artistProfile.getMyProfileId(session1);

      final created = await endpoints.customer.createCustomer(
        session1,
        name: 'Heidi',
        email: 'heidi@example.com',
      );

      final deleted = await endpoints.customer.deleteCustomer(
        session1,
        created.customer.id!,
      );
      expect(deleted, isTrue);

      final fetched = await endpoints.customer.getCustomer(
        session1,
        created.customer.id!,
      );
      expect(fetched, isNull);
    });

    test(
      'cross-profile isolation: cannot see other profile customers',
      () async {
        await endpoints.artistProfile.getMyProfileId(session1);
        await endpoints.artistProfile.getMyProfileId(session2);

        await endpoints.customer.createCustomer(
          session1,
          name: 'Profile1Customer',
          email: 'p1@example.com',
        );

        final list = await endpoints.customer.listCustomers(session2);
        expect(list.where((c) => c.name == 'Profile1Customer'), isEmpty);
      },
    );

    test(
      'cross-profile isolation: cannot update other profile customer',
      () async {
        await endpoints.artistProfile.getMyProfileId(session1);
        await endpoints.artistProfile.getMyProfileId(session2);

        final created = await endpoints.customer.createCustomer(
          session1,
          name: 'Isolated',
          email: 'isolated@example.com',
        );

        final result = await endpoints.customer.updateCustomer(
          session2,
          customerId: created.customer.id!,
          name: 'Hacked',
          email: 'hacked@example.com',
        );

        expect(result, isNull);
      },
    );

    test('rejects unauthenticated calls', () async {
      expect(
        () => endpoints.customer.listCustomers(sessionBuilder),
        throwsA(isA<ServerpodUnauthenticatedException>()),
      );
    });
  });
}
