import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:perfectmatch/screens/mainscreen/view/main_screen.dart';
import 'package:perfectmatch/screens/widget/snackbar.dart';

class RegisterController extends GetxController {
  RxBool isVisible = false.obs;
  RxString msg = ''.obs;
  var isLoading = false.obs;

  var nameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var heightController = TextEditingController().obs;

  var dobController = ''.obs;
  var bloodGroupController = ''.obs;
  var professionController = ''.obs;
  var educationController = ''.obs;
  var genderController = ''.obs;
  Rx<XFile?> profileImageController = Rx<XFile?>(null);
  var hobbiesController = ''.obs;
  var interestController = ''.obs;
  var familyTypeController = ''.obs;
  var noSiblingsController = ''.obs;
  var preferredFamilyBackgroundController = ''.obs;
  var preferredSiblingsNumberController = ''.obs;
  var preferredProfessionController = ''.obs;

  void registerUser() async {
    try {
      isLoading(true);
      final response = await http.post(
          Uri.parse(
            'http://perfectmatch.mywebtest.fun/api/v2/register_details',
          ),
          body: {
            'name': nameController.value.text,
            'email': emailController.value.text,
            'phone_number': phoneController.value.text,
            'dob': dobController.value,
            'height': heightController.value.text,
            'blood_group': bloodGroupController.value,
            'profession': professionController.value,
            'education': educationController.value,
            'gender': genderController.value,
            'profile_image': profileImageController.value?.path ?? '',
            'hobbies': hobbiesController.value,
            'interests': interestController.value,
            'family_type': familyTypeController.value,
            'no_siblings': noSiblingsController.value,
          });
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final message = jsonResponse['message'];
        msg.value = message;
        if (jsonResponse["status"] == "true") {
          nameController.value.clear();
          emailController.value.clear();
          phoneController.value.clear();
          dobController.value = '';
          heightController.value.clear();
          bloodGroupController.value = '';
          professionController.value = '';
          educationController.value = '';
          genderController.value = '';
          profileImageController.value = null;
          hobbiesController.value='';
          interestController.value='';
          familyTypeController.value = '';
          noSiblingsController.value = '';

          Snackbarss.showSuccessSnackbar(message);
          Get.to(const MainScreen());
        } else {
          Snackbarss.showErrorSnackbar(message);
        }
      } else {
        var jsonResponse = json.decode(response.body);
        Snackbarss.showErrorSnackbar(jsonResponse['message']);
      }
    } catch (e) {
      Snackbarss.showErrorSnackbar('Failed to register:$e');
    } finally {
      isLoading(false);
    }
  }
}





















// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:perfectmatch/screens/widget/snackbar.dart';

// class RegisterController extends GetxController {
//   RxBool isVisible = false.obs;
//   RxString msg = ''.obs;
//   var isLoading = false.obs;

//   var nameController = TextEditingController().obs;
//   var emailController = TextEditingController().obs;
//   var phoneController = TextEditingController().obs;
//   var heightController = TextEditingController().obs;

//   var dobController = ''.obs;
//   var bloodGroupController = ''.obs;
//   var professionController = ''.obs;
//   var educationController = ''.obs;
//   var genderController = ''.obs;
//   Rx<XFile?> profileImageController = Rx<XFile?>(null);
//   var hobbiesController = <String>[].obs;
//   var interestController = <String>[].obs;
//   var familyTypeController = ''.obs;
//   var noSiblingsController = ''.obs;
//   var preferredFamilyBackgroundController = ''.obs;
//   var preferredSiblingsNumberController = ''.obs;
//   var preferredProfessionController = ''.obs;

//   void registerUser() async {
//     try {
//       var request = http.MultipartRequest(
//           'POST',
//           Uri.parse(
//               'http://perfectmatch.mywebtest.fun/api/v2/register_details'));
//       request.fields.addAll({
//         'name': 'Shabeer',
//         'email': 'shabeer12@gmail.com',
//         'phone_number': '7558006651',
//         'dob': '11/02/1996',
//         'height': '180',
//         'blood_group': 'B+',
//         'profession': 'Web developer',
//         'education': 'Degree',
//         'gender': 'male',
//         'hobbies': 'Reading,Music,Cooking',
//         'interests': 'Technology, Photography',
//         'family_type': 'Nuclear',
//         'no_siblings': '1'
//       });
//       request.files.add(await http.MultipartFile.fromPath(
//           'profile_image', profileImageController.value!.path));
//       print(profileImageController.value!.path);

//       http.StreamedResponse response = await request.send();
//       // print(response.);

//       if (response.statusCode == 200) {
//         print(await response.stream.bytesToString());
//       } else {
//         print(response.reasonPhrase);
//         // log(r.toString(), name: 'Error ');
//       }
//     } catch (e) {
//       log(e.toString(), name: 'Error ');

//       Snackbarss.showErrorSnackbar('Failed to register: $e');
//     } finally {
//       isLoading(false);
//     }
//   }
// }
