import 'dart:convert';

import 'package:demo/app_config.dart';
import 'package:demo/managers/token_maganer.dart';
import 'package:http/http.dart' as http;

class HttpManager {
  Future<dynamic> get(url) async {
    final headers = await _getHeaders();
    final response = await http.Client().get(AppConfig.API_URL + url, headers: headers);
    final parsed = jsonDecode(response.body);
    final success = parsed['success'];

    if(!success){
      throw Exception(parsed['message']);
    }
    return parsed;
  }

  Future<dynamic> put(url) async {
    final headers = await _getHeaders();
    final response = await http.Client().put(AppConfig.API_URL + url, headers: headers);
    final parsed = jsonDecode(response.body);
    final success = parsed['success'];

    if(!success){
      throw Exception('Error al crear');
    }
    return parsed;
  }

  Future<dynamic> post(url, data) async {
    final headers = await _getHeaders();
    final response = await http.Client().post(AppConfig.API_URL + url,
      body: jsonEncode(data), headers: headers
    );
    final parsed = jsonDecode(response.body);
    final success = parsed['success'];

    if (!success) {
      throw Exception(parsed['message']);
    }
    return parsed;
  }

  //TODO: Form validate


  _getHeaders() async {
    final token = await TokenManager.getInstance().getToken();

    return {
      'Content-Type' : 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $token'
    };
  }
}