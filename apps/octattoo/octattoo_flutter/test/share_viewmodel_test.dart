import 'package:flutter_test/flutter_test.dart';
import 'package:octattoo_flutter/src/secure_link/share_viewmodel.dart';

void main() {
  group('ShareViewModel', () {
    late ShareViewModel vm;

    setUp(() {
      vm = ShareViewModel();
    });

    test('starts in idle state', () {
      expect(vm.state, ShareState.idle);
      expect(vm.shareUrl, isNull);
      expect(vm.errorMessage, isNull);
    });

    test('generating transitions to generating state', () {
      vm.startGenerating();
      expect(vm.state, ShareState.generating);
    });

    test('completeWithUrl transitions to ready with URL', () {
      vm.startGenerating();
      vm.completeWithUrl('https://octattoo.app/quotelink/AbCdEf1234');

      expect(vm.state, ShareState.ready);
      expect(vm.shareUrl, 'https://octattoo.app/quotelink/AbCdEf1234');
    });

    test('fail transitions to error with message', () {
      vm.startGenerating();
      vm.fail('Network error');

      expect(vm.state, ShareState.error);
      expect(vm.errorMessage, 'Network error');
    });

    test('reset returns to idle', () {
      vm.startGenerating();
      vm.completeWithUrl('https://octattoo.app/quotelink/AbCdEf1234');
      vm.reset();

      expect(vm.state, ShareState.idle);
      expect(vm.shareUrl, isNull);
      expect(vm.errorMessage, isNull);
    });

    test('notifies listeners on state changes', () {
      var notifyCount = 0;
      vm.addListener(() => notifyCount++);

      vm.startGenerating();
      vm.completeWithUrl('https://octattoo.app/quotelink/AbCdEf1234');

      expect(notifyCount, 2);
    });
  });
}
