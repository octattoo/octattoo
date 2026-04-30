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

/// Thrown when an upload would exceed the artist's storage quota.
abstract class StorageQuotaExceededException
    implements _i1.SerializableException, _i1.SerializableModel {
  StorageQuotaExceededException._({
    required this.currentUsage,
    required this.maxAllowed,
  });

  factory StorageQuotaExceededException({
    required int currentUsage,
    required int maxAllowed,
  }) = _StorageQuotaExceededExceptionImpl;

  factory StorageQuotaExceededException.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return StorageQuotaExceededException(
      currentUsage: jsonSerialization['currentUsage'] as int,
      maxAllowed: jsonSerialization['maxAllowed'] as int,
    );
  }

  /// Current usage in bytes.
  int currentUsage;

  /// Maximum allowed in bytes.
  int maxAllowed;

  /// Returns a shallow copy of this [StorageQuotaExceededException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StorageQuotaExceededException copyWith({
    int? currentUsage,
    int? maxAllowed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StorageQuotaExceededException',
      'currentUsage': currentUsage,
      'maxAllowed': maxAllowed,
    };
  }

  @override
  String toString() {
    return 'StorageQuotaExceededException(currentUsage: $currentUsage, maxAllowed: $maxAllowed)';
  }
}

class _StorageQuotaExceededExceptionImpl extends StorageQuotaExceededException {
  _StorageQuotaExceededExceptionImpl({
    required int currentUsage,
    required int maxAllowed,
  }) : super._(
         currentUsage: currentUsage,
         maxAllowed: maxAllowed,
       );

  /// Returns a shallow copy of this [StorageQuotaExceededException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StorageQuotaExceededException copyWith({
    int? currentUsage,
    int? maxAllowed,
  }) {
    return StorageQuotaExceededException(
      currentUsage: currentUsage ?? this.currentUsage,
      maxAllowed: maxAllowed ?? this.maxAllowed,
    );
  }
}
