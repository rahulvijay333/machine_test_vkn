import 'dart:convert';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:login_machine_test/core/api/api_endpoints.dart';
import 'package:login_machine_test/domain/model/login/login_model/login_model.dart';

class LoginService {
  // login account api call happens here , takes two parameters
  // username and password
  Future<(String, LoginModel?)> loginAccount(
      {required String username, required String password}) async {
    try {
      //---------store  the values as json
      final loginData = jsonEncode(
          {'username': username, 'password': password, 'is_mobile': true});

      final Response response =
          await Dio().post(ApiEndpoints.login, data: loginData);

      if (response.statusCode == 200) {
        final loginDetails = LoginModel.fromJson(response.data);

        if (loginDetails.success == 6001) {
          return (loginDetails.error.toString(), null);
        }

        return ("", loginDetails);
      } else {
        return ('Error occurred', null);
      }
    } catch (e) {
      if (e is DioException) {
        if (e.error is SocketException) {
          return ('Check Internet connectivity', null);
        } else {
          return ('Try lator, server connection failed', null);
        }
      } else {
        return ("Error connection to server", null);
      }
    }
  }
}
