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

  MaterialListItem({
    required this.id,
    required this.productName,
    required this.manufacturer,
    required this.batchNumber,
    required this.type,
    required this.status,
    this.quantity,
  });
}

class InventoryListViewModel extends ChangeNotifier {
  List<MaterialListItem> _materials = [];
  String _searchQuery = '';
  MaterialTypeFilter _typeFilter = MaterialTypeFilter.all;
  final bool _isLoading = false;

  List<MaterialListItem> get materials => _materials;
  String get searchQuery => _searchQuery;
  MaterialTypeFilter get typeFilter => _typeFilter;
  bool get isLoading => _isLoading;

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
}
