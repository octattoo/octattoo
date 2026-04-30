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

/// The immutable, hash-sealed snapshot of an Appointment's traceability fields.
abstract class SessionRecord
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  SessionRecord._({
    this.id,
    required this.appointmentId,
    required this.hash,
    required this.sealedAt,
    required this.version,
    this.previousHash,
    this.reason,
  });

  factory SessionRecord({
    _i1.UuidValue? id,
    required _i1.UuidValue appointmentId,
    required String hash,
    required DateTime sealedAt,
    required int version,
    String? previousHash,
    String? reason,
  }) = _SessionRecordImpl;

  factory SessionRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return SessionRecord(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      appointmentId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['appointmentId'],
      ),
      hash: jsonSerialization['hash'] as String,
      sealedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['sealedAt'],
      ),
      version: jsonSerialization['version'] as int,
      previousHash: jsonSerialization['previousHash'] as String?,
      reason: jsonSerialization['reason'] as String?,
    );
  }

  static final t = SessionRecordTable();

  static const db = SessionRecordRepository._();

  @override
  _i1.UuidValue? id;

  /// The appointment this record seals.
  _i1.UuidValue appointmentId;

  /// SHA-256 hex hash of canonical traceability fields.
  String hash;

  /// When this record was sealed.
  DateTime sealedAt;

  /// Version number (starts at 1, increments on amendment).
  int version;

  /// Hash of the previous version (null for v1).
  String? previousHash;

  /// Reason for amendment (null for v1, required for v2+).
  String? reason;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [SessionRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SessionRecord copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? appointmentId,
    String? hash,
    DateTime? sealedAt,
    int? version,
    String? previousHash,
    String? reason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SessionRecord',
      if (id != null) 'id': id?.toJson(),
      'appointmentId': appointmentId.toJson(),
      'hash': hash,
      'sealedAt': sealedAt.toJson(),
      'version': version,
      if (previousHash != null) 'previousHash': previousHash,
      if (reason != null) 'reason': reason,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SessionRecord',
      if (id != null) 'id': id?.toJson(),
      'appointmentId': appointmentId.toJson(),
      'hash': hash,
      'sealedAt': sealedAt.toJson(),
      'version': version,
      if (previousHash != null) 'previousHash': previousHash,
      if (reason != null) 'reason': reason,
    };
  }

  static SessionRecordInclude include() {
    return SessionRecordInclude._();
  }

  static SessionRecordIncludeList includeList({
    _i1.WhereExpressionBuilder<SessionRecordTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SessionRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SessionRecordTable>? orderByList,
    SessionRecordInclude? include,
  }) {
    return SessionRecordIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SessionRecord.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SessionRecord.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SessionRecordImpl extends SessionRecord {
  _SessionRecordImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue appointmentId,
    required String hash,
    required DateTime sealedAt,
    required int version,
    String? previousHash,
    String? reason,
  }) : super._(
         id: id,
         appointmentId: appointmentId,
         hash: hash,
         sealedAt: sealedAt,
         version: version,
         previousHash: previousHash,
         reason: reason,
       );

  /// Returns a shallow copy of this [SessionRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SessionRecord copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? appointmentId,
    String? hash,
    DateTime? sealedAt,
    int? version,
    Object? previousHash = _Undefined,
    Object? reason = _Undefined,
  }) {
    return SessionRecord(
      id: id is _i1.UuidValue? ? id : this.id,
      appointmentId: appointmentId ?? this.appointmentId,
      hash: hash ?? this.hash,
      sealedAt: sealedAt ?? this.sealedAt,
      version: version ?? this.version,
      previousHash: previousHash is String? ? previousHash : this.previousHash,
      reason: reason is String? ? reason : this.reason,
    );
  }
}

class SessionRecordUpdateTable extends _i1.UpdateTable<SessionRecordTable> {
  SessionRecordUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> appointmentId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.appointmentId,
    value,
  );

  _i1.ColumnValue<String, String> hash(String value) => _i1.ColumnValue(
    table.hash,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> sealedAt(DateTime value) =>
      _i1.ColumnValue(
        table.sealedAt,
        value,
      );

  _i1.ColumnValue<int, int> version(int value) => _i1.ColumnValue(
    table.version,
    value,
  );

  _i1.ColumnValue<String, String> previousHash(String? value) =>
      _i1.ColumnValue(
        table.previousHash,
        value,
      );

  _i1.ColumnValue<String, String> reason(String? value) => _i1.ColumnValue(
    table.reason,
    value,
  );
}

class SessionRecordTable extends _i1.Table<_i1.UuidValue?> {
  SessionRecordTable({super.tableRelation})
    : super(tableName: 'session_record') {
    updateTable = SessionRecordUpdateTable(this);
    appointmentId = _i1.ColumnUuid(
      'appointmentId',
      this,
    );
    hash = _i1.ColumnString(
      'hash',
      this,
    );
    sealedAt = _i1.ColumnDateTime(
      'sealedAt',
      this,
    );
    version = _i1.ColumnInt(
      'version',
      this,
    );
    previousHash = _i1.ColumnString(
      'previousHash',
      this,
    );
    reason = _i1.ColumnString(
      'reason',
      this,
    );
  }

  late final SessionRecordUpdateTable updateTable;

  /// The appointment this record seals.
  late final _i1.ColumnUuid appointmentId;

  /// SHA-256 hex hash of canonical traceability fields.
  late final _i1.ColumnString hash;

  /// When this record was sealed.
  late final _i1.ColumnDateTime sealedAt;

  /// Version number (starts at 1, increments on amendment).
  late final _i1.ColumnInt version;

  /// Hash of the previous version (null for v1).
  late final _i1.ColumnString previousHash;

  /// Reason for amendment (null for v1, required for v2+).
  late final _i1.ColumnString reason;

  @override
  List<_i1.Column> get columns => [
    id,
    appointmentId,
    hash,
    sealedAt,
    version,
    previousHash,
    reason,
  ];
}

class SessionRecordInclude extends _i1.IncludeObject {
  SessionRecordInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => SessionRecord.t;
}

class SessionRecordIncludeList extends _i1.IncludeList {
  SessionRecordIncludeList._({
    _i1.WhereExpressionBuilder<SessionRecordTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SessionRecord.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => SessionRecord.t;
}

class SessionRecordRepository {
  const SessionRecordRepository._();

  /// Returns a list of [SessionRecord]s matching the given query parameters.
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
  Future<List<SessionRecord>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SessionRecordTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SessionRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SessionRecordTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SessionRecord>(
      where: where?.call(SessionRecord.t),
      orderBy: orderBy?.call(SessionRecord.t),
      orderByList: orderByList?.call(SessionRecord.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [SessionRecord] matching the given query parameters.
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
  Future<SessionRecord?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SessionRecordTable>? where,
    int? offset,
    _i1.OrderByBuilder<SessionRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SessionRecordTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SessionRecord>(
      where: where?.call(SessionRecord.t),
      orderBy: orderBy?.call(SessionRecord.t),
      orderByList: orderByList?.call(SessionRecord.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SessionRecord] by its [id] or null if no such row exists.
  Future<SessionRecord?> findById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SessionRecord>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SessionRecord]s in the list and returns the inserted rows.
  ///
  /// The returned [SessionRecord]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<SessionRecord>> insert(
    _i1.DatabaseSession session,
    List<SessionRecord> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<SessionRecord>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [SessionRecord] and returns the inserted row.
  ///
  /// The returned [SessionRecord] will have its `id` field set.
  Future<SessionRecord> insertRow(
    _i1.DatabaseSession session,
    SessionRecord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SessionRecord>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SessionRecord]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SessionRecord>> update(
    _i1.DatabaseSession session,
    List<SessionRecord> rows, {
    _i1.ColumnSelections<SessionRecordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SessionRecord>(
      rows,
      columns: columns?.call(SessionRecord.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SessionRecord]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SessionRecord> updateRow(
    _i1.DatabaseSession session,
    SessionRecord row, {
    _i1.ColumnSelections<SessionRecordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SessionRecord>(
      row,
      columns: columns?.call(SessionRecord.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SessionRecord] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SessionRecord?> updateById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<SessionRecordUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<SessionRecord>(
      id,
      columnValues: columnValues(SessionRecord.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SessionRecord]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<SessionRecord>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<SessionRecordUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<SessionRecordTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SessionRecordTable>? orderBy,
    _i1.OrderByListBuilder<SessionRecordTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<SessionRecord>(
      columnValues: columnValues(SessionRecord.t.updateTable),
      where: where(SessionRecord.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SessionRecord.t),
      orderByList: orderByList?.call(SessionRecord.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [SessionRecord]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SessionRecord>> delete(
    _i1.DatabaseSession session,
    List<SessionRecord> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SessionRecord>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SessionRecord].
  Future<SessionRecord> deleteRow(
    _i1.DatabaseSession session,
    SessionRecord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SessionRecord>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SessionRecord>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SessionRecordTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SessionRecord>(
      where: where(SessionRecord.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SessionRecordTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SessionRecord>(
      where: where?.call(SessionRecord.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SessionRecord] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SessionRecordTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SessionRecord>(
      where: where(SessionRecord.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
