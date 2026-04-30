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
import 'artist_profile/artist_profile.dart' as _i2;
import 'customer/create_customer_result.dart' as _i3;
import 'customer/customer.dart' as _i4;
import 'greetings/greeting.dart' as _i5;
import 'inventory/material.dart' as _i6;
import 'inventory/material_status.dart' as _i7;
import 'inventory/material_type.dart' as _i8;
import 'package:octattoo_client/src/protocol/customer/customer.dart' as _i9;
import 'package:octattoo_client/src/protocol/inventory/material.dart' as _i10;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i11;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i12;
export 'artist_profile/artist_profile.dart';
export 'customer/create_customer_result.dart';
export 'customer/customer.dart';
export 'greetings/greeting.dart';
export 'inventory/material.dart';
export 'inventory/material_status.dart';
export 'inventory/material_type.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.ArtistProfile) {
      return _i2.ArtistProfile.fromJson(data) as T;
    }
    if (t == _i3.CreateCustomerResult) {
      return _i3.CreateCustomerResult.fromJson(data) as T;
    }
    if (t == _i4.Customer) {
      return _i4.Customer.fromJson(data) as T;
    }
    if (t == _i5.Greeting) {
      return _i5.Greeting.fromJson(data) as T;
    }
    if (t == _i6.Material) {
      return _i6.Material.fromJson(data) as T;
    }
    if (t == _i7.MaterialStatus) {
      return _i7.MaterialStatus.fromJson(data) as T;
    }
    if (t == _i8.MaterialType) {
      return _i8.MaterialType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.ArtistProfile?>()) {
      return (data != null ? _i2.ArtistProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.CreateCustomerResult?>()) {
      return (data != null ? _i3.CreateCustomerResult.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i4.Customer?>()) {
      return (data != null ? _i4.Customer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Greeting?>()) {
      return (data != null ? _i5.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Material?>()) {
      return (data != null ? _i6.Material.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.MaterialStatus?>()) {
      return (data != null ? _i7.MaterialStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.MaterialType?>()) {
      return (data != null ? _i8.MaterialType.fromJson(data) : null) as T;
    }
    if (t == List<_i4.Customer>) {
      return (data as List).map((e) => deserialize<_i4.Customer>(e)).toList()
          as T;
    }
    if (t == List<_i9.Customer>) {
      return (data as List).map((e) => deserialize<_i9.Customer>(e)).toList()
          as T;
    }
    if (t == List<_i10.Material>) {
      return (data as List).map((e) => deserialize<_i10.Material>(e)).toList()
          as T;
    }
    try {
      return _i11.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i12.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.ArtistProfile => 'ArtistProfile',
      _i3.CreateCustomerResult => 'CreateCustomerResult',
      _i4.Customer => 'Customer',
      _i5.Greeting => 'Greeting',
      _i6.Material => 'Material',
      _i7.MaterialStatus => 'MaterialStatus',
      _i8.MaterialType => 'MaterialType',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('octattoo.', '');
    }

    switch (data) {
      case _i2.ArtistProfile():
        return 'ArtistProfile';
      case _i3.CreateCustomerResult():
        return 'CreateCustomerResult';
      case _i4.Customer():
        return 'Customer';
      case _i5.Greeting():
        return 'Greeting';
      case _i6.Material():
        return 'Material';
      case _i7.MaterialStatus():
        return 'MaterialStatus';
      case _i8.MaterialType():
        return 'MaterialType';
    }
    className = _i11.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i12.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'ArtistProfile') {
      return deserialize<_i2.ArtistProfile>(data['data']);
    }
    if (dataClassName == 'CreateCustomerResult') {
      return deserialize<_i3.CreateCustomerResult>(data['data']);
    }
    if (dataClassName == 'Customer') {
      return deserialize<_i4.Customer>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i5.Greeting>(data['data']);
    }
    if (dataClassName == 'Material') {
      return deserialize<_i6.Material>(data['data']);
    }
    if (dataClassName == 'MaterialStatus') {
      return deserialize<_i7.MaterialStatus>(data['data']);
    }
    if (dataClassName == 'MaterialType') {
      return deserialize<_i8.MaterialType>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i11.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i12.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i11.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i12.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
