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
import 'dart:async' as _i2;
import 'package:octattoo_client/src/protocol/appointment/appointment.dart'
    as _i3;
import 'package:octattoo_client/src/protocol/appointment/appointment_type.dart'
    as _i4;
import 'package:octattoo_client/src/protocol/appointment/appointment_material.dart'
    as _i5;
import 'package:octattoo_client/src/protocol/artist_profile/artist_profile.dart'
    as _i6;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i7;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i8;
import 'package:octattoo_client/src/protocol/customer/create_customer_result.dart'
    as _i9;
import 'package:octattoo_client/src/protocol/customer/customer.dart' as _i10;
import 'package:octattoo_client/src/protocol/greetings/greeting.dart' as _i11;
import 'package:octattoo_client/src/protocol/inventory/material.dart' as _i12;
import 'package:octattoo_client/src/protocol/inventory/material_type.dart'
    as _i13;
import 'package:octattoo_client/src/protocol/secure_link/secure_link.dart'
    as _i14;
import 'package:octattoo_client/src/protocol/secure_link/secure_link_type.dart'
    as _i15;
import 'package:octattoo_client/src/protocol/storage/stored_file.dart' as _i16;
import 'dart:typed_data' as _i17;
import 'package:octattoo_client/src/protocol/traceability/session_record.dart'
    as _i18;
import 'protocol.dart' as _i19;

/// {@category Endpoint}
class EndpointAppointment extends _i1.EndpointRef {
  EndpointAppointment(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'appointment';

  /// Creates a new appointment in Scheduled status.
  _i2.Future<_i3.Appointment> createAppointment({
    required _i4.AppointmentType type,
    required _i1.UuidValue customerId,
    required DateTime scheduledAt,
    String? notes,
  }) => caller.callServerEndpoint<_i3.Appointment>(
    'appointment',
    'createAppointment',
    {
      'type': type,
      'customerId': customerId,
      'scheduledAt': scheduledAt,
      'notes': notes,
    },
  );

  /// Transitions appointment from Scheduled to In Progress.
  _i2.Future<_i3.Appointment> startAppointment(_i1.UuidValue appointmentId) =>
      caller.callServerEndpoint<_i3.Appointment>(
        'appointment',
        'startAppointment',
        {'appointmentId': appointmentId},
      );

  /// Transitions appointment from In Progress to Finalized.
  /// Returns a warning flag if tattoo-type with zero materials.
  _i2.Future<_i3.Appointment> finalizeAppointment(
    _i1.UuidValue appointmentId, {
    required bool overrideZeroMaterials,
  }) => caller.callServerEndpoint<_i3.Appointment>(
    'appointment',
    'finalizeAppointment',
    {
      'appointmentId': appointmentId,
      'overrideZeroMaterials': overrideZeroMaterials,
    },
  );

  /// Records a material from inventory, creating a snapshot.
  /// Only allowed when appointment is In Progress.
  _i2.Future<_i5.AppointmentMaterial> recordMaterial({
    required _i1.UuidValue appointmentId,
    required _i1.UuidValue materialId,
  }) => caller.callServerEndpoint<_i5.AppointmentMaterial>(
    'appointment',
    'recordMaterial',
    {
      'appointmentId': appointmentId,
      'materialId': materialId,
    },
  );

  /// Lists appointments for the current artist profile.
  _i2.Future<List<_i3.Appointment>> listAppointments() =>
      caller.callServerEndpoint<List<_i3.Appointment>>(
        'appointment',
        'listAppointments',
        {},
      );
}

/// {@category Endpoint}
class EndpointArtistProfile extends _i1.EndpointRef {
  EndpointArtistProfile(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'artistProfile';

  /// Creates a new Artist Profile for the authenticated account.
  _i2.Future<_i6.ArtistProfile> createProfile(
    String name,
    String handle,
  ) => caller.callServerEndpoint<_i6.ArtistProfile>(
    'artistProfile',
    'createProfile',
    {
      'name': name,
      'handle': handle,
    },
  );

  /// Checks if a handle is available.
  _i2.Future<bool> isHandleAvailable(String handle) =>
      caller.callServerEndpoint<bool>(
        'artistProfile',
        'isHandleAvailable',
        {'handle': handle},
      );

  /// Returns all profiles for the authenticated account.
  _i2.Future<List<_i6.ArtistProfile>> listMyProfiles() =>
      caller.callServerEndpoint<List<_i6.ArtistProfile>>(
        'artistProfile',
        'listMyProfiles',
        {},
      );

  /// Updates the handle for a profile owned by the authenticated account.
  _i2.Future<_i6.ArtistProfile> updateHandle(
    _i1.UuidValue profileId,
    String newHandle,
  ) => caller.callServerEndpoint<_i6.ArtistProfile>(
    'artistProfile',
    'updateHandle',
    {
      'profileId': profileId,
      'newHandle': newHandle,
    },
  );

  /// Suggests an available handle based on a display name.
  _i2.Future<String> suggestHandle(String name) =>
      caller.callServerEndpoint<String>(
        'artistProfile',
        'suggestHandle',
        {'name': name},
      );
}

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _i7.EndpointEmailIdpBase {
  EndpointEmailIdp(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i2.Future<_i8.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i8.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _i2.Future<_i1.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_i1.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _i2.Future<String> verifyRegistrationCode({
    required _i1.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _i2.Future<_i8.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i8.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _i2.Future<_i1.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_i1.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _i2.Future<String> verifyPasswordResetCode({
    required _i1.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i2.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _i2.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// {@category Endpoint}
class EndpointGoogleIdp extends _i7.EndpointGoogleIdpBase {
  EndpointGoogleIdp(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'googleIdp';

  /// Validates a Google ID token and either logs in the associated user or
  /// creates a new user account if the Google account ID is not yet known.
  ///
  /// If a new user is created an associated [UserProfile] is also created.
  @override
  _i2.Future<_i8.AuthSuccess> login({
    required String idToken,
    required String? accessToken,
  }) => caller.callServerEndpoint<_i8.AuthSuccess>(
    'googleIdp',
    'login',
    {
      'idToken': idToken,
      'accessToken': accessToken,
    },
  );

  @override
  _i2.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'googleIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _i8.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _i2.Future<_i8.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i8.AuthSuccess>(
    'jwtRefresh',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

/// {@category Endpoint}
class EndpointCustomer extends _i1.EndpointRef {
  EndpointCustomer(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'customer';

  /// Creates a customer, returning potential duplicates.
  _i2.Future<_i9.CreateCustomerResult> createCustomer({
    required String name,
    String? email,
    String? phone,
    String? notes,
  }) => caller.callServerEndpoint<_i9.CreateCustomerResult>(
    'customer',
    'createCustomer',
    {
      'name': name,
      'email': email,
      'phone': phone,
      'notes': notes,
    },
  );

  /// Lists customers for the current artist profile.
  _i2.Future<List<_i10.Customer>> listCustomers({String? search}) =>
      caller.callServerEndpoint<List<_i10.Customer>>(
        'customer',
        'listCustomers',
        {'search': search},
      );

  /// Gets a single customer by ID (scoped to artist profile).
  _i2.Future<_i10.Customer?> getCustomer(_i1.UuidValue customerId) =>
      caller.callServerEndpoint<_i10.Customer?>(
        'customer',
        'getCustomer',
        {'customerId': customerId},
      );

  /// Updates a customer (scoped to artist profile).
  _i2.Future<_i10.Customer?> updateCustomer({
    required _i1.UuidValue customerId,
    required String name,
    String? email,
    String? phone,
    String? notes,
  }) => caller.callServerEndpoint<_i10.Customer?>(
    'customer',
    'updateCustomer',
    {
      'customerId': customerId,
      'name': name,
      'email': email,
      'phone': phone,
      'notes': notes,
    },
  );

  /// Deletes a customer (scoped to artist profile).
  _i2.Future<bool> deleteCustomer(_i1.UuidValue customerId) =>
      caller.callServerEndpoint<bool>(
        'customer',
        'deleteCustomer',
        {'customerId': customerId},
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i11.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i11.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointMaterial extends _i1.EndpointRef {
  EndpointMaterial(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'material';

  /// Creates a material in the artist's personal inventory.
  _i2.Future<_i12.Material> createMaterial({
    required _i13.MaterialType type,
    required String manufacturer,
    required String supplier,
    required String productName,
    required String batchNumber,
    required DateTime expirationDate,
    int? quantity,
  }) => caller.callServerEndpoint<_i12.Material>(
    'material',
    'createMaterial',
    {
      'type': type,
      'manufacturer': manufacturer,
      'supplier': supplier,
      'productName': productName,
      'batchNumber': batchNumber,
      'expirationDate': expirationDate,
      'quantity': quantity,
    },
  );

  /// Lists materials for the current artist profile.
  _i2.Future<List<_i12.Material>> listMaterials({
    _i13.MaterialType? type,
    String? search,
  }) => caller.callServerEndpoint<List<_i12.Material>>(
    'material',
    'listMaterials',
    {
      'type': type,
      'search': search,
    },
  );

  /// Gets a single material by ID (scoped to artist profile).
  _i2.Future<_i12.Material?> getMaterial(_i1.UuidValue materialId) =>
      caller.callServerEndpoint<_i12.Material?>(
        'material',
        'getMaterial',
        {'materialId': materialId},
      );

  /// Updates a material (scoped to artist profile).
  _i2.Future<_i12.Material?> updateMaterial({
    required _i1.UuidValue materialId,
    required String manufacturer,
    required String supplier,
    required String productName,
    required String batchNumber,
    required DateTime expirationDate,
  }) => caller.callServerEndpoint<_i12.Material?>(
    'material',
    'updateMaterial',
    {
      'materialId': materialId,
      'manufacturer': manufacturer,
      'supplier': supplier,
      'productName': productName,
      'batchNumber': batchNumber,
      'expirationDate': expirationDate,
    },
  );

  /// Deletes a material (scoped to artist profile).
  _i2.Future<bool> deleteMaterial(_i1.UuidValue materialId) =>
      caller.callServerEndpoint<bool>(
        'material',
        'deleteMaterial',
        {'materialId': materialId},
      );

  /// Toggles ink status between inStock and empty.
  _i2.Future<_i12.Material?> toggleInkStatus(_i1.UuidValue materialId) =>
      caller.callServerEndpoint<_i12.Material?>(
        'material',
        'toggleInkStatus',
        {'materialId': materialId},
      );

  /// Sets needle quantity. Auto-marks empty when quantity reaches 0.
  _i2.Future<_i12.Material?> setNeedleQuantity({
    required _i1.UuidValue materialId,
    required int quantity,
  }) => caller.callServerEndpoint<_i12.Material?>(
    'material',
    'setNeedleQuantity',
    {
      'materialId': materialId,
      'quantity': quantity,
    },
  );

  /// Lists materials nearing expiration for the current artist profile.
  _i2.Future<List<_i12.Material>> listExpiringMaterials() =>
      caller.callServerEndpoint<List<_i12.Material>>(
        'material',
        'listExpiringMaterials',
        {},
      );
}

/// {@category Endpoint}
class EndpointSecureLink extends _i1.EndpointRef {
  EndpointSecureLink(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'secureLink';

  /// Creates a new secure link with a unique token.
  _i2.Future<_i14.SecureLink> createLink({
    required _i15.SecureLinkType type,
    required _i1.UuidValue targetId,
    int? expiresInDays,
  }) => caller.callServerEndpoint<_i14.SecureLink>(
    'secureLink',
    'createLink',
    {
      'type': type,
      'targetId': targetId,
      'expiresInDays': expiresInDays,
    },
  );

  /// Resolves a token to its link data. Returns null if not found or expired.
  _i2.Future<_i14.SecureLink?> resolveLink(String token) =>
      caller.callServerEndpoint<_i14.SecureLink?>(
        'secureLink',
        'resolveLink',
        {'token': token},
      );

  /// Renews an expired link, extending its expiration by the type default.
  _i2.Future<_i14.SecureLink?> renewLink(_i1.UuidValue linkId) =>
      caller.callServerEndpoint<_i14.SecureLink?>(
        'secureLink',
        'renewLink',
        {'linkId': linkId},
      );
}

/// {@category Endpoint}
class EndpointStorage extends _i1.EndpointRef {
  EndpointStorage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'storage';

  /// Uploads a file and returns the stored file metadata.
  _i2.Future<_i16.StoredFile> uploadFile({
    required String fileName,
    required String mimeType,
    required _i17.ByteData bytes,
  }) => caller.callServerEndpoint<_i16.StoredFile>(
    'storage',
    'uploadFile',
    {
      'fileName': fileName,
      'mimeType': mimeType,
      'bytes': bytes,
    },
  );

  /// Retrieves file metadata by ID (scoped to artist profile).
  _i2.Future<_i16.StoredFile?> getFile(_i1.UuidValue fileId) =>
      caller.callServerEndpoint<_i16.StoredFile?>(
        'storage',
        'getFile',
        {'fileId': fileId},
      );

  /// Deletes a file and all its variants.
  _i2.Future<bool> deleteFile(_i1.UuidValue fileId) =>
      caller.callServerEndpoint<bool>(
        'storage',
        'deleteFile',
        {'fileId': fileId},
      );

  /// Returns a URL for the requested variant, generating it if needed.
  _i2.Future<String> getVariantUrl({
    required _i1.UuidValue fileId,
    required String variant,
  }) => caller.callServerEndpoint<String>(
    'storage',
    'getVariantUrl',
    {
      'fileId': fileId,
      'variant': variant,
    },
  );

  /// Returns total storage usage in bytes for the current profile.
  _i2.Future<int> getStorageUsage() => caller.callServerEndpoint<int>(
    'storage',
    'getStorageUsage',
    {},
  );

  /// Sets the storage quota for the current profile (used in tests).
  _i2.Future<void> setStorageQuota(int quotaBytes) =>
      caller.callServerEndpoint<void>(
        'storage',
        'setStorageQuota',
        {'quotaBytes': quotaBytes},
      );
}

/// {@category Endpoint}
class EndpointSessionRecord extends _i1.EndpointRef {
  EndpointSessionRecord(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'sessionRecord';

  /// Returns the SessionRecord for a given appointment, or null if not sealed.
  _i2.Future<_i18.SessionRecord?> getByAppointmentId(
    _i1.UuidValue appointmentId,
  ) => caller.callServerEndpoint<_i18.SessionRecord?>(
    'sessionRecord',
    'getByAppointmentId',
    {'appointmentId': appointmentId},
  );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i7.Caller(client);
    serverpod_auth_core = _i8.Caller(client);
  }

  late final _i7.Caller serverpod_auth_idp;

  late final _i8.Caller serverpod_auth_core;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i19.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    appointment = EndpointAppointment(this);
    artistProfile = EndpointArtistProfile(this);
    emailIdp = EndpointEmailIdp(this);
    googleIdp = EndpointGoogleIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    customer = EndpointCustomer(this);
    greeting = EndpointGreeting(this);
    material = EndpointMaterial(this);
    secureLink = EndpointSecureLink(this);
    storage = EndpointStorage(this);
    sessionRecord = EndpointSessionRecord(this);
    modules = Modules(this);
  }

  late final EndpointAppointment appointment;

  late final EndpointArtistProfile artistProfile;

  late final EndpointEmailIdp emailIdp;

  late final EndpointGoogleIdp googleIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointCustomer customer;

  late final EndpointGreeting greeting;

  late final EndpointMaterial material;

  late final EndpointSecureLink secureLink;

  late final EndpointStorage storage;

  late final EndpointSessionRecord sessionRecord;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'appointment': appointment,
    'artistProfile': artistProfile,
    'emailIdp': emailIdp,
    'googleIdp': googleIdp,
    'jwtRefresh': jwtRefresh,
    'customer': customer,
    'greeting': greeting,
    'material': material,
    'secureLink': secureLink,
    'storage': storage,
    'sessionRecord': sessionRecord,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
