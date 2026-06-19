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
}
