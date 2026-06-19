import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mari_nail_art/core/configs/app_configs.dart';
import 'package:mari_nail_art/core/error/exceptions.dart';
import 'package:mari_nail_art/features/auth/data/datasources/auth_datasource.dart';
import 'package:mari_nail_art/features/auth/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final http.Client client;
  final SharedPreferences pref;

  AuthDatasourceImpl({required this.client, required this.pref});
  @override
  Future<LoginModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.post(
        Uri.parse(AppConfigs.loginEndpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap =
            jsonDecode(response.body) as Map<String, dynamic>;
        final loginResponse = LoginModel.fromMap(jsonMap);

        if (loginResponse.tokenPair != null) {
          await pref.setString(
            'accessToken',
            loginResponse.tokenPair!.accessToken,
          );
          await pref.setString(
            'refreshToken',
            loginResponse.tokenPair!.refreshToken,
          );
        }
        return loginResponse;
      } else {
        throw ServerException(
          'Server returned status code ${response.statusCode}',
        );
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
