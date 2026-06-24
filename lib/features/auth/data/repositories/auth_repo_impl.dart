import 'package:mari_nail_art/core/error/exceptions.dart';
import 'package:mari_nail_art/features/auth/data/datasources/auth_datasource.dart';
import 'package:mari_nail_art/features/auth/data/models/login_model.dart';
import 'package:mari_nail_art/features/auth/domain/repositories/auth_repository.dart';

class AuthRepoImpl implements AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepoImpl({required this.authDatasource});
  @override
  Future<LoginModel> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result = await authDatasource.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  bool isAuthenticated() => authDatasource.hasToken();

  @override
  Future<void> logout() async {
    await authDatasource.clearToken();
  }

  @override
  Future<void> forgotPassword(String email) async {
    return await authDatasource.forgotPassword(email);
  }

  @override
  Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
    return await authDatasource.verifyOtp(email, otp);
  }

  @override
  Future<void> resetPassword(String newPassword, String token) async {
    return await authDatasource.resetPassword(newPassword, token);
  }
}
