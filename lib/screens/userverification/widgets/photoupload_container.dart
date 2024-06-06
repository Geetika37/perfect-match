
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/utils/common_helper.dart';
import 'package:perfectmatch/utils/image_helper.dart';

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
