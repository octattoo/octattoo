import 'package:flutter/foundation.dart';

class AppointmentDetail {
  final String id;
  final String type;
  final String status;
  final String customerName;
  final DateTime scheduledAt;
  final String? notes;

  AppointmentDetail({
    required this.id,
    required this.type,
    required this.status,
    required this.customerName,
    required this.scheduledAt,
    this.notes,
  });
}

class LinkedMaterial {
  final String id;
  final String productName;
  final String manufacturer;
  final String batchNumber;

  LinkedMaterial({
    required this.id,
    required this.productName,
    required this.manufacturer,
    required this.batchNumber,
  });
}

class AppointmentDetailViewModel extends ChangeNotifier {
  AppointmentDetail? _appointment;
  List<LinkedMaterial> _materials = [];

  AppointmentDetail? get appointment => _appointment;
  List<LinkedMaterial> get materials => _materials;

  bool get canStart => _appointment?.status == 'scheduled';
  bool get canFinalize => _appointment?.status == 'inProgress';
  bool get canRecordMaterial => _appointment?.status == 'inProgress';

  bool get hasZeroMaterialsWarning =>
      _appointment?.status == 'inProgress' &&
      _appointment?.type == 'tattoo' &&
      _materials.isEmpty;

  /// For testing only.
  void setAppointmentForTest(AppointmentDetail appointment) {
    _appointment = appointment;
    notifyListeners();
  }

  /// For testing only.
  void setMaterialsForTest(List<LinkedMaterial> materials) {
    _materials = materials;
    notifyListeners();
  }
}
