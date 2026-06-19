import 'package:mari_nail_art/features/auth/data/models/login_model.dart';

abstract interface class AuthDatasource {
  Future<LoginModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}
