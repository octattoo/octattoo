import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:octattoo_flutter/src/storage/upload_viewmodel.dart';
import 'package:octattoo_flutter/src/storage/quota_display_viewmodel.dart';

void main() {
  group('UploadViewModel', () {
    late UploadViewModel vm;

    setUp(() {
      vm = UploadViewModel();
    });

    test('starts in idle state', () {
      expect(vm.state, UploadState.idle);
      expect(vm.isUploading, isFalse);
      expect(vm.progress, 0);
      expect(vm.errorMessage, isNull);
    });

    test('startUpload transitions to uploading', () {
      vm.startUpload(
        fileName: 'test.png',
        mimeType: 'image/png',
        bytes: Uint8List.fromList([1, 2, 3]),
      );

      expect(vm.state, UploadState.uploading);
      expect(vm.isUploading, isTrue);
    });

    test('setProgress updates progress value', () {
      vm.startUpload(
        fileName: 'test.png',
        mimeType: 'image/png',
        bytes: Uint8List.fromList([1, 2, 3]),
      );
      vm.setProgress(0.5);

      expect(vm.progress, 0.5);
    });

    test('setProgress clamps to 0-1 range', () {
      vm.setProgress(1.5);
      expect(vm.progress, 1.0);

      vm.setProgress(-0.5);
      expect(vm.progress, 0.0);
    });

    test('completeUpload transitions to success', () {
      vm.startUpload(
        fileName: 'test.png',
        mimeType: 'image/png',
        bytes: Uint8List.fromList([1, 2, 3]),
      );
      vm.completeUpload();

      expect(vm.state, UploadState.success);
      expect(vm.progress, 1.0);
    });

    test('failUpload transitions to error with message', () {
      vm.startUpload(
        fileName: 'test.png',
        mimeType: 'image/png',
        bytes: Uint8List.fromList([1, 2, 3]),
      );
      vm.failUpload('Quota exceeded');

      expect(vm.state, UploadState.error);
      expect(vm.errorMessage, 'Quota exceeded');
    });

    test('reset returns to idle', () {
      vm.startUpload(
        fileName: 'test.png',
        mimeType: 'image/png',
        bytes: Uint8List.fromList([1, 2, 3]),
      );
      vm.failUpload('Error');
      vm.reset();

      expect(vm.state, UploadState.idle);
      expect(vm.progress, 0);
      expect(vm.errorMessage, isNull);
    });

    test('notifies listeners on state changes', () {
      var notifyCount = 0;
      vm.addListener(() => notifyCount++);

      vm.startUpload(
        fileName: 'test.png',
        mimeType: 'image/png',
        bytes: Uint8List.fromList([1, 2, 3]),
      );
      vm.setProgress(0.5);
      vm.completeUpload();

      expect(notifyCount, 3);
    });
  });

  group('QuotaDisplayViewModel', () {
    late QuotaDisplayViewModel vm;

    setUp(() {
      vm = QuotaDisplayViewModel();
    });

    test('starts with default 500MB quota and 0 usage', () {
      expect(vm.usedBytes, 0);
      expect(vm.quotaBytes, 500 * 1024 * 1024);
      expect(vm.usagePercent, 0);
    });

    test('updateUsage sets values and notifies', () {
      var notified = false;
      vm.addListener(() => notified = true);

      vm.updateUsage(usedBytes: 100 * 1024 * 1024, quotaBytes: 500 * 1024 * 1024);

      expect(notified, isTrue);
      expect(vm.usedBytes, 100 * 1024 * 1024);
      expect(vm.usagePercent, closeTo(0.2, 0.001));
    });

    test('isNearLimit true at 90% usage', () {
      vm.updateUsage(usedBytes: 450 * 1024 * 1024, quotaBytes: 500 * 1024 * 1024);
      expect(vm.isNearLimit, isTrue);
    });

    test('isNearLimit false below 90%', () {
      vm.updateUsage(usedBytes: 400 * 1024 * 1024, quotaBytes: 500 * 1024 * 1024);
      expect(vm.isNearLimit, isFalse);
    });

    test('isAtLimit true when usage equals quota', () {
      vm.updateUsage(usedBytes: 500 * 1024 * 1024, quotaBytes: 500 * 1024 * 1024);
      expect(vm.isAtLimit, isTrue);
    });

    test('remainingBytes calculates correctly', () {
      vm.updateUsage(usedBytes: 300 * 1024 * 1024, quotaBytes: 500 * 1024 * 1024);
      expect(vm.remainingBytes, 200 * 1024 * 1024);
    });

    test('remainingBytes does not go negative', () {
      vm.updateUsage(usedBytes: 600 * 1024 * 1024, quotaBytes: 500 * 1024 * 1024);
      expect(vm.remainingBytes, 0);
    });

    test('formats bytes correctly', () {
      vm.updateUsage(usedBytes: 512, quotaBytes: 1024);
      expect(vm.usedFormatted, '512 B');
      expect(vm.quotaFormatted, '1.0 KB');

      vm.updateUsage(
        usedBytes: 250 * 1024 * 1024,
        quotaBytes: 500 * 1024 * 1024,
      );
      expect(vm.usedFormatted, '250.0 MB');
      expect(vm.quotaFormatted, '500.0 MB');
    });

    test('formats GB correctly', () {
      vm.updateUsage(
        usedBytes: 5 * 1024 * 1024 * 1024,
        quotaBytes: 10 * 1024 * 1024 * 1024,
      );
      expect(vm.usedFormatted, '5.0 GB');
      expect(vm.quotaFormatted, '10.0 GB');
    });
  });
}
