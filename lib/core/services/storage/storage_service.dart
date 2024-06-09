import 'dart:async';

/// This interface defines methods for initializing storage, reading, writing, deleting,
/// and clearing data, as well as retrieving a list of keys.
abstract class StorageService<T> {
  FutureOr<T> init();

  FutureOr<void> write(String key, T value);

  FutureOr<V?> read<V>(String key);

  FutureOr<void> delete(String key);

  FutureOr<void> clear();

  FutureOr<List<String>> keys();
}
