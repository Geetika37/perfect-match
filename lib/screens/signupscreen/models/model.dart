// class RegisterResponse {
//   String name;
//   String email;
//   String phoneNumber;
//   String dob;
//   String height;
//   String bloodGroup;
//   String profession;
//   String education;
//   String gender;
//   String profileImage;
//   String hobbies;
//   String interests;
//   String familyType;
//   int noSiblings;

//   RegisterResponse({
//     required this.name,
//     required this.email,
//     required this.phoneNumber,
//     required this.dob,
//     required this.height,
//     required this.bloodGroup,
//     required this.profession,
//     required this.education,
//     required this.gender,
//     required this.profileImage,
//     required this.hobbies,
//     required this.interests,
//     required this.familyType,
//     required this.noSiblings,
//   });

//   factory RegisterResponse.fromJson(Map<String, dynamic> json) {
//     return RegisterResponse(
//         name: json[''],
//         email: json[''],
//         phoneNumber: json[''],
//         dob: json[''],
//         height: json[''],
//         bloodGroup: json[''],
//         profession: json[''],
//         education: json[''],
//         gender: json[''],
//         profileImage: json[''],
//         hobbies: json[''],
//         interests: json[''],
//         familyType: json[''],
//         noSiblings: json['']);
//   }
// }


class RegisterResponse {
  final String status;
  final String message;
  final String errors;
  RegisterResponse({
    required this.status,
    required this.message,
    required this.errors,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      status: json['status'],
      message: json['message'],
      errors: json['errors'],
    );
  }
}
