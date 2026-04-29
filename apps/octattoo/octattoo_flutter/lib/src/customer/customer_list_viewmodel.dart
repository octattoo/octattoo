import 'package:flutter/foundation.dart';

class CustomerListItem {
  final String id;
  final String name;
  final String subtitle;

  CustomerListItem({
    required this.id,
    required this.name,
    required this.subtitle,
  });
}

class CustomerListViewModel extends ChangeNotifier {
  List<CustomerListItem> _customers = [];
  String _searchQuery = '';
  final bool _isLoading = false;

  List<CustomerListItem> get customers => _customers;
  String get searchQuery => _searchQuery;
  bool get isLoading => _isLoading;

  List<CustomerListItem> get filteredCustomers {
    if (_searchQuery.isEmpty) return _customers;
    final query = _searchQuery.toLowerCase();
    return _customers.where((c) {
      return c.name.toLowerCase().contains(query) ||
          c.subtitle.toLowerCase().contains(query);
    }).toList();
  }

  void updateSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  /// For testing only.
  void setCustomersForTest(List<CustomerListItem> customers) {
    _customers = customers;
    notifyListeners();
  }
}
