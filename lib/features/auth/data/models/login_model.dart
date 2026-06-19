// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  final String message;
  final bool otpRequired;
  final TokenPair? tokenPair;

  LoginModel({
    required this.message,
    required this.otpRequired,
    required this.tokenPair,
  });

  LoginModel copyWith({
    String? message,
    bool? otpRequired,
    TokenPair? tokenPair,
  }) {
    return LoginModel(
      message: message ?? this.message,
      otpRequired: otpRequired ?? this.otpRequired,
      tokenPair: tokenPair ?? this.tokenPair,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'otpRequired': otpRequired,
      'tokenPair': tokenPair?.toMap(),
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      message: map['message'] as String,
      otpRequired: map['otpRequired'] as bool,
      tokenPair: map['tokenPair'] != null
          ? TokenPair.fromMap(map['tokenPair'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoginModel(message: $message, otpRequired: $otpRequired, tokenPair: $tokenPair)';

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.otpRequired == otpRequired &&
        other.tokenPair == tokenPair;
  }

  @override
  int get hashCode =>
      message.hashCode ^ otpRequired.hashCode ^ tokenPair.hashCode;
}

class TokenPair {
  final String accessToken;
  final String refreshToken;

  TokenPair({required this.accessToken, required this.refreshToken});

  TokenPair copyWith({String? accessToken, String? refreshToken}) {
    return TokenPair(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory TokenPair.fromMap(Map<String, dynamic> map) {
    return TokenPair(
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenPair.fromJson(String source) =>
      TokenPair.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'tokenPair(accessToken: $accessToken, refreshToken: $refreshToken)';

  @override
  bool operator ==(covariant TokenPair other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode => accessToken.hashCode ^ refreshToken.hashCode;
}
