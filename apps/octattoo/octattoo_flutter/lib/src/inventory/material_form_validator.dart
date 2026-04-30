class MaterialFormValidator {
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) return '$fieldName is required';
    return null;
  }

  static String? validateQuantity(String? value, {required bool isNeedle}) {
    if (!isNeedle) return null;
    if (value == null || value.isEmpty) return 'Quantity is required for needles';
    final parsed = int.tryParse(value);
    if (parsed == null || parsed <= 0) return 'Quantity must be greater than 0';
    return null;
  }

  static String? validateExpirationDate(DateTime? value) {
    if (value == null) return 'Expiration date is required';
    return null;
  }
}
