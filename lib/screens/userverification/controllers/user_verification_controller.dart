import 'package:get/get.dart';

class UserVerificationController extends GetxController {
  var governmentIdFilePath = ''.obs;
  var selectedImagePath = ''.obs;

  void setGovernmentIdFilePath(String path) {
    governmentIdFilePath.value = path;
  }

  void setSelectedImagePath(String path) {
    selectedImagePath.value = path;
  }
}
