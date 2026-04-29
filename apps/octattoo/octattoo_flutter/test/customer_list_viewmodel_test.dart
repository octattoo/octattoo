import 'package:flutter_test/flutter_test.dart';

import 'package:octattoo_flutter/src/customer/customer_list_viewmodel.dart';

void main() {
  group('CustomerListViewModel', () {
    test('initial state is empty and not loading', () {
      final vm = CustomerListViewModel();
      expect(vm.customers, isEmpty);
      expect(vm.isLoading, isFalse);
      expect(vm.searchQuery, isEmpty);
    });

    test('updateSearch updates the search query', () {
      final vm = CustomerListViewModel();
      vm.updateSearch('Alice');
      expect(vm.searchQuery, 'Alice');
    });

    test('filteredCustomers filters by name', () {
      final vm = CustomerListViewModel();
      vm.setCustomersForTest([
        CustomerListItem(id: '1', name: 'Alice', subtitle: 'alice@test.com'),
        CustomerListItem(id: '2', name: 'Bob', subtitle: '+33600000000'),
      ]);
      vm.updateSearch('Ali');
      expect(vm.filteredCustomers, hasLength(1));
      expect(vm.filteredCustomers.first.name, 'Alice');
    });

    test('filteredCustomers filters by subtitle (email/phone)', () {
      final vm = CustomerListViewModel();
      vm.setCustomersForTest([
        CustomerListItem(id: '1', name: 'Alice', subtitle: 'alice@test.com'),
        CustomerListItem(id: '2', name: 'Bob', subtitle: '+33600000000'),
      ]);
      vm.updateSearch('alice@');
      expect(vm.filteredCustomers, hasLength(1));
      expect(vm.filteredCustomers.first.name, 'Alice');
    });

    test('empty search returns all customers', () {
      final vm = CustomerListViewModel();
      vm.setCustomersForTest([
        CustomerListItem(id: '1', name: 'Alice', subtitle: 'alice@test.com'),
        CustomerListItem(id: '2', name: 'Bob', subtitle: '+33600000000'),
      ]);
      vm.updateSearch('');
      expect(vm.filteredCustomers, hasLength(2));
    });
  });
}
