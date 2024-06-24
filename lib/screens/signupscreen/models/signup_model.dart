class UserModel {
  String name;
  String emailOrPhone;

  UserModel({required this.name, required this.emailOrPhone});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email_phone': emailOrPhone,
    };
  }
}
