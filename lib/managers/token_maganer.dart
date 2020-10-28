
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  static TokenManager _instance;
  static const _key = "SESSION_PRIVATE_KEY";
  final storage = FlutterSecureStorage();
  String _token;

  static TokenManager getInstance(){
    if (_instance == null){
      _instance = TokenManager();
    }
    return _instance;
  }

  Future<String> getToken() async {
    if(_token == null){
      _token = await storage.read(key: _key);
    }
    return _token;
  }

  Future setToken(String token) async {
    _token = token;
    await storage.write(key: _key, value: token);
  }

  Future cleanToken() async {
    _token = null;
    await storage.delete(key: _key);
  }

  
}