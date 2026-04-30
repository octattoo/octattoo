import 'package:flutter/foundation.dart';

class QuotaDisplayViewModel extends ChangeNotifier {
  int _usedBytes = 0;
  int _quotaBytes = 500 * 1024 * 1024; // 500MB default

  int get usedBytes => _usedBytes;
  int get quotaBytes => _quotaBytes;
  double get usagePercent =>
      _quotaBytes > 0 ? (_usedBytes / _quotaBytes).clamp(0, 1) : 0;
  int get remainingBytes => (_quotaBytes - _usedBytes).clamp(0, _quotaBytes);

  String get usedFormatted => _formatBytes(_usedBytes);
  String get quotaFormatted => _formatBytes(_quotaBytes);
  String get remainingFormatted => _formatBytes(remainingBytes);

  bool get isNearLimit => usagePercent >= 0.9;
  bool get isAtLimit => _usedBytes >= _quotaBytes;

  void updateUsage({required int usedBytes, required int quotaBytes}) {
    _usedBytes = usedBytes;
    _quotaBytes = quotaBytes;
    notifyListeners();
  }

  static String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}
