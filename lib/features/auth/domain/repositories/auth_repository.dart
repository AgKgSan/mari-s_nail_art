import 'package:mari_nail_art/features/auth/data/models/login_model.dart';

abstract interface class AuthRepository {
  Future<LoginModel> loginWithEmailAndPassword(String email, String password);
  bool isAuthenticated();
  Future<void> logout();

  Future<void> forgotPassword(String email);
  Future<Map<String, dynamic>> verifyOtp(String email, String otp);
  Future<void> resetPassword(String newPassword, String token);
}
