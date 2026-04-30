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
import '../secure_link/secure_link_type.dart' as _i2;
import '../secure_link/secure_link_status.dart' as _i3;

/// A tokenized, expiring link for client-facing features.
abstract class SecureLink
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  SecureLink._({
    this.id,
    required this.artistProfileId,
    required this.token,
    required this.type,
    required this.targetId,
    required this.expiresAt,
    required this.createdAt,
    this.renewedAt,
    required this.status,
  });

  factory SecureLink({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required String token,
    required _i2.SecureLinkType type,
    required _i1.UuidValue targetId,
    required DateTime expiresAt,
    required DateTime createdAt,
    DateTime? renewedAt,
    required _i3.SecureLinkStatus status,
  }) = _SecureLinkImpl;

  factory SecureLink.fromJson(Map<String, dynamic> jsonSerialization) {
    return SecureLink(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      artistProfileId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['artistProfileId'],
      ),
      token: jsonSerialization['token'] as String,
      type: _i2.SecureLinkType.fromJson((jsonSerialization['type'] as String)),
      targetId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['targetId'],
      ),
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      renewedAt: jsonSerialization['renewedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['renewedAt']),
      status: _i3.SecureLinkStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
    );
  }

  static final t = SecureLinkTable();

  static const db = SecureLinkRepository._();

  @override
  _i1.UuidValue? id;

  /// The artist profile that owns this link.
  _i1.UuidValue artistProfileId;

  /// Unique base62 token (10 chars), permanently claimed.
  String token;

  /// The type of resource this link points to.
  _i2.SecureLinkType type;

  /// The ID of the target resource (quote, consent, etc.).
  _i1.UuidValue targetId;

  /// When this link expires.
  DateTime expiresAt;

  /// When this link was created.
  DateTime createdAt;

  /// When this link was last renewed (null if never renewed).
  DateTime? renewedAt;

  /// Current status of the link.
  _i3.SecureLinkStatus status;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [SecureLink]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SecureLink copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? artistProfileId,
    String? token,
    _i2.SecureLinkType? type,
    _i1.UuidValue? targetId,
    DateTime? expiresAt,
    DateTime? createdAt,
    DateTime? renewedAt,
    _i3.SecureLinkStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SecureLink',
      if (id != null) 'id': id?.toJson(),
      'artistProfileId': artistProfileId.toJson(),
      'token': token,
      'type': type.toJson(),
      'targetId': targetId.toJson(),
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      if (renewedAt != null) 'renewedAt': renewedAt?.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SecureLink',
      if (id != null) 'id': id?.toJson(),
      'artistProfileId': artistProfileId.toJson(),
      'token': token,
      'type': type.toJson(),
      'targetId': targetId.toJson(),
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      if (renewedAt != null) 'renewedAt': renewedAt?.toJson(),
      'status': status.toJson(),
    };
  }

  static SecureLinkInclude include() {
    return SecureLinkInclude._();
  }

  static SecureLinkIncludeList includeList({
    _i1.WhereExpressionBuilder<SecureLinkTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SecureLinkTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SecureLinkTable>? orderByList,
    SecureLinkInclude? include,
  }) {
    return SecureLinkIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SecureLink.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SecureLink.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SecureLinkImpl extends SecureLink {
  _SecureLinkImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required String token,
    required _i2.SecureLinkType type,
    required _i1.UuidValue targetId,
    required DateTime expiresAt,
    required DateTime createdAt,
    DateTime? renewedAt,
    required _i3.SecureLinkStatus status,
  }) : super._(
         id: id,
         artistProfileId: artistProfileId,
         token: token,
         type: type,
         targetId: targetId,
         expiresAt: expiresAt,
         createdAt: createdAt,
         renewedAt: renewedAt,
         status: status,
       );

  /// Returns a shallow copy of this [SecureLink]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SecureLink copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? artistProfileId,
    String? token,
    _i2.SecureLinkType? type,
    _i1.UuidValue? targetId,
    DateTime? expiresAt,
    DateTime? createdAt,
    Object? renewedAt = _Undefined,
    _i3.SecureLinkStatus? status,
  }) {
    return SecureLink(
      id: id is _i1.UuidValue? ? id : this.id,
      artistProfileId: artistProfileId ?? this.artistProfileId,
      token: token ?? this.token,
      type: type ?? this.type,
      targetId: targetId ?? this.targetId,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      renewedAt: renewedAt is DateTime? ? renewedAt : this.renewedAt,
      status: status ?? this.status,
    );
  }
}

class SecureLinkUpdateTable extends _i1.UpdateTable<SecureLinkTable> {
  SecureLinkUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> artistProfileId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.artistProfileId,
    value,
  );

  _i1.ColumnValue<String, String> token(String value) => _i1.ColumnValue(
    table.token,
    value,
  );

  _i1.ColumnValue<_i2.SecureLinkType, _i2.SecureLinkType> type(
    _i2.SecureLinkType value,
  ) => _i1.ColumnValue(
    table.type,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> targetId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.targetId,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> expiresAt(DateTime value) =>
      _i1.ColumnValue(
        table.expiresAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> renewedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.renewedAt,
        value,
      );

  _i1.ColumnValue<_i3.SecureLinkStatus, _i3.SecureLinkStatus> status(
    _i3.SecureLinkStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );
}

class SecureLinkTable extends _i1.Table<_i1.UuidValue?> {
  SecureLinkTable({super.tableRelation}) : super(tableName: 'secure_link') {
    updateTable = SecureLinkUpdateTable(this);
    artistProfileId = _i1.ColumnUuid(
      'artistProfileId',
      this,
    );
    token = _i1.ColumnString(
      'token',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    targetId = _i1.ColumnUuid(
      'targetId',
      this,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    renewedAt = _i1.ColumnDateTime(
      'renewedAt',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
  }

  late final SecureLinkUpdateTable updateTable;

  /// The artist profile that owns this link.
  late final _i1.ColumnUuid artistProfileId;

  /// Unique base62 token (10 chars), permanently claimed.
  late final _i1.ColumnString token;

  /// The type of resource this link points to.
  late final _i1.ColumnEnum<_i2.SecureLinkType> type;

  /// The ID of the target resource (quote, consent, etc.).
  late final _i1.ColumnUuid targetId;

  /// When this link expires.
  late final _i1.ColumnDateTime expiresAt;

  /// When this link was created.
  late final _i1.ColumnDateTime createdAt;

  /// When this link was last renewed (null if never renewed).
  late final _i1.ColumnDateTime renewedAt;

  /// Current status of the link.
  late final _i1.ColumnEnum<_i3.SecureLinkStatus> status;

  @override
  List<_i1.Column> get columns => [
    id,
    artistProfileId,
    token,
    type,
    targetId,
    expiresAt,
    createdAt,
    renewedAt,
    status,
  ];
}

class SecureLinkInclude extends _i1.IncludeObject {
  SecureLinkInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => SecureLink.t;
}

class SecureLinkIncludeList extends _i1.IncludeList {
  SecureLinkIncludeList._({
    _i1.WhereExpressionBuilder<SecureLinkTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SecureLink.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => SecureLink.t;
}

class SecureLinkRepository {
  const SecureLinkRepository._();

  /// Returns a list of [SecureLink]s matching the given query parameters.
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
  Future<List<SecureLink>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SecureLinkTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SecureLinkTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SecureLinkTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SecureLink>(
      where: where?.call(SecureLink.t),
      orderBy: orderBy?.call(SecureLink.t),
      orderByList: orderByList?.call(SecureLink.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [SecureLink] matching the given query parameters.
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
  Future<SecureLink?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SecureLinkTable>? where,
    int? offset,
    _i1.OrderByBuilder<SecureLinkTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SecureLinkTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SecureLink>(
      where: where?.call(SecureLink.t),
      orderBy: orderBy?.call(SecureLink.t),
      orderByList: orderByList?.call(SecureLink.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SecureLink] by its [id] or null if no such row exists.
  Future<SecureLink?> findById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SecureLink>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SecureLink]s in the list and returns the inserted rows.
  ///
  /// The returned [SecureLink]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<SecureLink>> insert(
    _i1.DatabaseSession session,
    List<SecureLink> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<SecureLink>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [SecureLink] and returns the inserted row.
  ///
  /// The returned [SecureLink] will have its `id` field set.
  Future<SecureLink> insertRow(
    _i1.DatabaseSession session,
    SecureLink row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SecureLink>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SecureLink]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SecureLink>> update(
    _i1.DatabaseSession session,
    List<SecureLink> rows, {
    _i1.ColumnSelections<SecureLinkTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SecureLink>(
      rows,
      columns: columns?.call(SecureLink.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SecureLink]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SecureLink> updateRow(
    _i1.DatabaseSession session,
    SecureLink row, {
    _i1.ColumnSelections<SecureLinkTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SecureLink>(
      row,
      columns: columns?.call(SecureLink.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SecureLink] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SecureLink?> updateById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<SecureLinkUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<SecureLink>(
      id,
      columnValues: columnValues(SecureLink.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SecureLink]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<SecureLink>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<SecureLinkUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<SecureLinkTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SecureLinkTable>? orderBy,
    _i1.OrderByListBuilder<SecureLinkTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<SecureLink>(
      columnValues: columnValues(SecureLink.t.updateTable),
      where: where(SecureLink.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SecureLink.t),
      orderByList: orderByList?.call(SecureLink.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [SecureLink]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SecureLink>> delete(
    _i1.DatabaseSession session,
    List<SecureLink> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SecureLink>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SecureLink].
  Future<SecureLink> deleteRow(
    _i1.DatabaseSession session,
    SecureLink row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SecureLink>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SecureLink>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SecureLinkTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SecureLink>(
      where: where(SecureLink.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SecureLinkTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SecureLink>(
      where: where?.call(SecureLink.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SecureLink] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SecureLinkTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SecureLink>(
      where: where(SecureLink.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
