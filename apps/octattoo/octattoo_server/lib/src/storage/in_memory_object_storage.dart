import 'dart:typed_data';

import 'object_storage_client.dart';

/// In-memory implementation of [ObjectStorageClient] for testing.
class InMemoryObjectStorage implements ObjectStorageClient {
  final Map<String, Uint8List> _objects = {};

  Map<String, Uint8List> get objects => Map.unmodifiable(_objects);

  @override
  Future<String> putObject({
    required String key,
    required Uint8List bytes,
    required String contentType,
  }) async {
    _objects[key] = bytes;
    return getObjectUrl(key);
  }

  @override
  Future<void> deleteObject(String key) async {
    _objects.remove(key);
  }

  @override
  Future<void> deleteByPrefix(String prefix) async {
    _objects.removeWhere((key, _) => key.startsWith(prefix));
  }

  @override
  String getObjectUrl(String key) => 'https://storage.test/$key';

  @override
  Future<bool> objectExists(String key) async => _objects.containsKey(key);
}
