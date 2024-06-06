import 'package:flutter/material.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';


class ButtonOutlined extends StatelessWidget {
  const ButtonOutlined({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight * 0.058,
        width: screenWidth * 0.43,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: const Color(0xFFEF5D89),
              width: 2,
            )),
        child: Center(
            child: Text(
          'Saved',
          style:
              lexend(const Color.fromARGB(255, 0, 0, 0), 14, FontWeight.w400),
        )));
  }
}
