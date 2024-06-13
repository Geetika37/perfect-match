// models/login_response.dart
class LoginResponse {
  final bool result;
  final int userId;
  final String message;
  final int otp;

  LoginResponse({
    required this.result,
    required this.userId,
    required this.message,
    required this.otp,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      result: json['result'],
      userId: json['user_id'],
      message: json['message'],
      otp: json['otp'],
    );
  }
}
