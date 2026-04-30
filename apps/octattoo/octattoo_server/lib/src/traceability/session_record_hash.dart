import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:serverpod/serverpod.dart' show UuidValue;

import '../generated/protocol.dart';

/// Computes a deterministic SHA-256 hash over canonical traceability fields.
/// For amendments (v2+), [previousHash] links this version to the prior one.
String computeSessionRecordHash({
  required UuidValue appointmentId,
  required UuidValue artistProfileId,
  required UuidValue customerId,
  required DateTime finalizedAt,
  required AppointmentType type,
  required List<AppointmentMaterial> materials,
  String? previousHash,
}) {
  final sortedMaterials = List<AppointmentMaterial>.from(materials)
    ..sort((a, b) {
      final keyA = '${a.manufacturer}|${a.productName}|${a.batchNumber}';
      final keyB = '${b.manufacturer}|${b.productName}|${b.batchNumber}';
      return keyA.compareTo(keyB);
    });

  final canonical = jsonEncode({
    'appointmentId': appointmentId.toString(),
    'artistProfileId': artistProfileId.toString(),
    'customerId': customerId.toString(),
    'finalizedAt': finalizedAt.toUtc().toIso8601String(),
    'type': type.name,
    'materials': sortedMaterials
        .map(
          (m) => {
            'manufacturer': m.manufacturer,
            'productName': m.productName,
            'batchNumber': m.batchNumber,
          },
        )
        .toList(),
    'previousHash': ?previousHash,
  });

  return sha256.convert(utf8.encode(canonical)).toString();
}
