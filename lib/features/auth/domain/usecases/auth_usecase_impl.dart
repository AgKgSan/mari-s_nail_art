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
}
