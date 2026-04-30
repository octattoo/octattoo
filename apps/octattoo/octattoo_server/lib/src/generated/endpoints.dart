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
import '../auth/google_idp_endpoint.dart' as _i5;
import '../auth/jwt_refresh_endpoint.dart' as _i6;
import '../customer/customer_endpoint.dart' as _i7;
import '../greetings/greeting_endpoint.dart' as _i8;
import '../inventory/material_endpoint.dart' as _i9;
import '../secure_link/secure_link_endpoint.dart' as _i10;
import '../storage/storage_endpoint.dart' as _i11;
import '../traceability/session_record_endpoint.dart' as _i12;
import 'package:octattoo_server/src/generated/appointment/appointment_type.dart'
    as _i13;
import 'package:octattoo_server/src/generated/inventory/material_type.dart'
    as _i14;
import 'package:octattoo_server/src/generated/secure_link/secure_link_type.dart'
    as _i15;
import 'dart:typed_data' as _i16;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i17;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i18;

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
      'googleIdp': _i5.GoogleIdpEndpoint()
        ..initialize(
          server,
          'googleIdp',
          null,
        ),
      'jwtRefresh': _i6.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'customer': _i7.CustomerEndpoint()
        ..initialize(
          server,
          'customer',
          null,
        ),
      'greeting': _i8.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'material': _i9.MaterialEndpoint()
        ..initialize(
          server,
          'material',
          null,
        ),
      'secureLink': _i10.SecureLinkEndpoint()
        ..initialize(
          server,
          'secureLink',
          null,
        ),
      'storage': _i11.StorageEndpoint()
        ..initialize(
          server,
          'storage',
          null,
        ),
      'sessionRecord': _i12.SessionRecordEndpoint()
        ..initialize(
          server,
          'sessionRecord',
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
              type: _i1.getType<_i13.AppointmentType>(),
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
        'createProfile': _i1.MethodConnector(
          name: 'createProfile',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'handle': _i1.ParameterDescription(
              name: 'handle',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['artistProfile'] as _i3.ArtistProfileEndpoint)
                      .createProfile(
                        session,
                        params['name'],
                        params['handle'],
                      ),
        ),
        'isHandleAvailable': _i1.MethodConnector(
          name: 'isHandleAvailable',
          params: {
            'handle': _i1.ParameterDescription(
              name: 'handle',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['artistProfile'] as _i3.ArtistProfileEndpoint)
                      .isHandleAvailable(
                        session,
                        params['handle'],
                      ),
        ),
        'listMyProfiles': _i1.MethodConnector(
          name: 'listMyProfiles',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['artistProfile'] as _i3.ArtistProfileEndpoint)
                      .listMyProfiles(session),
        ),
        'updateHandle': _i1.MethodConnector(
          name: 'updateHandle',
          params: {
            'profileId': _i1.ParameterDescription(
              name: 'profileId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'newHandle': _i1.ParameterDescription(
              name: 'newHandle',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['artistProfile'] as _i3.ArtistProfileEndpoint)
                      .updateHandle(
                        session,
                        params['profileId'],
                        params['newHandle'],
                      ),
        ),
        'suggestHandle': _i1.MethodConnector(
          name: 'suggestHandle',
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
              ) async =>
                  (endpoints['artistProfile'] as _i3.ArtistProfileEndpoint)
                      .suggestHandle(
                        session,
                        params['name'],
                      ),
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
    connectors['googleIdp'] = _i1.EndpointConnector(
      name: 'googleIdp',
      endpoint: endpoints['googleIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'idToken': _i1.ParameterDescription(
              name: 'idToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'accessToken': _i1.ParameterDescription(
              name: 'accessToken',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['googleIdp'] as _i5.GoogleIdpEndpoint).login(
                    session,
                    idToken: params['idToken'],
                    accessToken: params['accessToken'],
                  ),
        ),
        'hasAccount': _i1.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['googleIdp'] as _i5.GoogleIdpEndpoint)
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
              ) async => (endpoints['jwtRefresh'] as _i6.JwtRefreshEndpoint)
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
              ) async => (endpoints['customer'] as _i7.CustomerEndpoint)
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
                  (endpoints['customer'] as _i7.CustomerEndpoint).listCustomers(
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
                  (endpoints['customer'] as _i7.CustomerEndpoint).getCustomer(
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
              ) async => (endpoints['customer'] as _i7.CustomerEndpoint)
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
              ) async => (endpoints['customer'] as _i7.CustomerEndpoint)
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
              ) async => (endpoints['greeting'] as _i8.GreetingEndpoint).hello(
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
              type: _i1.getType<_i14.MaterialType>(),
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
              ) async => (endpoints['material'] as _i9.MaterialEndpoint)
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
              type: _i1.getType<_i14.MaterialType?>(),
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
                  (endpoints['material'] as _i9.MaterialEndpoint).listMaterials(
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
                  (endpoints['material'] as _i9.MaterialEndpoint).getMaterial(
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
              ) async => (endpoints['material'] as _i9.MaterialEndpoint)
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
              ) async => (endpoints['material'] as _i9.MaterialEndpoint)
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
              ) async => (endpoints['material'] as _i9.MaterialEndpoint)
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
              ) async => (endpoints['material'] as _i9.MaterialEndpoint)
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
              ) async => (endpoints['material'] as _i9.MaterialEndpoint)
                  .listExpiringMaterials(session),
        ),
      },
    );
    connectors['secureLink'] = _i1.EndpointConnector(
      name: 'secureLink',
      endpoint: endpoints['secureLink']!,
      methodConnectors: {
        'createLink': _i1.MethodConnector(
          name: 'createLink',
          params: {
            'type': _i1.ParameterDescription(
              name: 'type',
              type: _i1.getType<_i15.SecureLinkType>(),
              nullable: false,
            ),
            'targetId': _i1.ParameterDescription(
              name: 'targetId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'expiresInDays': _i1.ParameterDescription(
              name: 'expiresInDays',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['secureLink'] as _i10.SecureLinkEndpoint)
                  .createLink(
                    session,
                    type: params['type'],
                    targetId: params['targetId'],
                    expiresInDays: params['expiresInDays'],
                  ),
        ),
        'resolveLink': _i1.MethodConnector(
          name: 'resolveLink',
          params: {
            'token': _i1.ParameterDescription(
              name: 'token',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['secureLink'] as _i10.SecureLinkEndpoint)
                  .resolveLink(
                    session,
                    params['token'],
                  ),
        ),
        'renewLink': _i1.MethodConnector(
          name: 'renewLink',
          params: {
            'linkId': _i1.ParameterDescription(
              name: 'linkId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['secureLink'] as _i10.SecureLinkEndpoint)
                  .renewLink(
                    session,
                    params['linkId'],
                  ),
        ),
      },
    );
    connectors['storage'] = _i1.EndpointConnector(
      name: 'storage',
      endpoint: endpoints['storage']!,
      methodConnectors: {
        'uploadFile': _i1.MethodConnector(
          name: 'uploadFile',
          params: {
            'fileName': _i1.ParameterDescription(
              name: 'fileName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'mimeType': _i1.ParameterDescription(
              name: 'mimeType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'bytes': _i1.ParameterDescription(
              name: 'bytes',
              type: _i1.getType<_i16.ByteData>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['storage'] as _i11.StorageEndpoint).uploadFile(
                    session,
                    fileName: params['fileName'],
                    mimeType: params['mimeType'],
                    bytes: params['bytes'],
                  ),
        ),
        'getFile': _i1.MethodConnector(
          name: 'getFile',
          params: {
            'fileId': _i1.ParameterDescription(
              name: 'fileId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['storage'] as _i11.StorageEndpoint).getFile(
                session,
                params['fileId'],
              ),
        ),
        'deleteFile': _i1.MethodConnector(
          name: 'deleteFile',
          params: {
            'fileId': _i1.ParameterDescription(
              name: 'fileId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['storage'] as _i11.StorageEndpoint).deleteFile(
                    session,
                    params['fileId'],
                  ),
        ),
        'getVariantUrl': _i1.MethodConnector(
          name: 'getVariantUrl',
          params: {
            'fileId': _i1.ParameterDescription(
              name: 'fileId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'variant': _i1.ParameterDescription(
              name: 'variant',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['storage'] as _i11.StorageEndpoint).getVariantUrl(
                    session,
                    fileId: params['fileId'],
                    variant: params['variant'],
                  ),
        ),
        'getStorageUsage': _i1.MethodConnector(
          name: 'getStorageUsage',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['storage'] as _i11.StorageEndpoint)
                  .getStorageUsage(session),
        ),
        'setStorageQuota': _i1.MethodConnector(
          name: 'setStorageQuota',
          params: {
            'quotaBytes': _i1.ParameterDescription(
              name: 'quotaBytes',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['storage'] as _i11.StorageEndpoint)
                  .setStorageQuota(
                    session,
                    params['quotaBytes'],
                  ),
        ),
      },
    );
    connectors['sessionRecord'] = _i1.EndpointConnector(
      name: 'sessionRecord',
      endpoint: endpoints['sessionRecord']!,
      methodConnectors: {
        'getByAppointmentId': _i1.MethodConnector(
          name: 'getByAppointmentId',
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
              ) async =>
                  (endpoints['sessionRecord'] as _i12.SessionRecordEndpoint)
                      .getByAppointmentId(
                        session,
                        params['appointmentId'],
                      ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i17.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i18.Endpoints()
      ..initializeEndpoints(server);
  }
}
