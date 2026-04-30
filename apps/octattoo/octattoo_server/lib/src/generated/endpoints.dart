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
import '../appointment/appointment_endpoint.dart' as _i2;
import '../artist_profile/artist_profile_endpoint.dart' as _i3;
import '../auth/email_idp_endpoint.dart' as _i4;
import '../auth/jwt_refresh_endpoint.dart' as _i5;
import '../customer/customer_endpoint.dart' as _i6;
import '../greetings/greeting_endpoint.dart' as _i7;
import '../inventory/material_endpoint.dart' as _i8;
import 'package:octattoo_server/src/generated/appointment/appointment_type.dart'
    as _i9;
import 'package:octattoo_server/src/generated/inventory/material_type.dart'
    as _i10;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i11;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i12;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'appointment': _i2.AppointmentEndpoint()
        ..initialize(
          server,
          'appointment',
          null,
        ),
      'artistProfile': _i3.ArtistProfileEndpoint()
        ..initialize(
          server,
          'artistProfile',
          null,
        ),
      'emailIdp': _i4.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _i5.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'customer': _i6.CustomerEndpoint()
        ..initialize(
          server,
          'customer',
          null,
        ),
      'greeting': _i7.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'material': _i8.MaterialEndpoint()
        ..initialize(
          server,
          'material',
          null,
        ),
    };
    connectors['appointment'] = _i1.EndpointConnector(
      name: 'appointment',
      endpoint: endpoints['appointment']!,
      methodConnectors: {
        'createAppointment': _i1.MethodConnector(
          name: 'createAppointment',
          params: {
            'type': _i1.ParameterDescription(
              name: 'type',
              type: _i1.getType<_i9.AppointmentType>(),
              nullable: false,
            ),
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'scheduledAt': _i1.ParameterDescription(
              name: 'scheduledAt',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'notes': _i1.ParameterDescription(
              name: 'notes',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['appointment'] as _i2.AppointmentEndpoint)
                  .createAppointment(
                    session,
                    type: params['type'],
                    customerId: params['customerId'],
                    scheduledAt: params['scheduledAt'],
                    notes: params['notes'],
                  ),
        ),
        'startAppointment': _i1.MethodConnector(
          name: 'startAppointment',
          params: {
            'appointmentId': _i1.ParameterDescription(
              name: 'appointmentId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['appointment'] as _i2.AppointmentEndpoint)
                  .startAppointment(
                    session,
                    params['appointmentId'],
                  ),
        ),
        'finalizeAppointment': _i1.MethodConnector(
          name: 'finalizeAppointment',
          params: {
            'appointmentId': _i1.ParameterDescription(
              name: 'appointmentId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'overrideZeroMaterials': _i1.ParameterDescription(
              name: 'overrideZeroMaterials',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['appointment'] as _i2.AppointmentEndpoint)
                  .finalizeAppointment(
                    session,
                    params['appointmentId'],
                    overrideZeroMaterials: params['overrideZeroMaterials'],
                  ),
        ),
        'recordMaterial': _i1.MethodConnector(
          name: 'recordMaterial',
          params: {
            'appointmentId': _i1.ParameterDescription(
              name: 'appointmentId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'materialId': _i1.ParameterDescription(
              name: 'materialId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['appointment'] as _i2.AppointmentEndpoint)
                  .recordMaterial(
                    session,
                    appointmentId: params['appointmentId'],
                    materialId: params['materialId'],
                  ),
        ),
        'listAppointments': _i1.MethodConnector(
          name: 'listAppointments',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['appointment'] as _i2.AppointmentEndpoint)
                  .listAppointments(session),
        ),
      },
    );
    connectors['artistProfile'] = _i1.EndpointConnector(
      name: 'artistProfile',
      endpoint: endpoints['artistProfile']!,
      methodConnectors: {
        'getMyProfileId': _i1.MethodConnector(
          name: 'getMyProfileId',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['artistProfile'] as _i3.ArtistProfileEndpoint)
                      .getMyProfileId(session),
        ),
      },
    );
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _i1.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _i1.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['jwtRefresh'] as _i5.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    connectors['customer'] = _i1.EndpointConnector(
      name: 'customer',
      endpoint: endpoints['customer']!,
      methodConnectors: {
        'createCustomer': _i1.MethodConnector(
          name: 'createCustomer',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'phone': _i1.ParameterDescription(
              name: 'phone',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'notes': _i1.ParameterDescription(
              name: 'notes',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['customer'] as _i6.CustomerEndpoint)
                  .createCustomer(
                    session,
                    name: params['name'],
                    email: params['email'],
                    phone: params['phone'],
                    notes: params['notes'],
                  ),
        ),
        'listCustomers': _i1.MethodConnector(
          name: 'listCustomers',
          params: {
            'search': _i1.ParameterDescription(
              name: 'search',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['customer'] as _i6.CustomerEndpoint).listCustomers(
                    session,
                    search: params['search'],
                  ),
        ),
        'getCustomer': _i1.MethodConnector(
          name: 'getCustomer',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['customer'] as _i6.CustomerEndpoint).getCustomer(
                    session,
                    params['customerId'],
                  ),
        ),
        'updateCustomer': _i1.MethodConnector(
          name: 'updateCustomer',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'phone': _i1.ParameterDescription(
              name: 'phone',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'notes': _i1.ParameterDescription(
              name: 'notes',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['customer'] as _i6.CustomerEndpoint)
                  .updateCustomer(
                    session,
                    customerId: params['customerId'],
                    name: params['name'],
                    email: params['email'],
                    phone: params['phone'],
                    notes: params['notes'],
                  ),
        ),
        'deleteCustomer': _i1.MethodConnector(
          name: 'deleteCustomer',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['customer'] as _i6.CustomerEndpoint)
                  .deleteCustomer(
                    session,
                    params['customerId'],
                  ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['greeting'] as _i7.GreetingEndpoint).hello(
                session,
                params['name'],
              ),
        ),
      },
    );
    connectors['material'] = _i1.EndpointConnector(
      name: 'material',
      endpoint: endpoints['material']!,
      methodConnectors: {
        'createMaterial': _i1.MethodConnector(
          name: 'createMaterial',
          params: {
            'type': _i1.ParameterDescription(
              name: 'type',
              type: _i1.getType<_i10.MaterialType>(),
              nullable: false,
            ),
            'manufacturer': _i1.ParameterDescription(
              name: 'manufacturer',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'supplier': _i1.ParameterDescription(
              name: 'supplier',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'productName': _i1.ParameterDescription(
              name: 'productName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'batchNumber': _i1.ParameterDescription(
              name: 'batchNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'expirationDate': _i1.ParameterDescription(
              name: 'expirationDate',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['material'] as _i8.MaterialEndpoint)
                  .createMaterial(
                    session,
                    type: params['type'],
                    manufacturer: params['manufacturer'],
                    supplier: params['supplier'],
                    productName: params['productName'],
                    batchNumber: params['batchNumber'],
                    expirationDate: params['expirationDate'],
                    quantity: params['quantity'],
                  ),
        ),
        'listMaterials': _i1.MethodConnector(
          name: 'listMaterials',
          params: {
            'type': _i1.ParameterDescription(
              name: 'type',
              type: _i1.getType<_i10.MaterialType?>(),
              nullable: true,
            ),
            'search': _i1.ParameterDescription(
              name: 'search',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['material'] as _i8.MaterialEndpoint).listMaterials(
                    session,
                    type: params['type'],
                    search: params['search'],
                  ),
        ),
        'getMaterial': _i1.MethodConnector(
          name: 'getMaterial',
          params: {
            'materialId': _i1.ParameterDescription(
              name: 'materialId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['material'] as _i8.MaterialEndpoint).getMaterial(
                    session,
                    params['materialId'],
                  ),
        ),
        'updateMaterial': _i1.MethodConnector(
          name: 'updateMaterial',
          params: {
            'materialId': _i1.ParameterDescription(
              name: 'materialId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'manufacturer': _i1.ParameterDescription(
              name: 'manufacturer',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'supplier': _i1.ParameterDescription(
              name: 'supplier',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'productName': _i1.ParameterDescription(
              name: 'productName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'batchNumber': _i1.ParameterDescription(
              name: 'batchNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'expirationDate': _i1.ParameterDescription(
              name: 'expirationDate',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['material'] as _i8.MaterialEndpoint)
                  .updateMaterial(
                    session,
                    materialId: params['materialId'],
                    manufacturer: params['manufacturer'],
                    supplier: params['supplier'],
                    productName: params['productName'],
                    batchNumber: params['batchNumber'],
                    expirationDate: params['expirationDate'],
                  ),
        ),
        'deleteMaterial': _i1.MethodConnector(
          name: 'deleteMaterial',
          params: {
            'materialId': _i1.ParameterDescription(
              name: 'materialId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['material'] as _i8.MaterialEndpoint)
                  .deleteMaterial(
                    session,
                    params['materialId'],
                  ),
        ),
        'toggleInkStatus': _i1.MethodConnector(
          name: 'toggleInkStatus',
          params: {
            'materialId': _i1.ParameterDescription(
              name: 'materialId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['material'] as _i8.MaterialEndpoint)
                  .toggleInkStatus(
                    session,
                    params['materialId'],
                  ),
        ),
        'setNeedleQuantity': _i1.MethodConnector(
          name: 'setNeedleQuantity',
          params: {
            'materialId': _i1.ParameterDescription(
              name: 'materialId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['material'] as _i8.MaterialEndpoint)
                  .setNeedleQuantity(
                    session,
                    materialId: params['materialId'],
                    quantity: params['quantity'],
                  ),
        ),
        'listExpiringMaterials': _i1.MethodConnector(
          name: 'listExpiringMaterials',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['material'] as _i8.MaterialEndpoint)
                  .listExpiringMaterials(session),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i11.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i12.Endpoints()
      ..initializeEndpoints(server);
  }
}
