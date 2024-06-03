import 'package:flutter/material.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    required this.iconColor,
    this.backgroundColor,
    required this.onPressed,
  });
  final String text;
  final Color iconColor;
  final Color? backgroundColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      toolbarHeight: screenHeight * 0.99,
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.arrow_back_ios,
          size: 18,
          color: iconColor,
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.17),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: lexend(
            Colors.black,
            14,
            FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
