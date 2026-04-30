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
import '../appointment/appointment_type.dart' as _i2;
import '../appointment/appointment_status.dart' as _i3;

/// A scheduled session between an artist and a customer.
abstract class Appointment
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
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

  static final t = AppointmentTable();

  static const db = AppointmentRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static AppointmentInclude include() {
    return AppointmentInclude._();
  }

  static AppointmentIncludeList includeList({
    _i1.WhereExpressionBuilder<AppointmentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppointmentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppointmentTable>? orderByList,
    AppointmentInclude? include,
  }) {
    return AppointmentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Appointment.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Appointment.t),
      include: include,
    );
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

class AppointmentUpdateTable extends _i1.UpdateTable<AppointmentTable> {
  AppointmentUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> artistProfileId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.artistProfileId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> customerId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.customerId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> workplaceId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.workplaceId,
    value,
  );

  _i1.ColumnValue<_i2.AppointmentType, _i2.AppointmentType> type(
    _i2.AppointmentType value,
  ) => _i1.ColumnValue(
    table.type,
    value,
  );

  _i1.ColumnValue<_i3.AppointmentStatus, _i3.AppointmentStatus> status(
    _i3.AppointmentStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> scheduledAt(DateTime value) =>
      _i1.ColumnValue(
        table.scheduledAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> startedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.startedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> finalizedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.finalizedAt,
        value,
      );

  _i1.ColumnValue<String, String> notes(String? value) => _i1.ColumnValue(
    table.notes,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime? value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class AppointmentTable extends _i1.Table<_i1.UuidValue?> {
  AppointmentTable({super.tableRelation}) : super(tableName: 'appointment') {
    updateTable = AppointmentUpdateTable(this);
    artistProfileId = _i1.ColumnUuid(
      'artistProfileId',
      this,
    );
    customerId = _i1.ColumnUuid(
      'customerId',
      this,
    );
    workplaceId = _i1.ColumnUuid(
      'workplaceId',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    scheduledAt = _i1.ColumnDateTime(
      'scheduledAt',
      this,
    );
    startedAt = _i1.ColumnDateTime(
      'startedAt',
      this,
    );
    finalizedAt = _i1.ColumnDateTime(
      'finalizedAt',
      this,
    );
    notes = _i1.ColumnString(
      'notes',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final AppointmentUpdateTable updateTable;

  /// The artist profile this appointment belongs to.
  late final _i1.ColumnUuid artistProfileId;

  /// The customer for this appointment.
  late final _i1.ColumnUuid customerId;

  /// The workplace where this appointment takes place.
  late final _i1.ColumnUuid workplaceId;

  /// Tattoo, consultation, or touch-up.
  late final _i1.ColumnEnum<_i2.AppointmentType> type;

  /// Current lifecycle status.
  late final _i1.ColumnEnum<_i3.AppointmentStatus> status;

  /// When this appointment is scheduled for.
  late final _i1.ColumnDateTime scheduledAt;

  /// When the artist started the appointment.
  late final _i1.ColumnDateTime startedAt;

  /// When the artist finalized the appointment.
  late final _i1.ColumnDateTime finalizedAt;

  /// Free-form notes.
  late final _i1.ColumnString notes;

  /// When this appointment was created.
  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    artistProfileId,
    customerId,
    workplaceId,
    type,
    status,
    scheduledAt,
    startedAt,
    finalizedAt,
    notes,
    createdAt,
  ];
}

class AppointmentInclude extends _i1.IncludeObject {
  AppointmentInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => Appointment.t;
}

class AppointmentIncludeList extends _i1.IncludeList {
  AppointmentIncludeList._({
    _i1.WhereExpressionBuilder<AppointmentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Appointment.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => Appointment.t;
}

class AppointmentRepository {
  const AppointmentRepository._();

  /// Returns a list of [Appointment]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Appointment>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<AppointmentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppointmentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppointmentTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Appointment>(
      where: where?.call(Appointment.t),
      orderBy: orderBy?.call(Appointment.t),
      orderByList: orderByList?.call(Appointment.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Appointment] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Appointment?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<AppointmentTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppointmentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppointmentTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Appointment>(
      where: where?.call(Appointment.t),
      orderBy: orderBy?.call(Appointment.t),
      orderByList: orderByList?.call(Appointment.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Appointment] by its [id] or null if no such row exists.
  Future<Appointment?> findById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Appointment>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Appointment]s in the list and returns the inserted rows.
  ///
  /// The returned [Appointment]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Appointment>> insert(
    _i1.DatabaseSession session,
    List<Appointment> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Appointment>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Appointment] and returns the inserted row.
  ///
  /// The returned [Appointment] will have its `id` field set.
  Future<Appointment> insertRow(
    _i1.DatabaseSession session,
    Appointment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Appointment>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Appointment]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Appointment>> update(
    _i1.DatabaseSession session,
    List<Appointment> rows, {
    _i1.ColumnSelections<AppointmentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Appointment>(
      rows,
      columns: columns?.call(Appointment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Appointment]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Appointment> updateRow(
    _i1.DatabaseSession session,
    Appointment row, {
    _i1.ColumnSelections<AppointmentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Appointment>(
      row,
      columns: columns?.call(Appointment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Appointment] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Appointment?> updateById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<AppointmentUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Appointment>(
      id,
      columnValues: columnValues(Appointment.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Appointment]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Appointment>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<AppointmentUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AppointmentTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppointmentTable>? orderBy,
    _i1.OrderByListBuilder<AppointmentTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Appointment>(
      columnValues: columnValues(Appointment.t.updateTable),
      where: where(Appointment.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Appointment.t),
      orderByList: orderByList?.call(Appointment.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Appointment]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Appointment>> delete(
    _i1.DatabaseSession session,
    List<Appointment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Appointment>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Appointment].
  Future<Appointment> deleteRow(
    _i1.DatabaseSession session,
    Appointment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Appointment>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Appointment>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<AppointmentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Appointment>(
      where: where(Appointment.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<AppointmentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Appointment>(
      where: where?.call(Appointment.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Appointment] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<AppointmentTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Appointment>(
      where: where(Appointment.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
