/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

/// A single match from a Recall search — assembled from joins, not stored directly.
abstract class RecallMatch
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  RecallMatch._({
    required this.appointmentId,
    required this.appointmentDate,
    required this.customerName,
    required this.customerContact,
    required this.artistProfileName,
    required this.contacted,
  });

  factory RecallMatch({
    required _i1.UuidValue appointmentId,
    required DateTime appointmentDate,
    required String customerName,
    required String customerContact,
    required String artistProfileName,
    required bool contacted,
  }) = _RecallMatchImpl;

  factory RecallMatch.fromJson(Map<String, dynamic> jsonSerialization) {
    return RecallMatch(
      appointmentId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['appointmentId'],
      ),
      appointmentDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['appointmentDate'],
      ),
      customerName: jsonSerialization['customerName'] as String,
      customerContact: jsonSerialization['customerContact'] as String,
      artistProfileName: jsonSerialization['artistProfileName'] as String,
      contacted: _i1.BoolJsonExtension.fromJson(jsonSerialization['contacted']),
    );
  }

  _i1.UuidValue appointmentId;

  DateTime appointmentDate;

  String customerName;

  /// Email or phone, whichever is available.
  String customerContact;

  String artistProfileName;

  bool contacted;

  /// Returns a shallow copy of this [RecallMatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RecallMatch copyWith({
    _i1.UuidValue? appointmentId,
    DateTime? appointmentDate,
    String? customerName,
    String? customerContact,
    String? artistProfileName,
    bool? contacted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RecallMatch',
      'appointmentId': appointmentId.toJson(),
      'appointmentDate': appointmentDate.toJson(),
      'customerName': customerName,
      'customerContact': customerContact,
      'artistProfileName': artistProfileName,
      'contacted': contacted,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RecallMatch',
      'appointmentId': appointmentId.toJson(),
      'appointmentDate': appointmentDate.toJson(),
      'customerName': customerName,
      'customerContact': customerContact,
      'artistProfileName': artistProfileName,
      'contacted': contacted,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _RecallMatchImpl extends RecallMatch {
  _RecallMatchImpl({
    required _i1.UuidValue appointmentId,
    required DateTime appointmentDate,
    required String customerName,
    required String customerContact,
    required String artistProfileName,
    required bool contacted,
  }) : super._(
         appointmentId: appointmentId,
         appointmentDate: appointmentDate,
         customerName: customerName,
         customerContact: customerContact,
         artistProfileName: artistProfileName,
         contacted: contacted,
       );

  /// Returns a shallow copy of this [RecallMatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RecallMatch copyWith({
    _i1.UuidValue? appointmentId,
    DateTime? appointmentDate,
    String? customerName,
    String? customerContact,
    String? artistProfileName,
    bool? contacted,
  }) {
    return RecallMatch(
      appointmentId: appointmentId ?? this.appointmentId,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      customerName: customerName ?? this.customerName,
      customerContact: customerContact ?? this.customerContact,
      artistProfileName: artistProfileName ?? this.artistProfileName,
      contacted: contacted ?? this.contacted,
    );
  }
}
