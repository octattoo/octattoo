import 'package:flutter/foundation.dart';

enum MaterialTypeFilter { all, ink, needle }

class MaterialListItem {
  final String id;
  final String productName;
  final String manufacturer;
  final String batchNumber;
  final MaterialTypeFilter type;
  final String status;
  final int? quantity;
  final DateTime? expirationDate;

  MaterialListItem({
    required this.id,
    required this.productName,
    required this.manufacturer,
    required this.batchNumber,
    required this.type,
    required this.status,
    this.quantity,
    this.expirationDate,
  });
}

class InventoryListViewModel extends ChangeNotifier {
  List<MaterialListItem> _materials = [];
  String _searchQuery = '';
  MaterialTypeFilter _typeFilter = MaterialTypeFilter.all;
  final bool _isLoading = false;
  int _expirationThresholdDays = 30;
  DateTime? _nowOverride;

  List<MaterialListItem> get materials => _materials;
  String get searchQuery => _searchQuery;
  MaterialTypeFilter get typeFilter => _typeFilter;
  bool get isLoading => _isLoading;

  bool isExpiringSoon(MaterialListItem item, {DateTime? now, int? thresholdDays}) {
    if (item.expirationDate == null) return false;
    final ref = now ?? _nowOverride ?? DateTime.now();
    final threshold = thresholdDays ?? _expirationThresholdDays;
    final cutoff = ref.add(Duration(days: threshold));
    return !item.expirationDate!.isAfter(cutoff);
  }

  List<MaterialListItem> get expiringMaterials {
    return _materials.where((m) => isExpiringSoon(m)).toList();
  }

  List<MaterialListItem> get filteredMaterials {
    var result = _materials;

    if (_typeFilter != MaterialTypeFilter.all) {
      result = result.where((m) => m.type == _typeFilter).toList();
    }

    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      result = result.where((m) {
        return m.productName.toLowerCase().contains(query) ||
            m.manufacturer.toLowerCase().contains(query) ||
            m.batchNumber.toLowerCase().contains(query);
      }).toList();
    }

    return result;
  }

  void updateSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void updateTypeFilter(MaterialTypeFilter filter) {
    _typeFilter = filter;
    notifyListeners();
  }

  /// For testing only.
  void setMaterialsForTest(List<MaterialListItem> materials) {
    _materials = materials;
    notifyListeners();
  }

  /// For testing only.
  void setExpirationThreshold(int days) {
    _expirationThresholdDays = days;
  }

  /// For testing only.
  void setNowForTest(DateTime now) {
    _nowOverride = now;
  }
}
