import 'package:flutter/foundation.dart';

class RecallMatchItem {
  final String appointmentId;
  final DateTime appointmentDate;
  final String customerName;
  final String customerContact;
  final String artistProfileName;
  bool contacted;

  RecallMatchItem({
    required this.appointmentId,
    required this.appointmentDate,
    required this.customerName,
    required this.customerContact,
    required this.artistProfileName,
    required this.contacted,
  });
}

class RecallSearchViewModel extends ChangeNotifier {
  List<RecallMatchItem> _results = [];
  final bool _isLoading = false;
  String _batchNumber = '';

  List<RecallMatchItem> get results => _results;
  bool get isLoading => _isLoading;
  String get batchNumber => _batchNumber;

  Map<String, List<RecallMatchItem>> get resultsByProfile {
    final map = <String, List<RecallMatchItem>>{};
    for (final item in _results) {
      map.putIfAbsent(item.artistProfileName, () => []).add(item);
    }
    return map;
  }

  void updateBatchNumber(String value) {
    _batchNumber = value;
    notifyListeners();
  }

  void toggleContacted(String appointmentId) {
    final item = _results.firstWhere((r) => r.appointmentId == appointmentId);
    item.contacted = !item.contacted;
    notifyListeners();
  }

  /// For testing only.
  void setResultsForTest(List<RecallMatchItem> results) {
    _results = results;
    notifyListeners();
  }
}
