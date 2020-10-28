import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static SessionManager _instance;
  static SharedPreferences _sharedPreferences;

  static const String USER_ID = "USER_ID";
  static const String USER_ROLE = "USER_ROLE";

  static Future<SessionManager> getIntance() async {
    if(_instance == null){
      _instance = SessionManager();
      await _instance._init();
    }
    return _instance;
  }

  Future _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  setUserId(int userId) async {
    if (_sharedPreferences == null) return null;
    return await _sharedPreferences.setInt(USER_ID, userId);
  }

  int getUserId(){
    if(_sharedPreferences == null) return null;
    return _sharedPreferences.getInt(USER_ID) ?? 0;
  }

  setRole(String role) async {
    if(_sharedPreferences == null) return null;
    return await _sharedPreferences.setString(USER_ROLE, role);
  }

  String getRole(){
    if(_sharedPreferences == null) return null;
    return _sharedPreferences.getString(USER_ROLE) ?? null;
  }
  
  clear() async {
    if(_sharedPreferences == null) return null;
    return await _sharedPreferences.clear();
  }

}