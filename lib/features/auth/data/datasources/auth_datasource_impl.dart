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

  @override
  bool hasToken() {
    final accesstoken = pref.getString('accessToken');
    final refreshtoken = pref.getString('refreshToken');
    return accesstoken != null &&
        refreshtoken != null &&
        accesstoken.isNotEmpty &&
        refreshtoken.isNotEmpty;
  }

  @override
  Future<void> clearToken() async {
    await pref.remove('accessToken');
    await pref.remove('refreshToken');
  }

  @override
  Future<void> forgotPassword(String email) async {
    final response = await http.post(
      Uri.parse(AppConfigs.forgotPw),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      final errorLog = jsonDecode(response.body);
      throw Exception(errorLog['message'] ?? 'Forgot password request failed');
    }
  }

  @override
  Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
    final response = await http.post(
      Uri.parse(AppConfigs.verifyOtp),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'otp': otp}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      final errorLog = jsonDecode(response.body);
      throw Exception(errorLog['message'] ?? 'OTP Verification failed');
    }
  }

  @override
  Future<void> resetPassword(String newPassword, String token) async {
    final response = await http.post(
      Uri.parse(AppConfigs.resetPw),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'newPassword': newPassword}),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      final errorLog = jsonDecode(response.body);
      throw Exception(errorLog['message'] ?? 'Reset password failed');
    }
  }
}
