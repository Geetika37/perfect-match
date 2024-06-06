import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/screens/widget/upload_picbox.dart';
import 'package:perfectmatch/screens/search/views/search_page.dart';
import 'package:perfectmatch/utils/common_helper.dart';
import 'package:perfectmatch/utils/image_helper.dart';
import 'package:perfectmatch/screens/widget/snackbar.dart';

class ManagePhotos extends StatefulWidget {
  const ManagePhotos({super.key});

  @override
  State<ManagePhotos> createState() => _ManagePhotosState();
}

class _ManagePhotosState extends State<ManagePhotos> {
  RxBool isImageAdded = false.obs;

  final List<GlobalKey<UploadPicBoxRectangleState>> uploadPicBoxRectangleKeys =
      [
    GlobalKey<UploadPicBoxRectangleState>(),
    GlobalKey<UploadPicBoxRectangleState>(),
    GlobalKey<UploadPicBoxRectangleState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            'Manage My photos',
            style: lexend(Colors.black, 18, FontWeight.w500),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Text(
                  'Upload and manage your profile photos to attract your perfect match',
                  style: lexend(Colors.black, 12, FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              hSpace(screenHeight * 0.03),
              UploadPicBoxRectangle(
                key: uploadPicBoxRectangleKeys[0],
                deviceWidth: screenWidth,
                onImageSelected: _checkImageSelections,
              ),
              hSpace(screenHeight * 0.03),
              UploadPicBoxRectangle(
                key: uploadPicBoxRectangleKeys[1],
                deviceWidth: screenWidth,
                onImageSelected: _checkImageSelections,
              ),
              hSpace(screenHeight * 0.03),
              UploadPicBoxRectangle(
                key: uploadPicBoxRectangleKeys[2],
                deviceWidth: screenWidth,
                onImageSelected: _checkImageSelections,
              ),
              hSpace(screenHeight * 0.04),
              ButtonNormal(
                height: screenHeight * 0.06,
                width: screenWidth,
                text: 'Upload',
                onTap: () {
                  HapticFeedback.heavyImpact();
                  if (_validateForm()) {
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
    );
  }

  void _checkImageSelections() {
    setState(() {});
  }

  bool _validateForm() {
    for (var key in uploadPicBoxRectangleKeys) {
      if (key.currentState == null || !key.currentState!.isImageSelected()) {
        showErrorMessage(context,
            message: 'Please upload all profile pictures.');
        return false;
      }
    }
    return true;
  }

  

  
}
