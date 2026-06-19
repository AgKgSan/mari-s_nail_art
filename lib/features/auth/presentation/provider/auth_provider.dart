import 'package:flutter/widgets.dart';
import 'package:mari_nail_art/features/auth/data/models/login_model.dart';
import 'package:mari_nail_art/features/auth/domain/usecases/auth_usecase.dart';

class AuthProvider extends ChangeNotifier {
  final AuthUsecase authUsecase;

  AuthProvider({required this.authUsecase});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  LoginModel? _loginModel;
  LoginModel? get loginModel => _loginModel;
  bool get isAuthenticated => _loginModel != null;
  Future<bool> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));

    try {
      _loginModel = await authUsecase.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('ServerException:', '');
      _loginModel = null;
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
