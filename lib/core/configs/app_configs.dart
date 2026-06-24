class AppConfigs {
  static String baseUrl = "http://192.168.0.182:8080";
  static String loginEndpoint = "$baseUrl/api/auth/login";
  static String forgotPw = "$baseUrl/api/auth/forgot-password";
  static String verifyOtp = "$baseUrl/api/auth/verify-otp";
  static String resetPw = "$baseUrl/api/auth/reset-password";
  static String walkIn = "$baseUrl/api/bookings/walk-in";
  static String getServices = "$baseUrl/api/services";
}
