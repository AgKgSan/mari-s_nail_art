import 'package:mari_nail_art/features/auth/data/models/login_model.dart';

abstract interface class AuthUsecase {
  Future<LoginModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  bool checkIsAuthenticated();
  Future<void> authlogout();
  Future<void> forgotPassword({required String email});

  Future<Map<String, dynamic>> verifyOtp({
    required String email,
    required String otp,
  });

  Future<void> resetPassword({
    required String newPassword,
    required String token,
  });
}
