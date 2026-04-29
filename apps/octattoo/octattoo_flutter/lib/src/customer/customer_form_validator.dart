class CustomerFormValidator {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'Name is required';
    return null;
  }

  static String? validateContact({String? email, String? phone}) {
    final hasEmail = email != null && email.isNotEmpty;
    final hasPhone = phone != null && phone.isNotEmpty;
    if (!hasEmail && !hasPhone) {
      return 'At least one of email or phone is required';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return null;
    if (!value.contains('@') || !value.contains('.')) {
      return 'Invalid email format';
    }
    return null;
  }
}
