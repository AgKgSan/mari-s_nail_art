import 'package:mari_nail_art/core/error/exceptions.dart';
import 'package:mari_nail_art/features/auth/data/models/login_model.dart';
import 'package:mari_nail_art/features/auth/domain/repositories/auth_repository.dart';
import 'package:mari_nail_art/features/auth/domain/usecases/auth_usecase.dart';

class AuthUsecaseImpl implements AuthUsecase {
  final AuthRepository authRepository;

  AuthUsecaseImpl({required this.authRepository});
  @override
  Future<LoginModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await authRepository.loginWithEmailAndPassword(email, password);
  }

  @override
  bool checkIsAuthenticated() {
    return authRepository.isAuthenticated();
  }

  @override
  Future<void> authlogout() async {
    await authRepository.logout();
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    if (email.isEmpty) {
      throw ServerException('Email field cannot be empty.');
    }
    if (!email.contains('@')) {
      throw ServerException('Please enter a valid email address.');
    }
    try {
      await authRepository.forgotPassword(email);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    if (otp.isEmpty) {
      throw ServerException('OTP field cannot be empty.');
    }
    if (otp.length < 4) {
      throw ServerException('Please enter a complete valid OTP code.');
    }
    try {
      return await authRepository.verifyOtp(email, otp);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> resetPassword({
    required String newPassword,
    required String token,
  }) async {
    if (newPassword.isEmpty) {
      throw Exception('Password field cannot be empty.');
    }
    if (newPassword.length < 6) {
      throw Exception('Password must contain at least 6 characters.');
    }
    // Forwarding parameters cleanly directly matching your AuthRepoImpl setup
    return await authRepository.resetPassword(newPassword, token);
  }
}
