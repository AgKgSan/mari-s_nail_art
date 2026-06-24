import 'package:flutter/widgets.dart';
import 'package:mari_nail_art/core/error/exceptions.dart';
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

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  Map<String, dynamic>? _tokenData;
  Map<String, dynamic>? get tokenData => _tokenData;

  String? _activeEmail;
  String? get activeEmail => _activeEmail;

  String? _verificationToken;
  String? get verificationToken => _verificationToken;

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

  void authenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }

  Future<void> logout() async {
    await authUsecase.authlogout();
    _isAuthenticated = false;
    notifyListeners();
  }

  Future<bool> forgotPassword({required String email}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await authUsecase.forgotPassword(email: email);
      _activeEmail = email;
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('ServerException:', '').trim();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> verifyOtp({required String otp}) async {
    if (_activeEmail == null) {
      _errorMessage = "Email context missing. Please restart recovery flow.";
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await authUsecase.verifyOtp(
        email: _activeEmail!,
        otp: otp,
      );
      _verificationToken = response['accessToken'] as String?;
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('ServerException:', '').trim();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> resetPassword({required String newPassword}) async {
    if (_verificationToken == null) {
      _errorMessage =
          "Session unauthorized. Please verify your OTP code first.";
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await authUsecase.resetPassword(
        newPassword: newPassword,
        token: _verificationToken!,
      );

      _activeEmail = null;
      _verificationToken = null;
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('ServerException:', '').trim();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
