import 'package:shared_preferences/shared_preferences.dart';

part 'local_database_key.dart';

class AppLocalDatabaseManager {
  SharedPreferences? sharedPreferences;

  _LocalDatabaseKey databaseKey = new _LocalDatabaseKey();

  static final AppLocalDatabaseManager _AppLocalDatabaseManager =
      AppLocalDatabaseManager._internal();

  factory AppLocalDatabaseManager() {
    return _AppLocalDatabaseManager;
  }

  AppLocalDatabaseManager._internal() {
    _setUp();
  }

  void _setUp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  setToken(String token) async {
    await sharedPreferences?.setString(databaseKey.token, token);
  }

  getToken() {
    return sharedPreferences?.getString(databaseKey.token);
  }

 logOut() async {
    return await sharedPreferences!.clear();
  }
}
