import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/userverification/controllers/user_verification_controller.dart';
import 'package:perfectmatch/screens/userverification/widgets/bottomsheet_userverification.dart';
import 'package:perfectmatch/screens/userverification/widgets/fileupload_container.dart';
import 'package:perfectmatch/screens/userverification/widgets/photoupload_container.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/screens/widget/snackbar.dart';
import 'package:perfectmatch/utils/common_helper.dart';
import 'package:perfectmatch/utils/image_helper.dart';

class UserVerification extends StatefulWidget {
  UserVerification({super.key});

  @override
  State<UserVerification> createState() => _UserVerificationState();
}

class _UserVerificationState extends State<UserVerification> {
  final UserVerificationController userVerificationController =
      Get.put(UserVerificationController());
  File? fileToDisplay;
  String? fileType;

  void pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
      );

      if (result != null) {
        PlatformFile pickedFile = result.files.first;
        fileToDisplay = File(pickedFile.path!);
        fileType = pickedFile.extension;

        userVerificationController.setGovernmentIdFilePath(pickedFile.path!);
        setState(() {});
      }
    } catch (e) {
      print("File pick error: $e");
    }
  }

  Widget displayFile(String filePath) {
    String extension = fileType ?? filePath.split('.').last;
    if (extension == 'pdf') {
      return SizedBox(
        height: 200,
        child: PDFView(
          filePath: filePath,
        ),
      );
    } else if (['jpg', 'jpeg', 'png', 'gif'].contains(extension)) {
      return Image.file(File(filePath));
    } else {
      return Column(
        children: [
          const Icon(Icons.insert_drive_file, size: 100),
          const SizedBox(height: 10),
          Text('File: ${filePath.split('/').last}',
              textAlign: TextAlign.center),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              HapticFeedback.heavyImpact();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          'Verify Your Profile',
          style: lexend(
            Colors.black,
            16,
            FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //frst
              Obx(() {
                return UserVerificationContainerFileUpload(
                  fileWidget: userVerificationController
                          .governmentIdFilePath.value.isEmpty
                      ? Image.asset(getAssetImage('fingerprint'))
                      : displayFile(userVerificationController
                          .governmentIdFilePath.value),
                  title: 'Government ID',
                  subTitle:
                      "Upload a photo of your national identity card, driver's license, or passport",
                  buttonText: 'Add',
                  buttonIcon: 'upload',
                  onTap: pickFile,
                );
              }),

              hSpace(screenHeight * 0.08),
              // scnd

              Obx(() {
                return UserVerificationContainer(
                  image:
                      userVerificationController.selectedImagePath.value.isEmpty
                          ? 'eyes'
                          : userVerificationController.selectedImagePath.value,
                  title: 'Upload a current selfie',
                  subTitle:
                      "It is legally required to verify your identity as a new user",
                  buttonText: 'Add',
                  buttonIcon: 'upload',
                  onTap: () {
                    Get.bottomSheet(
                      backgroundColor: Colors.white,
                      const BottomSheetImageUpload(),
                    );
                  },
                  isImagePath: userVerificationController
                      .selectedImagePath.value.isNotEmpty,
                );
              }),

              hSpace(screenHeight * 0.09),

              // button
              ButtonNormal(
                height: screenHeight * 0.06,
                width: screenWidth,
                text: 'Upload',
                onTap: () {
                  if (userVerificationController
                          .selectedImagePath.value.isEmpty ||
                      userVerificationController
                          .governmentIdFilePath.value.isEmpty) {
                    showErrorMessage(context, message: 'Upload all Files');
                  } else {
                    showSuccessMessage(context, message: 'Success');
                  }
                },
                radius: 10,
                textSize: 16,
                fontWeight: FontWeight.w600,
                iconOrImage: Image.asset(getAssetImage('upload')),
              ),
            ],
          ),
        ),
      ),
    ));
  }

 
}
