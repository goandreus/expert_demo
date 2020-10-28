import 'package:demo/managers/http_manager.dart';
import 'package:demo/managers/session_manager.dart';
import 'package:demo/managers/token_maganer.dart';
import 'package:demo/models/request/login_request.dart';
import 'package:demo/models/user_entity.dart';
import 'package:demo/widgets/dialogs.dart';
import 'package:flutter/material.dart';

class AuthApiProvider {
  final HttpManager httpManager = HttpManager();

  Future<bool> loginStudent(
    BuildContext context,
    LoginRequest loginRequest,
  ) async {
    try{
      final responseData = await httpManager.post('auth/login', loginRequest.toJson());
      final token = responseData['token'] as String;
      final user = UserEntity.fromJson(responseData['data']);
      
      if(user.role == 'U'){
        await TokenManager.getInstance().setToken(token);
        final session = await SessionManager.getIntance();
        await session.setUserId(user.id);
        await session.setRole(user.role);
        return true;
      }else {
        Dialogs.alert(
          context,
          title: 'Error',
          message: 'Tu eres un experto, no un estudiante.',
        );
        return false;
      }
    }catch(error){
      Dialogs.alert(context, title:'Error', message: 'Estudiante no encontrado');
      return false;
    }
  }

  Future<bool> loginExpert(
    BuildContext context,
    LoginRequest loginRequest,
  ) async {
    try{
      final responseData = await httpManager.post('auth/login', loginRequest.toJson());
      final token = responseData['token'] as String;
      final user = UserEntity.fromJson(responseData['data']);

      if(user.role == 'E'){
        await TokenManager.getInstance().setToken(token);
        final session = await SessionManager.getIntance();
        await session.setUserId(user.id);
        await session.setRole(user.role);
        return true;
      }else {
        Dialogs.alert(
          context,
          title: 'Error',
          message: 'Tu eres un estudiante, no un experto.',
        );
        return false;
      }
    }catch(error){
      Dialogs.alert(context, title:'Error', message: 'Experto no encontrado');
      return false;
    }
  }
  // TODO: Logout 

}