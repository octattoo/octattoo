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
import '../customer/customer.dart' as _i2;
import 'package:octattoo_server/src/generated/protocol.dart' as _i3;

/// Result of creating a customer, includes potential duplicates.
abstract class CreateCustomerResult
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateCustomerResult._({
    required this.customer,
    required this.potentialDuplicates,
  });

  factory CreateCustomerResult({
    required _i2.Customer customer,
    required List<_i2.Customer> potentialDuplicates,
  }) = _CreateCustomerResultImpl;

  factory CreateCustomerResult.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CreateCustomerResult(
      customer: _i3.Protocol().deserialize<_i2.Customer>(
        jsonSerialization['customer'],
      ),
      potentialDuplicates: _i3.Protocol().deserialize<List<_i2.Customer>>(
        jsonSerialization['potentialDuplicates'],
      ),
    );
  }

  /// The newly created customer.
  _i2.Customer customer;

  /// Potential duplicate customers (non-blocking).
  List<_i2.Customer> potentialDuplicates;

  /// Returns a shallow copy of this [CreateCustomerResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateCustomerResult copyWith({
    _i2.Customer? customer,
    List<_i2.Customer>? potentialDuplicates,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateCustomerResult',
      'customer': customer.toJson(),
      'potentialDuplicates': potentialDuplicates.toJson(
        valueToJson: (v) => v.toJson(),
      ),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CreateCustomerResult',
      'customer': customer.toJsonForProtocol(),
      'potentialDuplicates': potentialDuplicates.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CreateCustomerResultImpl extends CreateCustomerResult {
  _CreateCustomerResultImpl({
    required _i2.Customer customer,
    required List<_i2.Customer> potentialDuplicates,
  }) : super._(
         customer: customer,
         potentialDuplicates: potentialDuplicates,
       );

  /// Returns a shallow copy of this [CreateCustomerResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateCustomerResult copyWith({
    _i2.Customer? customer,
    List<_i2.Customer>? potentialDuplicates,
  }) {
    return CreateCustomerResult(
      customer: customer ?? this.customer.copyWith(),
      potentialDuplicates:
          potentialDuplicates ??
          this.potentialDuplicates.map((e0) => e0.copyWith()).toList(),
    );
  }
}
