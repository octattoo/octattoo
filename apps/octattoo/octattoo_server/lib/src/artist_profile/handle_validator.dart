/// Validates artist profile handle format.
///
/// Rules: 3–30 chars, starts with lowercase letter,
/// followed by lowercase letters, digits, or underscores.
class HandleValidator {
  static final _pattern = RegExp(r'^[a-z][a-z0-9_]{2,29}$');

  static bool isValid(String handle) => _pattern.hasMatch(handle);
}
