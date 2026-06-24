import 'package:mari_nail_art/features/auth/data/models/login_model.dart';

abstract interface class AuthDatasource {
  Future<LoginModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  bool hasToken();
  Future<void> clearToken();

  Future<void> forgotPassword(String email);
  Future<Map<String, dynamic>> verifyOtp(String email, String otp);
  Future<void> resetPassword(String newPassword, String token);
}
