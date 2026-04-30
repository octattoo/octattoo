import '../generated/protocol.dart';

class ExpirationFilter {
  static List<Material> filterExpiring(
    List<Material> materials, {
    required int thresholdDays,
    required DateTime now,
  }) {
    final cutoff = now.add(Duration(days: thresholdDays));
    return materials
        .where((m) =>
            m.status == MaterialStatus.inStock &&
            !m.expirationDate.isAfter(cutoff))
        .toList();
  }
}
