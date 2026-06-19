import 'package:mari_nail_art/features/auth/data/models/login_model.dart';

abstract interface class AuthRepository {
  Future<LoginModel> loginWithEmailAndPassword(String email, String password);
}
