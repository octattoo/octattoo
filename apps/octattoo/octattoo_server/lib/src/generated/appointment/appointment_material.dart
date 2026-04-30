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

/// A material linked to an appointment with snapshot data for traceability.
abstract class AppointmentMaterial
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  AppointmentMaterial._({
    this.id,
    required this.appointmentId,
    required this.materialId,
    required this.manufacturer,
    required this.productName,
    required this.batchNumber,
    this.linkedAt,
  });

  factory AppointmentMaterial({
    _i1.UuidValue? id,
    required _i1.UuidValue appointmentId,
    required _i1.UuidValue materialId,
    required String manufacturer,
    required String productName,
    required String batchNumber,
    DateTime? linkedAt,
  }) = _AppointmentMaterialImpl;

  factory AppointmentMaterial.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppointmentMaterial(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      appointmentId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['appointmentId'],
      ),
      materialId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['materialId'],
      ),
      manufacturer: jsonSerialization['manufacturer'] as String,
      productName: jsonSerialization['productName'] as String,
      batchNumber: jsonSerialization['batchNumber'] as String,
      linkedAt: jsonSerialization['linkedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['linkedAt']),
    );
  }

  static final t = AppointmentMaterialTable();

  static const db = AppointmentMaterialRepository._();

  @override
  _i1.UuidValue? id;

  /// The appointment this material is linked to.
  _i1.UuidValue appointmentId;

  /// The source material from inventory.
  _i1.UuidValue materialId;

  /// Snapshot: manufacturer at link time.
  String manufacturer;

  /// Snapshot: product name at link time.
  String productName;

  /// Snapshot: batch number at link time.
  String batchNumber;

  /// When this material was linked.
  DateTime? linkedAt;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [AppointmentMaterial]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppointmentMaterial copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? appointmentId,
    _i1.UuidValue? materialId,
    String? manufacturer,
    String? productName,
    String? batchNumber,
    DateTime? linkedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppointmentMaterial',
      if (id != null) 'id': id?.toJson(),
      'appointmentId': appointmentId.toJson(),
      'materialId': materialId.toJson(),
      'manufacturer': manufacturer,
      'productName': productName,
      'batchNumber': batchNumber,
      if (linkedAt != null) 'linkedAt': linkedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AppointmentMaterial',
      if (id != null) 'id': id?.toJson(),
      'appointmentId': appointmentId.toJson(),
      'materialId': materialId.toJson(),
      'manufacturer': manufacturer,
      'productName': productName,
      'batchNumber': batchNumber,
      if (linkedAt != null) 'linkedAt': linkedAt?.toJson(),
    };
  }

  static AppointmentMaterialInclude include() {
    return AppointmentMaterialInclude._();
  }

  static AppointmentMaterialIncludeList includeList({
    _i1.WhereExpressionBuilder<AppointmentMaterialTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppointmentMaterialTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppointmentMaterialTable>? orderByList,
    AppointmentMaterialInclude? include,
  }) {
    return AppointmentMaterialIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppointmentMaterial.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AppointmentMaterial.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppointmentMaterialImpl extends AppointmentMaterial {
  _AppointmentMaterialImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue appointmentId,
    required _i1.UuidValue materialId,
    required String manufacturer,
    required String productName,
    required String batchNumber,
    DateTime? linkedAt,
  }) : super._(
         id: id,
         appointmentId: appointmentId,
         materialId: materialId,
         manufacturer: manufacturer,
         productName: productName,
         batchNumber: batchNumber,
         linkedAt: linkedAt,
       );

  /// Returns a shallow copy of this [AppointmentMaterial]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppointmentMaterial copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? appointmentId,
    _i1.UuidValue? materialId,
    String? manufacturer,
    String? productName,
    String? batchNumber,
    Object? linkedAt = _Undefined,
  }) {
    return AppointmentMaterial(
      id: id is _i1.UuidValue? ? id : this.id,
      appointmentId: appointmentId ?? this.appointmentId,
      materialId: materialId ?? this.materialId,
      manufacturer: manufacturer ?? this.manufacturer,
      productName: productName ?? this.productName,
      batchNumber: batchNumber ?? this.batchNumber,
      linkedAt: linkedAt is DateTime? ? linkedAt : this.linkedAt,
    );
  }
}

class AppointmentMaterialUpdateTable
    extends _i1.UpdateTable<AppointmentMaterialTable> {
  AppointmentMaterialUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> appointmentId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.appointmentId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> materialId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.materialId,
    value,
  );

  _i1.ColumnValue<String, String> manufacturer(String value) => _i1.ColumnValue(
    table.manufacturer,
    value,
  );

  _i1.ColumnValue<String, String> productName(String value) => _i1.ColumnValue(
    table.productName,
    value,
  );

  _i1.ColumnValue<String, String> batchNumber(String value) => _i1.ColumnValue(
    table.batchNumber,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> linkedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.linkedAt,
        value,
      );
}

class AppointmentMaterialTable extends _i1.Table<_i1.UuidValue?> {
  AppointmentMaterialTable({super.tableRelation})
    : super(tableName: 'appointment_material') {
    updateTable = AppointmentMaterialUpdateTable(this);
    appointmentId = _i1.ColumnUuid(
      'appointmentId',
      this,
    );
    materialId = _i1.ColumnUuid(
      'materialId',
      this,
    );
    manufacturer = _i1.ColumnString(
      'manufacturer',
      this,
    );
    productName = _i1.ColumnString(
      'productName',
      this,
    );
    batchNumber = _i1.ColumnString(
      'batchNumber',
      this,
    );
    linkedAt = _i1.ColumnDateTime(
      'linkedAt',
      this,
      hasDefault: true,
    );
  }

  late final AppointmentMaterialUpdateTable updateTable;

  /// The appointment this material is linked to.
  late final _i1.ColumnUuid appointmentId;

  /// The source material from inventory.
  late final _i1.ColumnUuid materialId;

  /// Snapshot: manufacturer at link time.
  late final _i1.ColumnString manufacturer;

  /// Snapshot: product name at link time.
  late final _i1.ColumnString productName;

  /// Snapshot: batch number at link time.
  late final _i1.ColumnString batchNumber;

  /// When this material was linked.
  late final _i1.ColumnDateTime linkedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    appointmentId,
    materialId,
    manufacturer,
    productName,
    batchNumber,
    linkedAt,
  ];
}

class AppointmentMaterialInclude extends _i1.IncludeObject {
  AppointmentMaterialInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => AppointmentMaterial.t;
}

class AppointmentMaterialIncludeList extends _i1.IncludeList {
  AppointmentMaterialIncludeList._({
    _i1.WhereExpressionBuilder<AppointmentMaterialTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AppointmentMaterial.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => AppointmentMaterial.t;
}

class AppointmentMaterialRepository {
  const AppointmentMaterialRepository._();

  /// Returns a list of [AppointmentMaterial]s matching the given query parameters.
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
  Future<List<AppointmentMaterial>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<AppointmentMaterialTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppointmentMaterialTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppointmentMaterialTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<AppointmentMaterial>(
      where: where?.call(AppointmentMaterial.t),
      orderBy: orderBy?.call(AppointmentMaterial.t),
      orderByList: orderByList?.call(AppointmentMaterial.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [AppointmentMaterial] matching the given query parameters.
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
  Future<AppointmentMaterial?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<AppointmentMaterialTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppointmentMaterialTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppointmentMaterialTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<AppointmentMaterial>(
      where: where?.call(AppointmentMaterial.t),
      orderBy: orderBy?.call(AppointmentMaterial.t),
      orderByList: orderByList?.call(AppointmentMaterial.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [AppointmentMaterial] by its [id] or null if no such row exists.
  Future<AppointmentMaterial?> findById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<AppointmentMaterial>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [AppointmentMaterial]s in the list and returns the inserted rows.
  ///
  /// The returned [AppointmentMaterial]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<AppointmentMaterial>> insert(
    _i1.DatabaseSession session,
    List<AppointmentMaterial> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<AppointmentMaterial>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [AppointmentMaterial] and returns the inserted row.
  ///
  /// The returned [AppointmentMaterial] will have its `id` field set.
  Future<AppointmentMaterial> insertRow(
    _i1.DatabaseSession session,
    AppointmentMaterial row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AppointmentMaterial>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AppointmentMaterial]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AppointmentMaterial>> update(
    _i1.DatabaseSession session,
    List<AppointmentMaterial> rows, {
    _i1.ColumnSelections<AppointmentMaterialTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AppointmentMaterial>(
      rows,
      columns: columns?.call(AppointmentMaterial.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AppointmentMaterial]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AppointmentMaterial> updateRow(
    _i1.DatabaseSession session,
    AppointmentMaterial row, {
    _i1.ColumnSelections<AppointmentMaterialTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AppointmentMaterial>(
      row,
      columns: columns?.call(AppointmentMaterial.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AppointmentMaterial] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AppointmentMaterial?> updateById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<AppointmentMaterialUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<AppointmentMaterial>(
      id,
      columnValues: columnValues(AppointmentMaterial.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AppointmentMaterial]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<AppointmentMaterial>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<AppointmentMaterialUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<AppointmentMaterialTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppointmentMaterialTable>? orderBy,
    _i1.OrderByListBuilder<AppointmentMaterialTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<AppointmentMaterial>(
      columnValues: columnValues(AppointmentMaterial.t.updateTable),
      where: where(AppointmentMaterial.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppointmentMaterial.t),
      orderByList: orderByList?.call(AppointmentMaterial.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [AppointmentMaterial]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AppointmentMaterial>> delete(
    _i1.DatabaseSession session,
    List<AppointmentMaterial> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AppointmentMaterial>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AppointmentMaterial].
  Future<AppointmentMaterial> deleteRow(
    _i1.DatabaseSession session,
    AppointmentMaterial row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AppointmentMaterial>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AppointmentMaterial>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<AppointmentMaterialTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AppointmentMaterial>(
      where: where(AppointmentMaterial.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<AppointmentMaterialTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AppointmentMaterial>(
      where: where?.call(AppointmentMaterial.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [AppointmentMaterial] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<AppointmentMaterialTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<AppointmentMaterial>(
      where: where(AppointmentMaterial.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
