import 'package:flutter/material.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';

class ButtonOutlined extends StatelessWidget {
  const ButtonOutlined({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.onTap,
  });
  final double height;
  final double width;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: const Color(0xFFEF5D89),
                width: 2,
              )),
          child: Center(
              child: Text(
            text,
            style:
                lexend(const Color.fromARGB(255, 0, 0, 0), 14, FontWeight.w400),
          ))),
    );
  }
}
