import 'package:flutter_test/flutter_test.dart';

import 'package:octattoo_flutter/src/appointment/appointment_detail_viewmodel.dart';

void main() {
  group('AppointmentDetailViewModel', () {
    test('initial state has no appointment', () {
      final vm = AppointmentDetailViewModel();
      expect(vm.appointment, isNull);
      expect(vm.materials, isEmpty);
    });

    test('canStart is true only when scheduled', () {
      final vm = AppointmentDetailViewModel();
      vm.setAppointmentForTest(AppointmentDetail(
        id: '1',
        type: 'tattoo',
        status: 'scheduled',
        customerName: 'Alice',
        scheduledAt: DateTime(2026, 5, 15),
      ));
      expect(vm.canStart, isTrue);
      expect(vm.canFinalize, isFalse);
      expect(vm.canRecordMaterial, isFalse);
    });

    test('canRecordMaterial and canFinalize are true when inProgress', () {
      final vm = AppointmentDetailViewModel();
      vm.setAppointmentForTest(AppointmentDetail(
        id: '1',
        type: 'tattoo',
        status: 'inProgress',
        customerName: 'Alice',
        scheduledAt: DateTime(2026, 5, 15),
      ));
      expect(vm.canStart, isFalse);
      expect(vm.canFinalize, isTrue);
      expect(vm.canRecordMaterial, isTrue);
    });

    test('no actions available when finalized', () {
      final vm = AppointmentDetailViewModel();
      vm.setAppointmentForTest(AppointmentDetail(
        id: '1',
        type: 'tattoo',
        status: 'finalized',
        customerName: 'Alice',
        scheduledAt: DateTime(2026, 5, 15),
      ));
      expect(vm.canStart, isFalse);
      expect(vm.canFinalize, isFalse);
      expect(vm.canRecordMaterial, isFalse);
    });

    test('hasZeroMaterialsWarning is true for tattoo with no materials in progress',
        () {
      final vm = AppointmentDetailViewModel();
      vm.setAppointmentForTest(AppointmentDetail(
        id: '1',
        type: 'tattoo',
        status: 'inProgress',
        customerName: 'Alice',
        scheduledAt: DateTime(2026, 5, 15),
      ));
      expect(vm.hasZeroMaterialsWarning, isTrue);
    });

    test('hasZeroMaterialsWarning is false when materials are recorded', () {
      final vm = AppointmentDetailViewModel();
      vm.setAppointmentForTest(AppointmentDetail(
        id: '1',
        type: 'tattoo',
        status: 'inProgress',
        customerName: 'Alice',
        scheduledAt: DateTime(2026, 5, 15),
      ));
      vm.setMaterialsForTest([
        LinkedMaterial(
          id: 'm1',
          productName: 'True Black',
          manufacturer: 'World Famous',
          batchNumber: 'WF-001',
        ),
      ]);
      expect(vm.hasZeroMaterialsWarning, isFalse);
    });

    test('hasZeroMaterialsWarning is false for consultation type', () {
      final vm = AppointmentDetailViewModel();
      vm.setAppointmentForTest(AppointmentDetail(
        id: '1',
        type: 'consultation',
        status: 'inProgress',
        customerName: 'Alice',
        scheduledAt: DateTime(2026, 5, 15),
      ));
      expect(vm.hasZeroMaterialsWarning, isFalse);
    });
  });
}
