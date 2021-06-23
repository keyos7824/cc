import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// description :
// Methodes :
// date :
class Storage {
 static const _storage = FlutterSecureStorage();
  final String secureKey;
  final SharedPreferences prefsInstance;

  Storage(this.secureKey, this.prefsInstance);

  Future<void> writeKey(String key) async {
    await _storage.write(
      key: secureKey,
      value: key,
    );
 }

  Future<void> clean() async {
    await _storage.deleteAll();
  }

  Future<List> write(String key, String value) async {
    bool res = await prefsInstance.setString(key, value);

    String message = "ok";

    if (!res) {
      message = "Something went wrong while writing in storage";
    }

    return [message, res];
  }

  List read(String key) {
    Object? res = prefsInstance.get(key);
    if (res == null) {
      return [res, false];
    }
    return [res, true];
  }
}
