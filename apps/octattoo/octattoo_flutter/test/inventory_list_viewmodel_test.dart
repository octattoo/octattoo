import 'package:flutter_test/flutter_test.dart';

import 'package:octattoo_flutter/src/inventory/inventory_list_viewmodel.dart';

void main() {
  group('InventoryListViewModel', () {
    test('initial state is empty and not loading', () {
      final vm = InventoryListViewModel();
      expect(vm.materials, isEmpty);
      expect(vm.isLoading, isFalse);
      expect(vm.searchQuery, isEmpty);
      expect(vm.typeFilter, MaterialTypeFilter.all);
    });

    test('updateSearch updates the search query', () {
      final vm = InventoryListViewModel();
      vm.updateSearch('Black');
      expect(vm.searchQuery, 'Black');
    });

    test('updateTypeFilter updates the filter', () {
      final vm = InventoryListViewModel();
      vm.updateTypeFilter(MaterialTypeFilter.ink);
      expect(vm.typeFilter, MaterialTypeFilter.ink);
    });

    test('filteredMaterials filters by type', () {
      final vm = InventoryListViewModel();
      vm.setMaterialsForTest([
        MaterialListItem(
          id: '1',
          productName: 'True Black',
          manufacturer: 'World Famous',
          batchNumber: 'WF-001',
          type: MaterialTypeFilter.ink,
          status: 'inStock',
        ),
        MaterialListItem(
          id: '2',
          productName: 'Hawk Pen 0.30mm',
          manufacturer: 'Cheyenne',
          batchNumber: 'CH-001',
          type: MaterialTypeFilter.needle,
          status: 'inStock',
          quantity: 20,
        ),
      ]);

      vm.updateTypeFilter(MaterialTypeFilter.ink);
      expect(vm.filteredMaterials, hasLength(1));
      expect(vm.filteredMaterials.first.productName, 'True Black');

      vm.updateTypeFilter(MaterialTypeFilter.needle);
      expect(vm.filteredMaterials, hasLength(1));
      expect(vm.filteredMaterials.first.productName, 'Hawk Pen 0.30mm');

      vm.updateTypeFilter(MaterialTypeFilter.all);
      expect(vm.filteredMaterials, hasLength(2));
    });

    test('filteredMaterials filters by search query', () {
      final vm = InventoryListViewModel();
      vm.setMaterialsForTest([
        MaterialListItem(
          id: '1',
          productName: 'True Black',
          manufacturer: 'World Famous',
          batchNumber: 'WF-001',
          type: MaterialTypeFilter.ink,
          status: 'inStock',
        ),
        MaterialListItem(
          id: '2',
          productName: 'Crimson Red',
          manufacturer: 'Eternal',
          batchNumber: 'ET-042',
          type: MaterialTypeFilter.ink,
          status: 'inStock',
        ),
      ]);

      vm.updateSearch('Crimson');
      expect(vm.filteredMaterials, hasLength(1));
      expect(vm.filteredMaterials.first.productName, 'Crimson Red');
    });

    test('filteredMaterials searches by manufacturer', () {
      final vm = InventoryListViewModel();
      vm.setMaterialsForTest([
        MaterialListItem(
          id: '1',
          productName: 'True Black',
          manufacturer: 'World Famous',
          batchNumber: 'WF-001',
          type: MaterialTypeFilter.ink,
          status: 'inStock',
        ),
      ]);

      vm.updateSearch('World');
      expect(vm.filteredMaterials, hasLength(1));
    });

    test('filteredMaterials searches by batch number', () {
      final vm = InventoryListViewModel();
      vm.setMaterialsForTest([
        MaterialListItem(
          id: '1',
          productName: 'True Black',
          manufacturer: 'World Famous',
          batchNumber: 'WF-001',
          type: MaterialTypeFilter.ink,
          status: 'inStock',
        ),
      ]);

      vm.updateSearch('WF-001');
      expect(vm.filteredMaterials, hasLength(1));
    });

    test('type filter and search combine', () {
      final vm = InventoryListViewModel();
      vm.setMaterialsForTest([
        MaterialListItem(
          id: '1',
          productName: 'Black Ink',
          manufacturer: 'M',
          batchNumber: 'B1',
          type: MaterialTypeFilter.ink,
          status: 'inStock',
        ),
        MaterialListItem(
          id: '2',
          productName: 'Black Needle',
          manufacturer: 'M',
          batchNumber: 'B2',
          type: MaterialTypeFilter.needle,
          status: 'inStock',
          quantity: 5,
        ),
      ]);

      vm.updateTypeFilter(MaterialTypeFilter.ink);
      vm.updateSearch('Black');
      expect(vm.filteredMaterials, hasLength(1));
      expect(vm.filteredMaterials.first.productName, 'Black Ink');
    });

    test('empty search returns all for current filter', () {
      final vm = InventoryListViewModel();
      vm.setMaterialsForTest([
        MaterialListItem(
          id: '1',
          productName: 'A',
          manufacturer: 'M',
          batchNumber: 'B1',
          type: MaterialTypeFilter.ink,
          status: 'inStock',
        ),
        MaterialListItem(
          id: '2',
          productName: 'B',
          manufacturer: 'M',
          batchNumber: 'B2',
          type: MaterialTypeFilter.ink,
          status: 'inStock',
        ),
      ]);

      vm.updateSearch('');
      expect(vm.filteredMaterials, hasLength(2));
    });
  });

  group('Expiration badge logic', () {
    test('isExpiringSoon returns true when within threshold', () {
      final vm = InventoryListViewModel();
      final now = DateTime(2026, 4, 30);
      final item = MaterialListItem(
        id: '1',
        productName: 'Ink',
        manufacturer: 'M',
        batchNumber: 'B1',
        type: MaterialTypeFilter.ink,
        status: 'inStock',
        expirationDate: DateTime(2026, 5, 15),
      );

      expect(vm.isExpiringSoon(item, now: now, thresholdDays: 30), isTrue);
    });

    test('isExpiringSoon returns false when past threshold', () {
      final vm = InventoryListViewModel();
      final now = DateTime(2026, 4, 30);
      final item = MaterialListItem(
        id: '1',
        productName: 'Ink',
        manufacturer: 'M',
        batchNumber: 'B1',
        type: MaterialTypeFilter.ink,
        status: 'inStock',
        expirationDate: DateTime(2026, 6, 15),
      );

      expect(vm.isExpiringSoon(item, now: now, thresholdDays: 30), isFalse);
    });

    test('isExpiringSoon returns true for already expired', () {
      final vm = InventoryListViewModel();
      final now = DateTime(2026, 4, 30);
      final item = MaterialListItem(
        id: '1',
        productName: 'Ink',
        manufacturer: 'M',
        batchNumber: 'B1',
        type: MaterialTypeFilter.ink,
        status: 'inStock',
        expirationDate: DateTime(2026, 4, 20),
      );

      expect(vm.isExpiringSoon(item, now: now, thresholdDays: 30), isTrue);
    });

    test('expiringMaterials returns only items within threshold', () {
      final vm = InventoryListViewModel();
      vm.setExpirationThreshold(30);
      vm.setNowForTest(DateTime(2026, 4, 30));
      vm.setMaterialsForTest([
        MaterialListItem(
          id: '1',
          productName: 'Expiring Ink',
          manufacturer: 'M',
          batchNumber: 'B1',
          type: MaterialTypeFilter.ink,
          status: 'inStock',
          expirationDate: DateTime(2026, 5, 15),
        ),
        MaterialListItem(
          id: '2',
          productName: 'Safe Ink',
          manufacturer: 'M',
          batchNumber: 'B2',
          type: MaterialTypeFilter.ink,
          status: 'inStock',
          expirationDate: DateTime(2026, 7, 1),
        ),
      ]);

      expect(vm.expiringMaterials, hasLength(1));
      expect(vm.expiringMaterials.first.productName, 'Expiring Ink');
    });
  });
}
