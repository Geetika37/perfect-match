import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/search/views/search_page.dart';
import 'package:perfectmatch/screens/userverification/controllers/user_verification_controller.dart';
import 'package:perfectmatch/screens/userverification/widgets/bottomsheet_userverification.dart';
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
      return Container(
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
          Icon(Icons.insert_drive_file, size: 100),
          SizedBox(height: 10),
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
                      BottomSheetImageUpload(),
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
                onTap: () {},
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

class UserVerificationContainer extends StatelessWidget {
  const UserVerificationContainer({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.buttonIcon,
    required this.onTap,
    this.isImagePath = false,
  });

  final String image, title, subTitle, buttonText, buttonIcon;
  final Function() onTap;
  final bool isImagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isImagePath
            ? Image.file(File(image))
            : Image.asset(getAssetImage(image)),
        hSpace(screenHeight * 0.05),
        Text(
          title,
          style: lexend(Colors.black, 20, FontWeight.w500),
        ),
        hSpace(screenHeight * 0.01),
        Text(
          subTitle,
          style: lexend(Colors.black, 12, FontWeight.w400),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        hSpace(screenHeight * 0.05),
        ButtonNormal(
          height: screenHeight * 0.05,
          width: screenWidth * 0.3,
          text: buttonText,
          onTap: onTap,
          radius: 10,
          textSize: 16,
          fontWeight: FontWeight.w600,
          iconOrImage: Image.asset(getAssetImage(buttonIcon)),
        ),
      ],
    );
  }
}

class UserVerificationContainerFileUpload extends StatelessWidget {
  const UserVerificationContainerFileUpload({
    super.key,
    required this.fileWidget,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.buttonIcon,
    required this.onTap,
  });

  final Widget fileWidget;
  final String title, subTitle, buttonText, buttonIcon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        fileWidget,
        hSpace(screenHeight * 0.05),
        Text(
          title,
          style: lexend(Colors.black, 20, FontWeight.w500),
        ),
        hSpace(screenHeight * 0.01),
        Text(
          subTitle,
          style: lexend(Colors.black, 12, FontWeight.w400),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        hSpace(screenHeight * 0.05),
        ButtonNormal(
          height: screenHeight * 0.05,
          width: screenWidth * 0.3,
          text: buttonText,
          onTap: onTap,
          radius: 10,
          textSize: 16,
          fontWeight: FontWeight.w600,
          iconOrImage: Image.asset(getAssetImage(buttonIcon)),
        ),
      ],
    );
  }
}
