import 'dart:async';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_task_manager_app/core/constants/app_strings.dart';
import 'package:simple_task_manager_app/core/services/storage/storage_service.dart';

/// Implementation of the StorageService interface using Hive for local storage.
///
/// This class provides methods to read from, write to, delete, and clear data in a Hive box.
/// It implements the StorageService interface, making it compatible with other parts of the application
/// that rely on the StorageService abstraction.

@LazySingleton(as: StorageService)
class HiveStorageService<T> implements StorageService {
  late Box _box;

  /// Initializes the Hive box for storing data.
  ///
  /// This method must be called before using any other methods of the storage service.
  @PostConstruct(preResolve: true)
  @override
  Future init() async {
    _box = await Hive.openBox(AppStrings.appName);
    return _box;
  }

  /// Reads data of generic type from the storage using the specified [key].
  ///
  /// Returns the decoded data if found, otherwise returns null.
  @override
  Future<V?> read<V>(String key) async {
    try {
      final encodedValue = await _box.get(key);
      if (encodedValue == null) return null;
      return jsonDecode(encodedValue) as V?;
    } catch (e) {
      return null;
    }
  }

  /// Writes the specified [value] to the storage with the given [key].
  @override
  Future<void> write(String key, value) async {
    final encodedValue = jsonEncode(value);
    return _box.put(key, encodedValue);
  }

  /// Clears all data stored in the storage.
  @override
  FutureOr<void> clear() => _box.clear();

  /// Deletes the data associated with the given [key] from the storage.
  @override
  FutureOr<void> delete(String key) => _box.delete(key);

  /// Retrieves a list of all keys in the storage.
  /// Returns a list of strings representing the keys.
  @override
  FutureOr<List<String>> keys() async {
    return _box.keys.cast<String>().toList();
  }
}
