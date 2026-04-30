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

/// A file stored in object storage (original upload).
abstract class StoredFile
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  StoredFile._({
    this.id,
    required this.artistProfileId,
    required this.fileName,
    required this.mimeType,
    required this.sizeBytes,
    required this.storagePath,
    this.createdAt,
  });

  factory StoredFile({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required String fileName,
    required String mimeType,
    required int sizeBytes,
    required String storagePath,
    DateTime? createdAt,
  }) = _StoredFileImpl;

  factory StoredFile.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoredFile(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      artistProfileId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['artistProfileId'],
      ),
      fileName: jsonSerialization['fileName'] as String,
      mimeType: jsonSerialization['mimeType'] as String,
      sizeBytes: jsonSerialization['sizeBytes'] as int,
      storagePath: jsonSerialization['storagePath'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = StoredFileTable();

  static const db = StoredFileRepository._();

  @override
  _i1.UuidValue? id;

  /// The artist profile that owns this file.
  _i1.UuidValue artistProfileId;

  /// Original filename as uploaded by the user.
  String fileName;

  /// MIME type (e.g. image/png).
  String mimeType;

  /// Size in bytes of the original file.
  int sizeBytes;

  /// S3 object key (e.g. originals/{artistProfileId}/{uuid}.{ext}).
  String storagePath;

  /// When this file was uploaded.
  DateTime? createdAt;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [StoredFile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredFile copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? artistProfileId,
    String? fileName,
    String? mimeType,
    int? sizeBytes,
    String? storagePath,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoredFile',
      if (id != null) 'id': id?.toJson(),
      'artistProfileId': artistProfileId.toJson(),
      'fileName': fileName,
      'mimeType': mimeType,
      'sizeBytes': sizeBytes,
      'storagePath': storagePath,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StoredFile',
      if (id != null) 'id': id?.toJson(),
      'artistProfileId': artistProfileId.toJson(),
      'fileName': fileName,
      'mimeType': mimeType,
      'sizeBytes': sizeBytes,
      'storagePath': storagePath,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  static StoredFileInclude include() {
    return StoredFileInclude._();
  }

  static StoredFileIncludeList includeList({
    _i1.WhereExpressionBuilder<StoredFileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoredFileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoredFileTable>? orderByList,
    StoredFileInclude? include,
  }) {
    return StoredFileIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StoredFile.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(StoredFile.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StoredFileImpl extends StoredFile {
  _StoredFileImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue artistProfileId,
    required String fileName,
    required String mimeType,
    required int sizeBytes,
    required String storagePath,
    DateTime? createdAt,
  }) : super._(
         id: id,
         artistProfileId: artistProfileId,
         fileName: fileName,
         mimeType: mimeType,
         sizeBytes: sizeBytes,
         storagePath: storagePath,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [StoredFile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredFile copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? artistProfileId,
    String? fileName,
    String? mimeType,
    int? sizeBytes,
    String? storagePath,
    Object? createdAt = _Undefined,
  }) {
    return StoredFile(
      id: id is _i1.UuidValue? ? id : this.id,
      artistProfileId: artistProfileId ?? this.artistProfileId,
      fileName: fileName ?? this.fileName,
      mimeType: mimeType ?? this.mimeType,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      storagePath: storagePath ?? this.storagePath,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}

class StoredFileUpdateTable extends _i1.UpdateTable<StoredFileTable> {
  StoredFileUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> artistProfileId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.artistProfileId,
    value,
  );

  _i1.ColumnValue<String, String> fileName(String value) => _i1.ColumnValue(
    table.fileName,
    value,
  );

  _i1.ColumnValue<String, String> mimeType(String value) => _i1.ColumnValue(
    table.mimeType,
    value,
  );

  _i1.ColumnValue<int, int> sizeBytes(int value) => _i1.ColumnValue(
    table.sizeBytes,
    value,
  );

  _i1.ColumnValue<String, String> storagePath(String value) => _i1.ColumnValue(
    table.storagePath,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime? value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class StoredFileTable extends _i1.Table<_i1.UuidValue?> {
  StoredFileTable({super.tableRelation}) : super(tableName: 'stored_file') {
    updateTable = StoredFileUpdateTable(this);
    artistProfileId = _i1.ColumnUuid(
      'artistProfileId',
      this,
    );
    fileName = _i1.ColumnString(
      'fileName',
      this,
    );
    mimeType = _i1.ColumnString(
      'mimeType',
      this,
    );
    sizeBytes = _i1.ColumnInt(
      'sizeBytes',
      this,
    );
    storagePath = _i1.ColumnString(
      'storagePath',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final StoredFileUpdateTable updateTable;

  /// The artist profile that owns this file.
  late final _i1.ColumnUuid artistProfileId;

  /// Original filename as uploaded by the user.
  late final _i1.ColumnString fileName;

  /// MIME type (e.g. image/png).
  late final _i1.ColumnString mimeType;

  /// Size in bytes of the original file.
  late final _i1.ColumnInt sizeBytes;

  /// S3 object key (e.g. originals/{artistProfileId}/{uuid}.{ext}).
  late final _i1.ColumnString storagePath;

  /// When this file was uploaded.
  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    artistProfileId,
    fileName,
    mimeType,
    sizeBytes,
    storagePath,
    createdAt,
  ];
}

class StoredFileInclude extends _i1.IncludeObject {
  StoredFileInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => StoredFile.t;
}

class StoredFileIncludeList extends _i1.IncludeList {
  StoredFileIncludeList._({
    _i1.WhereExpressionBuilder<StoredFileTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(StoredFile.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => StoredFile.t;
}

class StoredFileRepository {
  const StoredFileRepository._();

  /// Returns a list of [StoredFile]s matching the given query parameters.
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
  Future<List<StoredFile>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<StoredFileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoredFileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoredFileTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<StoredFile>(
      where: where?.call(StoredFile.t),
      orderBy: orderBy?.call(StoredFile.t),
      orderByList: orderByList?.call(StoredFile.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [StoredFile] matching the given query parameters.
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
  Future<StoredFile?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<StoredFileTable>? where,
    int? offset,
    _i1.OrderByBuilder<StoredFileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoredFileTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<StoredFile>(
      where: where?.call(StoredFile.t),
      orderBy: orderBy?.call(StoredFile.t),
      orderByList: orderByList?.call(StoredFile.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [StoredFile] by its [id] or null if no such row exists.
  Future<StoredFile?> findById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<StoredFile>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [StoredFile]s in the list and returns the inserted rows.
  ///
  /// The returned [StoredFile]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<StoredFile>> insert(
    _i1.DatabaseSession session,
    List<StoredFile> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<StoredFile>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [StoredFile] and returns the inserted row.
  ///
  /// The returned [StoredFile] will have its `id` field set.
  Future<StoredFile> insertRow(
    _i1.DatabaseSession session,
    StoredFile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<StoredFile>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [StoredFile]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<StoredFile>> update(
    _i1.DatabaseSession session,
    List<StoredFile> rows, {
    _i1.ColumnSelections<StoredFileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<StoredFile>(
      rows,
      columns: columns?.call(StoredFile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StoredFile]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<StoredFile> updateRow(
    _i1.DatabaseSession session,
    StoredFile row, {
    _i1.ColumnSelections<StoredFileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<StoredFile>(
      row,
      columns: columns?.call(StoredFile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StoredFile] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<StoredFile?> updateById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<StoredFileUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<StoredFile>(
      id,
      columnValues: columnValues(StoredFile.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [StoredFile]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<StoredFile>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<StoredFileUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<StoredFileTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoredFileTable>? orderBy,
    _i1.OrderByListBuilder<StoredFileTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<StoredFile>(
      columnValues: columnValues(StoredFile.t.updateTable),
      where: where(StoredFile.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StoredFile.t),
      orderByList: orderByList?.call(StoredFile.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [StoredFile]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<StoredFile>> delete(
    _i1.DatabaseSession session,
    List<StoredFile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<StoredFile>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [StoredFile].
  Future<StoredFile> deleteRow(
    _i1.DatabaseSession session,
    StoredFile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<StoredFile>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<StoredFile>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<StoredFileTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<StoredFile>(
      where: where(StoredFile.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<StoredFileTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<StoredFile>(
      where: where?.call(StoredFile.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [StoredFile] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<StoredFileTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<StoredFile>(
      where: where(StoredFile.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
