import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorMessage(BuildContext context, {required String message}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSuccessMessage(BuildContext context, {required String message}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.green,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class CustomSnackbars {
  static void showErrorSnackbar(String message) {
    Get.snackbar(
      'Registration Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}


 
class Snackbarss {
  static void showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.BOTTOM,
backgroundColor: Colors.green,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      shouldIconPulse: false,
      mainButton: TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text(
          'OK',
          style: TextStyle(color: Colors.white),
        ),
      ),
      overlayBlur: 0.5,
overlayColor: Colors.black.withOpacity(0.5),
      snackbarStatus: (status) {},
    );
  }
 
  static void showErrorSnackbar(String errorMessage) {
    Get.snackbar(
      'Error',
      errorMessage,
      snackPosition: SnackPosition.BOTTOM,
backgroundColor: Colors.red,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
      icon: const Icon(Icons.error, color: Colors.white),
      shouldIconPulse: false,
      mainButton: TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text(
          'OK',
          style: TextStyle(color: Colors.white),
        ),
      ),
      overlayBlur: 0.5,
overlayColor: Colors.black.withOpacity(0.5),
      snackbarStatus: (status) {},
    );
  }
}