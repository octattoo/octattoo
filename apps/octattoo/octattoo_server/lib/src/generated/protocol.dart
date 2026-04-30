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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i3;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import 'appointment/appointment.dart' as _i5;
import 'appointment/appointment_material.dart' as _i6;
import 'appointment/appointment_status.dart' as _i7;
import 'appointment/appointment_type.dart' as _i8;
import 'artist_profile/artist_profile.dart' as _i9;
import 'customer/create_customer_result.dart' as _i10;
import 'customer/customer.dart' as _i11;
import 'greetings/greeting.dart' as _i12;
import 'inventory/material.dart' as _i13;
import 'inventory/material_status.dart' as _i14;
import 'inventory/material_type.dart' as _i15;
import 'secure_link/secure_link.dart' as _i16;
import 'secure_link/secure_link_status.dart' as _i17;
import 'secure_link/secure_link_type.dart' as _i18;
import 'storage/storage_quota_exceeded_exception.dart' as _i19;
import 'storage/stored_file.dart' as _i20;
import 'traceability/session_record.dart' as _i21;
import 'package:octattoo_server/src/generated/appointment/appointment.dart'
    as _i22;
import 'package:octattoo_server/src/generated/artist_profile/artist_profile.dart'
    as _i23;
import 'package:octattoo_server/src/generated/customer/customer.dart' as _i24;
import 'package:octattoo_server/src/generated/inventory/material.dart' as _i25;
import 'package:octattoo_server/src/generated/traceability/session_record.dart'
    as _i26;
export 'appointment/appointment.dart';
export 'appointment/appointment_material.dart';
export 'appointment/appointment_status.dart';
export 'appointment/appointment_type.dart';
export 'artist_profile/artist_profile.dart';
export 'customer/create_customer_result.dart';
export 'customer/customer.dart';
export 'greetings/greeting.dart';
export 'inventory/material.dart';
export 'inventory/material_status.dart';
export 'inventory/material_type.dart';
export 'secure_link/secure_link.dart';
export 'secure_link/secure_link_status.dart';
export 'secure_link/secure_link_type.dart';
export 'storage/storage_quota_exceeded_exception.dart';
export 'storage/stored_file.dart';
export 'traceability/session_record.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'appointment',
      dartName: 'Appointment',
      schema: 'public',
      module: 'octattoo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'artistProfileId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'workplaceId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:AppointmentType',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:AppointmentStatus',
        ),
        _i2.ColumnDefinition(
          name: 'scheduledAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'startedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'finalizedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'notes',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'appointment_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'appointment_artist_profile_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artistProfileId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'appointment_customer_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'customerId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'appointment_scheduled_at_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artistProfileId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'scheduledAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'appointment_material',
      dartName: 'AppointmentMaterial',
      schema: 'public',
      module: 'octattoo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'appointmentId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'materialId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'manufacturer',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'productName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'batchNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'linkedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'appointment_material_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'appointment_material_appointment_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'appointmentId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'appointment_material_material_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'materialId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'artist_profile',
      dartName: 'ArtistProfile',
      schema: 'public',
      module: 'octattoo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'handle',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'expirationAlertDays',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '30',
        ),
        _i2.ColumnDefinition(
          name: 'storageQuotaBytes',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '524288000',
        ),
        _i2.ColumnDefinition(
          name: 'seedColor',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'themeCssLight',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'themeCssDark',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'artist_profile_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'artist_profile_auth_user_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'artist_profile_handle_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'handle',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'customer',
      dartName: 'Customer',
      schema: 'public',
      module: 'octattoo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'artistProfileId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'notes',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'customer_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'customer_artist_profile_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artistProfileId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'customer_email_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artistProfileId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'email',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'customer_phone_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artistProfileId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'phone',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'material',
      dartName: 'Material',
      schema: 'public',
      module: 'octattoo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'artistProfileId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:MaterialType',
        ),
        _i2.ColumnDefinition(
          name: 'manufacturer',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'supplier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'productName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'batchNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'expirationDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:MaterialStatus',
        ),
        _i2.ColumnDefinition(
          name: 'quantity',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'material_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'material_artist_profile_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artistProfileId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'material_batch_number_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artistProfileId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'batchNumber',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'secure_link',
      dartName: 'SecureLink',
      schema: 'public',
      module: 'octattoo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'artistProfileId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'token',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:SecureLinkType',
        ),
        _i2.ColumnDefinition(
          name: 'targetId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'renewedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:SecureLinkStatus',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'secure_link_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'secure_link_token_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'token',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'secure_link_artist_profile_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artistProfileId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'session_record',
      dartName: 'SessionRecord',
      schema: 'public',
      module: 'octattoo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'appointmentId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'hash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'sealedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'version',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'previousHash',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'reason',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'session_record_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'session_record_appointment_version_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'appointmentId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'version',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'stored_file',
      dartName: 'StoredFile',
      schema: 'public',
      module: 'octattoo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'artistProfileId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'fileName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'mimeType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'sizeBytes',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'storagePath',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'stored_file_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'stored_file_artist_profile_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artistProfileId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'stored_file_storage_path_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'storagePath',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

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

    if (t == _i5.Appointment) {
      return _i5.Appointment.fromJson(data) as T;
    }
    if (t == _i6.AppointmentMaterial) {
      return _i6.AppointmentMaterial.fromJson(data) as T;
    }
    if (t == _i7.AppointmentStatus) {
      return _i7.AppointmentStatus.fromJson(data) as T;
    }
    if (t == _i8.AppointmentType) {
      return _i8.AppointmentType.fromJson(data) as T;
    }
    if (t == _i9.ArtistProfile) {
      return _i9.ArtistProfile.fromJson(data) as T;
    }
    if (t == _i10.CreateCustomerResult) {
      return _i10.CreateCustomerResult.fromJson(data) as T;
    }
    if (t == _i11.Customer) {
      return _i11.Customer.fromJson(data) as T;
    }
    if (t == _i12.Greeting) {
      return _i12.Greeting.fromJson(data) as T;
    }
    if (t == _i13.Material) {
      return _i13.Material.fromJson(data) as T;
    }
    if (t == _i14.MaterialStatus) {
      return _i14.MaterialStatus.fromJson(data) as T;
    }
    if (t == _i15.MaterialType) {
      return _i15.MaterialType.fromJson(data) as T;
    }
    if (t == _i16.SecureLink) {
      return _i16.SecureLink.fromJson(data) as T;
    }
    if (t == _i17.SecureLinkStatus) {
      return _i17.SecureLinkStatus.fromJson(data) as T;
    }
    if (t == _i18.SecureLinkType) {
      return _i18.SecureLinkType.fromJson(data) as T;
    }
    if (t == _i19.StorageQuotaExceededException) {
      return _i19.StorageQuotaExceededException.fromJson(data) as T;
    }
    if (t == _i20.StoredFile) {
      return _i20.StoredFile.fromJson(data) as T;
    }
    if (t == _i21.SessionRecord) {
      return _i21.SessionRecord.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.Appointment?>()) {
      return (data != null ? _i5.Appointment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AppointmentMaterial?>()) {
      return (data != null ? _i6.AppointmentMaterial.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.AppointmentStatus?>()) {
      return (data != null ? _i7.AppointmentStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.AppointmentType?>()) {
      return (data != null ? _i8.AppointmentType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.ArtistProfile?>()) {
      return (data != null ? _i9.ArtistProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.CreateCustomerResult?>()) {
      return (data != null ? _i10.CreateCustomerResult.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i11.Customer?>()) {
      return (data != null ? _i11.Customer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Greeting?>()) {
      return (data != null ? _i12.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Material?>()) {
      return (data != null ? _i13.Material.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.MaterialStatus?>()) {
      return (data != null ? _i14.MaterialStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.MaterialType?>()) {
      return (data != null ? _i15.MaterialType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.SecureLink?>()) {
      return (data != null ? _i16.SecureLink.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.SecureLinkStatus?>()) {
      return (data != null ? _i17.SecureLinkStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.SecureLinkType?>()) {
      return (data != null ? _i18.SecureLinkType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.StorageQuotaExceededException?>()) {
      return (data != null
              ? _i19.StorageQuotaExceededException.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i20.StoredFile?>()) {
      return (data != null ? _i20.StoredFile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.SessionRecord?>()) {
      return (data != null ? _i21.SessionRecord.fromJson(data) : null) as T;
    }
    if (t == List<_i11.Customer>) {
      return (data as List).map((e) => deserialize<_i11.Customer>(e)).toList()
          as T;
    }
    if (t == List<_i22.Appointment>) {
      return (data as List)
              .map((e) => deserialize<_i22.Appointment>(e))
              .toList()
          as T;
    }
    if (t == List<_i23.ArtistProfile>) {
      return (data as List)
              .map((e) => deserialize<_i23.ArtistProfile>(e))
              .toList()
          as T;
    }
    if (t == List<_i24.Customer>) {
      return (data as List).map((e) => deserialize<_i24.Customer>(e)).toList()
          as T;
    }
    if (t == List<_i25.Material>) {
      return (data as List).map((e) => deserialize<_i25.Material>(e)).toList()
          as T;
    }
    if (t == List<_i26.SessionRecord>) {
      return (data as List)
              .map((e) => deserialize<_i26.SessionRecord>(e))
              .toList()
          as T;
    }
    if (t == List<_i1.UuidValue>) {
      return (data as List).map((e) => deserialize<_i1.UuidValue>(e)).toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i5.Appointment => 'Appointment',
      _i6.AppointmentMaterial => 'AppointmentMaterial',
      _i7.AppointmentStatus => 'AppointmentStatus',
      _i8.AppointmentType => 'AppointmentType',
      _i9.ArtistProfile => 'ArtistProfile',
      _i10.CreateCustomerResult => 'CreateCustomerResult',
      _i11.Customer => 'Customer',
      _i12.Greeting => 'Greeting',
      _i13.Material => 'Material',
      _i14.MaterialStatus => 'MaterialStatus',
      _i15.MaterialType => 'MaterialType',
      _i16.SecureLink => 'SecureLink',
      _i17.SecureLinkStatus => 'SecureLinkStatus',
      _i18.SecureLinkType => 'SecureLinkType',
      _i19.StorageQuotaExceededException => 'StorageQuotaExceededException',
      _i20.StoredFile => 'StoredFile',
      _i21.SessionRecord => 'SessionRecord',
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
      case _i5.Appointment():
        return 'Appointment';
      case _i6.AppointmentMaterial():
        return 'AppointmentMaterial';
      case _i7.AppointmentStatus():
        return 'AppointmentStatus';
      case _i8.AppointmentType():
        return 'AppointmentType';
      case _i9.ArtistProfile():
        return 'ArtistProfile';
      case _i10.CreateCustomerResult():
        return 'CreateCustomerResult';
      case _i11.Customer():
        return 'Customer';
      case _i12.Greeting():
        return 'Greeting';
      case _i13.Material():
        return 'Material';
      case _i14.MaterialStatus():
        return 'MaterialStatus';
      case _i15.MaterialType():
        return 'MaterialType';
      case _i16.SecureLink():
        return 'SecureLink';
      case _i17.SecureLinkStatus():
        return 'SecureLinkStatus';
      case _i18.SecureLinkType():
        return 'SecureLinkType';
      case _i19.StorageQuotaExceededException():
        return 'StorageQuotaExceededException';
      case _i20.StoredFile():
        return 'StoredFile';
      case _i21.SessionRecord():
        return 'SessionRecord';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'Appointment') {
      return deserialize<_i5.Appointment>(data['data']);
    }
    if (dataClassName == 'AppointmentMaterial') {
      return deserialize<_i6.AppointmentMaterial>(data['data']);
    }
    if (dataClassName == 'AppointmentStatus') {
      return deserialize<_i7.AppointmentStatus>(data['data']);
    }
    if (dataClassName == 'AppointmentType') {
      return deserialize<_i8.AppointmentType>(data['data']);
    }
    if (dataClassName == 'ArtistProfile') {
      return deserialize<_i9.ArtistProfile>(data['data']);
    }
    if (dataClassName == 'CreateCustomerResult') {
      return deserialize<_i10.CreateCustomerResult>(data['data']);
    }
    if (dataClassName == 'Customer') {
      return deserialize<_i11.Customer>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i12.Greeting>(data['data']);
    }
    if (dataClassName == 'Material') {
      return deserialize<_i13.Material>(data['data']);
    }
    if (dataClassName == 'MaterialStatus') {
      return deserialize<_i14.MaterialStatus>(data['data']);
    }
    if (dataClassName == 'MaterialType') {
      return deserialize<_i15.MaterialType>(data['data']);
    }
    if (dataClassName == 'SecureLink') {
      return deserialize<_i16.SecureLink>(data['data']);
    }
    if (dataClassName == 'SecureLinkStatus') {
      return deserialize<_i17.SecureLinkStatus>(data['data']);
    }
    if (dataClassName == 'SecureLinkType') {
      return deserialize<_i18.SecureLinkType>(data['data']);
    }
    if (dataClassName == 'StorageQuotaExceededException') {
      return deserialize<_i19.StorageQuotaExceededException>(data['data']);
    }
    if (dataClassName == 'StoredFile') {
      return deserialize<_i20.StoredFile>(data['data']);
    }
    if (dataClassName == 'SessionRecord') {
      return deserialize<_i21.SessionRecord>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i4.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.Appointment:
        return _i5.Appointment.t;
      case _i6.AppointmentMaterial:
        return _i6.AppointmentMaterial.t;
      case _i9.ArtistProfile:
        return _i9.ArtistProfile.t;
      case _i11.Customer:
        return _i11.Customer.t;
      case _i13.Material:
        return _i13.Material.t;
      case _i16.SecureLink:
        return _i16.SecureLink.t;
      case _i20.StoredFile:
        return _i20.StoredFile.t;
      case _i21.SessionRecord:
        return _i21.SessionRecord.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'octattoo';

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
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i4.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
