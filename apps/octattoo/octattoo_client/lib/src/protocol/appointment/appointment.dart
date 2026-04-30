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
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../appointment/appointment_type.dart' as _i2;
import '../appointment/appointment_status.dart' as _i3;

/// A scheduled session between an artist and a customer.
abstract class Appointment implements _i1.SerializableModel {
  Appointment._({
    this.id,
    required this.artistProfileId,
    required this.customerId,
    required this.workplaceId,
    required this.type,
    required this.status,
    required this.scheduledAt,
    this.startedAt,
    this.finalizedAt,
    this.notes,
    this.createdAt,
  });

  factory Appointment({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required _i1.UuidValue customerId,
    required _i1.UuidValue workplaceId,
    required _i2.AppointmentType type,
    required _i3.AppointmentStatus status,
    required DateTime scheduledAt,
    DateTime? startedAt,
    DateTime? finalizedAt,
    String? notes,
    DateTime? createdAt,
  }) = _AppointmentImpl;

  factory Appointment.fromJson(Map<String, dynamic> jsonSerialization) {
    return Appointment(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      artistProfileId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['artistProfileId'],
      ),
      customerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['customerId'],
      ),
      workplaceId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['workplaceId'],
      ),
      type: _i2.AppointmentType.fromJson((jsonSerialization['type'] as String)),
      status: _i3.AppointmentStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      scheduledAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['scheduledAt'],
      ),
      startedAt: jsonSerialization['startedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startedAt']),
      finalizedAt: jsonSerialization['finalizedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['finalizedAt'],
            ),
      notes: jsonSerialization['notes'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  /// The artist profile this appointment belongs to.
  _i1.UuidValue artistProfileId;

  /// The customer for this appointment.
  _i1.UuidValue customerId;

  /// The workplace where this appointment takes place.
  _i1.UuidValue workplaceId;

  /// Tattoo, consultation, or touch-up.
  _i2.AppointmentType type;

  /// Current lifecycle status.
  _i3.AppointmentStatus status;

  /// When this appointment is scheduled for.
  DateTime scheduledAt;

  /// When the artist started the appointment.
  DateTime? startedAt;

  /// When the artist finalized the appointment.
  DateTime? finalizedAt;

  /// Free-form notes.
  String? notes;

  /// When this appointment was created.
  DateTime? createdAt;

  /// Returns a shallow copy of this [Appointment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Appointment copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? artistProfileId,
    _i1.UuidValue? customerId,
    _i1.UuidValue? workplaceId,
    _i2.AppointmentType? type,
    _i3.AppointmentStatus? status,
    DateTime? scheduledAt,
    DateTime? startedAt,
    DateTime? finalizedAt,
    String? notes,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Appointment',
      if (id != null) 'id': id?.toJson(),
      'artistProfileId': artistProfileId.toJson(),
      'customerId': customerId.toJson(),
      'workplaceId': workplaceId.toJson(),
      'type': type.toJson(),
      'status': status.toJson(),
      'scheduledAt': scheduledAt.toJson(),
      if (startedAt != null) 'startedAt': startedAt?.toJson(),
      if (finalizedAt != null) 'finalizedAt': finalizedAt?.toJson(),
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppointmentImpl extends Appointment {
  _AppointmentImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required _i1.UuidValue customerId,
    required _i1.UuidValue workplaceId,
    required _i2.AppointmentType type,
    required _i3.AppointmentStatus status,
    required DateTime scheduledAt,
    DateTime? startedAt,
    DateTime? finalizedAt,
    String? notes,
    DateTime? createdAt,
  }) : super._(
         id: id,
         artistProfileId: artistProfileId,
         customerId: customerId,
         workplaceId: workplaceId,
         type: type,
         status: status,
         scheduledAt: scheduledAt,
         startedAt: startedAt,
         finalizedAt: finalizedAt,
         notes: notes,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Appointment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Appointment copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? artistProfileId,
    _i1.UuidValue? customerId,
    _i1.UuidValue? workplaceId,
    _i2.AppointmentType? type,
    _i3.AppointmentStatus? status,
    DateTime? scheduledAt,
    Object? startedAt = _Undefined,
    Object? finalizedAt = _Undefined,
    Object? notes = _Undefined,
    Object? createdAt = _Undefined,
  }) {
    return Appointment(
      id: id is _i1.UuidValue? ? id : this.id,
      artistProfileId: artistProfileId ?? this.artistProfileId,
      customerId: customerId ?? this.customerId,
      workplaceId: workplaceId ?? this.workplaceId,
      type: type ?? this.type,
      status: status ?? this.status,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      startedAt: startedAt is DateTime? ? startedAt : this.startedAt,
      finalizedAt: finalizedAt is DateTime? ? finalizedAt : this.finalizedAt,
      notes: notes is String? ? notes : this.notes,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}
