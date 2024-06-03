import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/profilescreen/widgets/upload_picbox.dart';
import 'package:perfectmatch/screens/search/views/search_page.dart';
import 'package:perfectmatch/utils/common_helper.dart';
import 'package:perfectmatch/utils/image_helper.dart';

class ManagePhotos extends StatelessWidget {
  const ManagePhotos({super.key});

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
            UploadPicBoxRectangle(deviceWidth: screenWidth),
            hSpace(screenHeight * 0.03),
            UploadPicBoxRectangle(deviceWidth: screenWidth),
            hSpace(screenHeight * 0.03),
            UploadPicBoxRectangle(deviceWidth: screenWidth),
            hSpace(screenHeight * 0.04),
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
    ));
  }
}
