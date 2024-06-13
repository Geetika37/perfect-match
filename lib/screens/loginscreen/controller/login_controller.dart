// controllers/login_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:perfectmatch/screens/loginscreen/models/login_model.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<LoginResponse?> login(String emailOrPhone) async {
    isLoading(true);
    const url = 'http://perfectmatch.mywebtest.fun/api/v2/login';
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"email_phone": emailOrPhone}),
    );
    isLoading(false);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['result']) {
        return LoginResponse.fromJson(responseData);
      } else {
        Get.snackbar("Error", responseData['message'] ?? "Failed to login",
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
        return null;
      }
    } else {
      Get.snackbar("Error", "Failed to login",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
      return null;
    }
  }
}
