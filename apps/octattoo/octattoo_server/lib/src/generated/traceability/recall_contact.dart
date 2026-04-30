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

/// Tracks whether a Customer has been contacted for a specific Batch recall.
abstract class RecallContact
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  RecallContact._({
    this.id,
    required this.artistProfileId,
    required this.customerId,
    required this.batchNumber,
  });

  factory RecallContact({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required _i1.UuidValue customerId,
    required String batchNumber,
  }) = _RecallContactImpl;

  factory RecallContact.fromJson(Map<String, dynamic> jsonSerialization) {
    return RecallContact(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      artistProfileId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['artistProfileId'],
      ),
      customerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['customerId'],
      ),
      batchNumber: jsonSerialization['batchNumber'] as String,
    );
  }

  static final t = RecallContactTable();

  static const db = RecallContactRepository._();

  @override
  _i1.UuidValue? id;

  /// The artist profile that owns this recall contact record.
  _i1.UuidValue artistProfileId;

  /// The customer who was affected.
  _i1.UuidValue customerId;

  /// The batch number being recalled.
  String batchNumber;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [RecallContact]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RecallContact copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? artistProfileId,
    _i1.UuidValue? customerId,
    String? batchNumber,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RecallContact',
      if (id != null) 'id': id?.toJson(),
      'artistProfileId': artistProfileId.toJson(),
      'customerId': customerId.toJson(),
      'batchNumber': batchNumber,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RecallContact',
      if (id != null) 'id': id?.toJson(),
      'artistProfileId': artistProfileId.toJson(),
      'customerId': customerId.toJson(),
      'batchNumber': batchNumber,
    };
  }

  static RecallContactInclude include() {
    return RecallContactInclude._();
  }

  static RecallContactIncludeList includeList({
    _i1.WhereExpressionBuilder<RecallContactTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RecallContactTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RecallContactTable>? orderByList,
    RecallContactInclude? include,
  }) {
    return RecallContactIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RecallContact.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RecallContact.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RecallContactImpl extends RecallContact {
  _RecallContactImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required _i1.UuidValue customerId,
    required String batchNumber,
  }) : super._(
         id: id,
         artistProfileId: artistProfileId,
         customerId: customerId,
         batchNumber: batchNumber,
       );

  /// Returns a shallow copy of this [RecallContact]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RecallContact copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? artistProfileId,
    _i1.UuidValue? customerId,
    String? batchNumber,
  }) {
    return RecallContact(
      id: id is _i1.UuidValue? ? id : this.id,
      artistProfileId: artistProfileId ?? this.artistProfileId,
      customerId: customerId ?? this.customerId,
      batchNumber: batchNumber ?? this.batchNumber,
    );
  }
}

class RecallContactUpdateTable extends _i1.UpdateTable<RecallContactTable> {
  RecallContactUpdateTable(super.table);

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

  _i1.ColumnValue<String, String> batchNumber(String value) => _i1.ColumnValue(
    table.batchNumber,
    value,
  );
}

class RecallContactTable extends _i1.Table<_i1.UuidValue?> {
  RecallContactTable({super.tableRelation})
    : super(tableName: 'recall_contact') {
    updateTable = RecallContactUpdateTable(this);
    artistProfileId = _i1.ColumnUuid(
      'artistProfileId',
      this,
    );
    customerId = _i1.ColumnUuid(
      'customerId',
      this,
    );
    batchNumber = _i1.ColumnString(
      'batchNumber',
      this,
    );
  }

  late final RecallContactUpdateTable updateTable;

  /// The artist profile that owns this recall contact record.
  late final _i1.ColumnUuid artistProfileId;

  /// The customer who was affected.
  late final _i1.ColumnUuid customerId;

  /// The batch number being recalled.
  late final _i1.ColumnString batchNumber;

  @override
  List<_i1.Column> get columns => [
    id,
    artistProfileId,
    customerId,
    batchNumber,
  ];
}

class RecallContactInclude extends _i1.IncludeObject {
  RecallContactInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => RecallContact.t;
}

class RecallContactIncludeList extends _i1.IncludeList {
  RecallContactIncludeList._({
    _i1.WhereExpressionBuilder<RecallContactTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RecallContact.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => RecallContact.t;
}

class RecallContactRepository {
  const RecallContactRepository._();

  /// Returns a list of [RecallContact]s matching the given query parameters.
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
  Future<List<RecallContact>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RecallContactTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RecallContactTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RecallContactTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RecallContact>(
      where: where?.call(RecallContact.t),
      orderBy: orderBy?.call(RecallContact.t),
      orderByList: orderByList?.call(RecallContact.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [RecallContact] matching the given query parameters.
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
  Future<RecallContact?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RecallContactTable>? where,
    int? offset,
    _i1.OrderByBuilder<RecallContactTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RecallContactTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RecallContact>(
      where: where?.call(RecallContact.t),
      orderBy: orderBy?.call(RecallContact.t),
      orderByList: orderByList?.call(RecallContact.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RecallContact] by its [id] or null if no such row exists.
  Future<RecallContact?> findById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RecallContact>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RecallContact]s in the list and returns the inserted rows.
  ///
  /// The returned [RecallContact]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<RecallContact>> insert(
    _i1.DatabaseSession session,
    List<RecallContact> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<RecallContact>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [RecallContact] and returns the inserted row.
  ///
  /// The returned [RecallContact] will have its `id` field set.
  Future<RecallContact> insertRow(
    _i1.DatabaseSession session,
    RecallContact row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RecallContact>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RecallContact]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RecallContact>> update(
    _i1.DatabaseSession session,
    List<RecallContact> rows, {
    _i1.ColumnSelections<RecallContactTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RecallContact>(
      rows,
      columns: columns?.call(RecallContact.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RecallContact]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RecallContact> updateRow(
    _i1.DatabaseSession session,
    RecallContact row, {
    _i1.ColumnSelections<RecallContactTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RecallContact>(
      row,
      columns: columns?.call(RecallContact.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RecallContact] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RecallContact?> updateById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<RecallContactUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<RecallContact>(
      id,
      columnValues: columnValues(RecallContact.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RecallContact]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<RecallContact>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<RecallContactUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<RecallContactTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RecallContactTable>? orderBy,
    _i1.OrderByListBuilder<RecallContactTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<RecallContact>(
      columnValues: columnValues(RecallContact.t.updateTable),
      where: where(RecallContact.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RecallContact.t),
      orderByList: orderByList?.call(RecallContact.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [RecallContact]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RecallContact>> delete(
    _i1.DatabaseSession session,
    List<RecallContact> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RecallContact>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RecallContact].
  Future<RecallContact> deleteRow(
    _i1.DatabaseSession session,
    RecallContact row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RecallContact>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RecallContact>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RecallContactTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RecallContact>(
      where: where(RecallContact.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RecallContactTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RecallContact>(
      where: where?.call(RecallContact.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RecallContact] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RecallContactTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RecallContact>(
      where: where(RecallContact.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
