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

/// An artist's brand identity, auto-created on account registration.
abstract class ArtistProfile
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  ArtistProfile._({
    this.id,
    required this.authUserId,
    required this.name,
  });

  factory ArtistProfile({
    _i1.UuidValue? id,
    required _i1.UuidValue authUserId,
    required String name,
  }) = _ArtistProfileImpl;

  factory ArtistProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtistProfile(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      name: jsonSerialization['name'] as String,
    );
  }

  static final t = ArtistProfileTable();

  static const db = ArtistProfileRepository._();

  @override
  _i1.UuidValue? id;

  /// The auth user this profile belongs to.
  _i1.UuidValue authUserId;

  /// Display name for the artist.
  String name;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [ArtistProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtistProfile copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? authUserId,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ArtistProfile',
      if (id != null) 'id': id?.toJson(),
      'authUserId': authUserId.toJson(),
      'name': name,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ArtistProfile',
      if (id != null) 'id': id?.toJson(),
      'authUserId': authUserId.toJson(),
      'name': name,
    };
  }

  static ArtistProfileInclude include() {
    return ArtistProfileInclude._();
  }

  static ArtistProfileIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtistProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtistProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtistProfileTable>? orderByList,
    ArtistProfileInclude? include,
  }) {
    return ArtistProfileIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtistProfile.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtistProfile.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtistProfileImpl extends ArtistProfile {
  _ArtistProfileImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue authUserId,
    required String name,
  }) : super._(
         id: id,
         authUserId: authUserId,
         name: name,
       );

  /// Returns a shallow copy of this [ArtistProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtistProfile copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    String? name,
  }) {
    return ArtistProfile(
      id: id is _i1.UuidValue? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      name: name ?? this.name,
    );
  }
}

class ArtistProfileUpdateTable extends _i1.UpdateTable<ArtistProfileTable> {
  ArtistProfileUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authUserId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );
}

class ArtistProfileTable extends _i1.Table<_i1.UuidValue?> {
  ArtistProfileTable({super.tableRelation})
    : super(tableName: 'artist_profile') {
    updateTable = ArtistProfileUpdateTable(this);
    authUserId = _i1.ColumnUuid(
      'authUserId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
  }

  late final ArtistProfileUpdateTable updateTable;

  /// The auth user this profile belongs to.
  late final _i1.ColumnUuid authUserId;

  /// Display name for the artist.
  late final _i1.ColumnString name;

  @override
  List<_i1.Column> get columns => [
    id,
    authUserId,
    name,
  ];
}

class ArtistProfileInclude extends _i1.IncludeObject {
  ArtistProfileInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => ArtistProfile.t;
}

class ArtistProfileIncludeList extends _i1.IncludeList {
  ArtistProfileIncludeList._({
    _i1.WhereExpressionBuilder<ArtistProfileTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtistProfile.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => ArtistProfile.t;
}

class ArtistProfileRepository {
  const ArtistProfileRepository._();

  /// Returns a list of [ArtistProfile]s matching the given query parameters.
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
  Future<List<ArtistProfile>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ArtistProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtistProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtistProfileTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ArtistProfile>(
      where: where?.call(ArtistProfile.t),
      orderBy: orderBy?.call(ArtistProfile.t),
      orderByList: orderByList?.call(ArtistProfile.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ArtistProfile] matching the given query parameters.
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
  Future<ArtistProfile?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ArtistProfileTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtistProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtistProfileTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ArtistProfile>(
      where: where?.call(ArtistProfile.t),
      orderBy: orderBy?.call(ArtistProfile.t),
      orderByList: orderByList?.call(ArtistProfile.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ArtistProfile] by its [id] or null if no such row exists.
  Future<ArtistProfile?> findById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ArtistProfile>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ArtistProfile]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtistProfile]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<ArtistProfile>> insert(
    _i1.DatabaseSession session,
    List<ArtistProfile> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<ArtistProfile>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [ArtistProfile] and returns the inserted row.
  ///
  /// The returned [ArtistProfile] will have its `id` field set.
  Future<ArtistProfile> insertRow(
    _i1.DatabaseSession session,
    ArtistProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtistProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtistProfile]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtistProfile>> update(
    _i1.DatabaseSession session,
    List<ArtistProfile> rows, {
    _i1.ColumnSelections<ArtistProfileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtistProfile>(
      rows,
      columns: columns?.call(ArtistProfile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtistProfile]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtistProfile> updateRow(
    _i1.DatabaseSession session,
    ArtistProfile row, {
    _i1.ColumnSelections<ArtistProfileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtistProfile>(
      row,
      columns: columns?.call(ArtistProfile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtistProfile] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ArtistProfile?> updateById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<ArtistProfileUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ArtistProfile>(
      id,
      columnValues: columnValues(ArtistProfile.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ArtistProfile]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ArtistProfile>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ArtistProfileUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ArtistProfileTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtistProfileTable>? orderBy,
    _i1.OrderByListBuilder<ArtistProfileTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ArtistProfile>(
      columnValues: columnValues(ArtistProfile.t.updateTable),
      where: where(ArtistProfile.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtistProfile.t),
      orderByList: orderByList?.call(ArtistProfile.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ArtistProfile]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtistProfile>> delete(
    _i1.DatabaseSession session,
    List<ArtistProfile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtistProfile>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtistProfile].
  Future<ArtistProfile> deleteRow(
    _i1.DatabaseSession session,
    ArtistProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtistProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtistProfile>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ArtistProfileTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtistProfile>(
      where: where(ArtistProfile.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ArtistProfileTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtistProfile>(
      where: where?.call(ArtistProfile.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ArtistProfile] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ArtistProfileTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ArtistProfile>(
      where: where(ArtistProfile.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
