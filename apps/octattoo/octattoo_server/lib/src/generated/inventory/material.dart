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
import '../inventory/material_type.dart' as _i2;
import '../inventory/material_status.dart' as _i3;

/// A physical item (ink or needle) in an artist's personal inventory.
abstract class Material
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  Material._({
    this.id,
    required this.artistProfileId,
    required this.type,
    required this.manufacturer,
    required this.supplier,
    required this.productName,
    required this.batchNumber,
    required this.expirationDate,
    required this.status,
    this.quantity,
    this.createdAt,
  });

  factory Material({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required _i2.MaterialType type,
    required String manufacturer,
    required String supplier,
    required String productName,
    required String batchNumber,
    required DateTime expirationDate,
    required _i3.MaterialStatus status,
    int? quantity,
    DateTime? createdAt,
  }) = _MaterialImpl;

  factory Material.fromJson(Map<String, dynamic> jsonSerialization) {
    return Material(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      artistProfileId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['artistProfileId'],
      ),
      type: _i2.MaterialType.fromJson((jsonSerialization['type'] as String)),
      manufacturer: jsonSerialization['manufacturer'] as String,
      supplier: jsonSerialization['supplier'] as String,
      productName: jsonSerialization['productName'] as String,
      batchNumber: jsonSerialization['batchNumber'] as String,
      expirationDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expirationDate'],
      ),
      status: _i3.MaterialStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      quantity: jsonSerialization['quantity'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = MaterialTable();

  static const db = MaterialRepository._();

  @override
  _i1.UuidValue? id;

  /// The artist profile this material belongs to.
  _i1.UuidValue artistProfileId;

  /// Ink or needle.
  _i2.MaterialType type;

  /// Manufacturer name.
  String manufacturer;

  /// Supplier name.
  String supplier;

  /// Product name.
  String productName;

  /// Batch number (key field for recall searches).
  String batchNumber;

  /// Expiration date.
  DateTime expirationDate;

  /// Current stock status.
  _i3.MaterialStatus status;

  /// Quantity (needles only, null for ink).
  int? quantity;

  /// When this material was created.
  DateTime? createdAt;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Material]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Material copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? artistProfileId,
    _i2.MaterialType? type,
    String? manufacturer,
    String? supplier,
    String? productName,
    String? batchNumber,
    DateTime? expirationDate,
    _i3.MaterialStatus? status,
    int? quantity,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Material',
      if (id != null) 'id': id?.toJson(),
      'artistProfileId': artistProfileId.toJson(),
      'type': type.toJson(),
      'manufacturer': manufacturer,
      'supplier': supplier,
      'productName': productName,
      'batchNumber': batchNumber,
      'expirationDate': expirationDate.toJson(),
      'status': status.toJson(),
      if (quantity != null) 'quantity': quantity,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Material',
      if (id != null) 'id': id?.toJson(),
      'artistProfileId': artistProfileId.toJson(),
      'type': type.toJson(),
      'manufacturer': manufacturer,
      'supplier': supplier,
      'productName': productName,
      'batchNumber': batchNumber,
      'expirationDate': expirationDate.toJson(),
      'status': status.toJson(),
      if (quantity != null) 'quantity': quantity,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  static MaterialInclude include() {
    return MaterialInclude._();
  }

  static MaterialIncludeList includeList({
    _i1.WhereExpressionBuilder<MaterialTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MaterialTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MaterialTable>? orderByList,
    MaterialInclude? include,
  }) {
    return MaterialIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Material.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Material.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MaterialImpl extends Material {
  _MaterialImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required _i2.MaterialType type,
    required String manufacturer,
    required String supplier,
    required String productName,
    required String batchNumber,
    required DateTime expirationDate,
    required _i3.MaterialStatus status,
    int? quantity,
    DateTime? createdAt,
  }) : super._(
         id: id,
         artistProfileId: artistProfileId,
         type: type,
         manufacturer: manufacturer,
         supplier: supplier,
         productName: productName,
         batchNumber: batchNumber,
         expirationDate: expirationDate,
         status: status,
         quantity: quantity,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Material]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Material copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? artistProfileId,
    _i2.MaterialType? type,
    String? manufacturer,
    String? supplier,
    String? productName,
    String? batchNumber,
    DateTime? expirationDate,
    _i3.MaterialStatus? status,
    Object? quantity = _Undefined,
    Object? createdAt = _Undefined,
  }) {
    return Material(
      id: id is _i1.UuidValue? ? id : this.id,
      artistProfileId: artistProfileId ?? this.artistProfileId,
      type: type ?? this.type,
      manufacturer: manufacturer ?? this.manufacturer,
      supplier: supplier ?? this.supplier,
      productName: productName ?? this.productName,
      batchNumber: batchNumber ?? this.batchNumber,
      expirationDate: expirationDate ?? this.expirationDate,
      status: status ?? this.status,
      quantity: quantity is int? ? quantity : this.quantity,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}

class MaterialUpdateTable extends _i1.UpdateTable<MaterialTable> {
  MaterialUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> artistProfileId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.artistProfileId,
    value,
  );

  _i1.ColumnValue<_i2.MaterialType, _i2.MaterialType> type(
    _i2.MaterialType value,
  ) => _i1.ColumnValue(
    table.type,
    value,
  );

  _i1.ColumnValue<String, String> manufacturer(String value) => _i1.ColumnValue(
    table.manufacturer,
    value,
  );

  _i1.ColumnValue<String, String> supplier(String value) => _i1.ColumnValue(
    table.supplier,
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

  _i1.ColumnValue<DateTime, DateTime> expirationDate(DateTime value) =>
      _i1.ColumnValue(
        table.expirationDate,
        value,
      );

  _i1.ColumnValue<_i3.MaterialStatus, _i3.MaterialStatus> status(
    _i3.MaterialStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<int, int> quantity(int? value) => _i1.ColumnValue(
    table.quantity,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime? value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class MaterialTable extends _i1.Table<_i1.UuidValue?> {
  MaterialTable({super.tableRelation}) : super(tableName: 'material') {
    updateTable = MaterialUpdateTable(this);
    artistProfileId = _i1.ColumnUuid(
      'artistProfileId',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    manufacturer = _i1.ColumnString(
      'manufacturer',
      this,
    );
    supplier = _i1.ColumnString(
      'supplier',
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
    expirationDate = _i1.ColumnDateTime(
      'expirationDate',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    quantity = _i1.ColumnInt(
      'quantity',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final MaterialUpdateTable updateTable;

  /// The artist profile this material belongs to.
  late final _i1.ColumnUuid artistProfileId;

  /// Ink or needle.
  late final _i1.ColumnEnum<_i2.MaterialType> type;

  /// Manufacturer name.
  late final _i1.ColumnString manufacturer;

  /// Supplier name.
  late final _i1.ColumnString supplier;

  /// Product name.
  late final _i1.ColumnString productName;

  /// Batch number (key field for recall searches).
  late final _i1.ColumnString batchNumber;

  /// Expiration date.
  late final _i1.ColumnDateTime expirationDate;

  /// Current stock status.
  late final _i1.ColumnEnum<_i3.MaterialStatus> status;

  /// Quantity (needles only, null for ink).
  late final _i1.ColumnInt quantity;

  /// When this material was created.
  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    artistProfileId,
    type,
    manufacturer,
    supplier,
    productName,
    batchNumber,
    expirationDate,
    status,
    quantity,
    createdAt,
  ];
}

class MaterialInclude extends _i1.IncludeObject {
  MaterialInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => Material.t;
}

class MaterialIncludeList extends _i1.IncludeList {
  MaterialIncludeList._({
    _i1.WhereExpressionBuilder<MaterialTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Material.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => Material.t;
}

class MaterialRepository {
  const MaterialRepository._();

  /// Returns a list of [Material]s matching the given query parameters.
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
  Future<List<Material>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<MaterialTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MaterialTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MaterialTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Material>(
      where: where?.call(Material.t),
      orderBy: orderBy?.call(Material.t),
      orderByList: orderByList?.call(Material.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Material] matching the given query parameters.
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
  Future<Material?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<MaterialTable>? where,
    int? offset,
    _i1.OrderByBuilder<MaterialTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MaterialTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Material>(
      where: where?.call(Material.t),
      orderBy: orderBy?.call(Material.t),
      orderByList: orderByList?.call(Material.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Material] by its [id] or null if no such row exists.
  Future<Material?> findById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Material>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Material]s in the list and returns the inserted rows.
  ///
  /// The returned [Material]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Material>> insert(
    _i1.DatabaseSession session,
    List<Material> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Material>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Material] and returns the inserted row.
  ///
  /// The returned [Material] will have its `id` field set.
  Future<Material> insertRow(
    _i1.DatabaseSession session,
    Material row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Material>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Material]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Material>> update(
    _i1.DatabaseSession session,
    List<Material> rows, {
    _i1.ColumnSelections<MaterialTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Material>(
      rows,
      columns: columns?.call(Material.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Material]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Material> updateRow(
    _i1.DatabaseSession session,
    Material row, {
    _i1.ColumnSelections<MaterialTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Material>(
      row,
      columns: columns?.call(Material.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Material] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Material?> updateById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<MaterialUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Material>(
      id,
      columnValues: columnValues(Material.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Material]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Material>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<MaterialUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MaterialTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MaterialTable>? orderBy,
    _i1.OrderByListBuilder<MaterialTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Material>(
      columnValues: columnValues(Material.t.updateTable),
      where: where(Material.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Material.t),
      orderByList: orderByList?.call(Material.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Material]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Material>> delete(
    _i1.DatabaseSession session,
    List<Material> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Material>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Material].
  Future<Material> deleteRow(
    _i1.DatabaseSession session,
    Material row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Material>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Material>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<MaterialTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Material>(
      where: where(Material.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<MaterialTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Material>(
      where: where?.call(Material.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Material] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<MaterialTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Material>(
      where: where(Material.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
