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

/// A file stored in object storage (original upload).
abstract class StoredFile implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
