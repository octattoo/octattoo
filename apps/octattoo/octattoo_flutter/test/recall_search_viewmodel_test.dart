import 'package:flutter_test/flutter_test.dart';

import 'package:octattoo_flutter/src/traceability/recall_search_viewmodel.dart';

void main() {
  group('RecallSearchViewModel', () {
    test('initial state: empty results, not loading', () {
      final vm = RecallSearchViewModel();
      expect(vm.results, isEmpty);
      expect(vm.isLoading, isFalse);
      expect(vm.batchNumber, isEmpty);
    });

    test('setResults populates results', () {
      final vm = RecallSearchViewModel();
      vm.setResultsForTest([
        RecallMatchItem(
          appointmentId: 'a1',
          appointmentDate: DateTime(2026, 5, 15),
          customerName: 'Alice',
          customerContact: 'alice@example.com',
          artistProfileName: 'Brand A',
          contacted: false,
        ),
      ]);

      expect(vm.results, hasLength(1));
      expect(vm.results.first.customerName, 'Alice');
    });

    test('results grouped by artist profile', () {
      final vm = RecallSearchViewModel();
      vm.setResultsForTest([
        RecallMatchItem(
          appointmentId: 'a1',
          appointmentDate: DateTime(2026, 5, 15),
          customerName: 'Alice',
          customerContact: 'alice@example.com',
          artistProfileName: 'Brand A',
          contacted: false,
        ),
        RecallMatchItem(
          appointmentId: 'a2',
          appointmentDate: DateTime(2026, 5, 20),
          customerName: 'Bob',
          customerContact: 'bob@example.com',
          artistProfileName: 'Brand B',
          contacted: false,
        ),
        RecallMatchItem(
          appointmentId: 'a3',
          appointmentDate: DateTime(2026, 5, 22),
          customerName: 'Charlie',
          customerContact: 'charlie@example.com',
          artistProfileName: 'Brand A',
          contacted: true,
        ),
      ]);

      final grouped = vm.resultsByProfile;
      expect(grouped.keys, containsAll(['Brand A', 'Brand B']));
      expect(grouped['Brand A'], hasLength(2));
      expect(grouped['Brand B'], hasLength(1));
    });

    test('toggleContacted flips contacted status locally', () {
      final vm = RecallSearchViewModel();
      vm.setResultsForTest([
        RecallMatchItem(
          appointmentId: 'a1',
          appointmentDate: DateTime(2026, 5, 15),
          customerName: 'Alice',
          customerContact: 'alice@example.com',
          artistProfileName: 'Brand A',
          contacted: false,
        ),
      ]);

      vm.toggleContacted('a1');
      expect(vm.results.first.contacted, isTrue);

      vm.toggleContacted('a1');
      expect(vm.results.first.contacted, isFalse);
    });

    test('updateBatchNumber updates the query', () {
      final vm = RecallSearchViewModel();
      vm.updateBatchNumber('BATCH-123');
      expect(vm.batchNumber, 'BATCH-123');
    });
  });
}
