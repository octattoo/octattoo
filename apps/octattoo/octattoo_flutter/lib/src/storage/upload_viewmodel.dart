import 'dart:typed_data';

import 'package:flutter/foundation.dart';

enum UploadState { idle, uploading, success, error }

class UploadViewModel extends ChangeNotifier {
  UploadState _state = UploadState.idle;
  String? _errorMessage;
  double _progress = 0;

  UploadState get state => _state;
  String? get errorMessage => _errorMessage;
  double get progress => _progress;

  bool get isUploading => _state == UploadState.uploading;

  void startUpload({
    required String fileName,
    required String mimeType,
    required Uint8List bytes,
  }) {
    _state = UploadState.uploading;
    _progress = 0;
    _errorMessage = null;
    notifyListeners();
  }

  void setProgress(double value) {
    _progress = value.clamp(0, 1);
    notifyListeners();
  }

  void completeUpload() {
    _state = UploadState.success;
    _progress = 1;
    notifyListeners();
  }

  void failUpload(String message) {
    _state = UploadState.error;
    _errorMessage = message;
    notifyListeners();
  }

  void reset() {
    _state = UploadState.idle;
    _progress = 0;
    _errorMessage = null;
    notifyListeners();
  }
}
