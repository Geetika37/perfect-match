import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:perfectmatch/screens/location/view/location.dart';
import 'dart:convert';

import 'package:perfectmatch/screens/signupscreen/models/signup_model.dart';
import 'package:perfectmatch/screens/widget/snackbar.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> registerUser(UserModel user) async {
    isLoading(true);

    const url = 'http://perfectmatch.mywebtest.fun/api/v2/register';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    isLoading(false);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['result'] == true) {
        // Get.to(() => const Profile1Screen());
        // Get.to(() => const Location());
        Get.to(() => const LocationView());


      } else {
        errorMessage(responseBody['message']);
        CustomSnackbars.showErrorSnackbar(responseBody['message']);
      }
    } else {
      errorMessage('Registration failed. Please try again.');
      CustomSnackbars.showErrorSnackbar(
          'Registration failed. Please try again.');
    }
  }
}
