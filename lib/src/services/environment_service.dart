import 'dart:collection';
import 'dart:convert';
import 'dart:html';
import 'package:angular/core.dart';
import 'package:lotto_defence_tools/src/core/models/environment.dart';

@Injectable()
class EnvironmentService with MapMixin<String, Environment> {
  static const String _key = 'ENV';
  final Storage _storage;
  final Map<String, Environment> _cache;

  EnvironmentService(this._storage) :
    _cache = _loadEnvironmentMap(_storage);

  @override
  Environment operator [](Object key) {
    return _cache[key];
  }

  @override
  void operator []=(String key, Environment value) {
    _cache[key] = value;
    pushCache();
  }

  @override
  void clear() {
    _cache.clear();
    pushCache();
  }

  @override
  Iterable<String> get keys => _cache.keys;

  @override
  Environment remove(Object key) {
    var env = _cache.remove(key);
    pushCache();
    return env;
  }

  void pushCache() {
    _storage[_key] = json.encode(_cache);
  }

  static Map<String, Environment> _loadEnvironmentMap(Storage storage) {
    if (storage.containsKey(_key)) {
      window.console.debug('Loading environment from local storage...');
      try {
        var jsonMap = json
          .decode(storage[_key]) as Map<String, dynamic>;
        var environmentValues = jsonMap.values.map((v) => Environment.fromJson(v));
        return Map.fromIterables(jsonMap.keys, environmentValues);
      } on Exception {
        window.console.debug('Previous environment in local storage is corrupt. Creating a new environment...');
        storage.remove(_key);
        return <String, Environment>{};
      }
    } else {
      window.console.debug('Creating new environment...');
      return <String, Environment>{};
    }
  }
}
