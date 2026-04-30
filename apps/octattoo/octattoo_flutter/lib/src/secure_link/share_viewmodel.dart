import 'package:flutter/foundation.dart';

enum ShareState { idle, generating, ready, error }

class ShareViewModel extends ChangeNotifier {
  ShareState _state = ShareState.idle;
  String? _shareUrl;
  String? _errorMessage;

  ShareState get state => _state;
  String? get shareUrl => _shareUrl;
  String? get errorMessage => _errorMessage;

  void startGenerating() {
    _state = ShareState.generating;
    _shareUrl = null;
    _errorMessage = null;
    notifyListeners();
  }

  void completeWithUrl(String url) {
    _state = ShareState.ready;
    _shareUrl = url;
    notifyListeners();
  }

  void fail(String message) {
    _state = ShareState.error;
    _errorMessage = message;
    notifyListeners();
  }

  void reset() {
    _state = ShareState.idle;
    _shareUrl = null;
    _errorMessage = null;
    notifyListeners();
  }
}
