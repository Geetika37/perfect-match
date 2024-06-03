import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';


class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({
    super.key,
    required this.color,
    required this.iconImage,
    required this.text,
    required this.height,
    required this.width,
  });
  final Color color;
  final Image iconImage;
  final String text;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.heavyImpact();
      },
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: const Color(0xff666666),
            width: 0.2,
          ),
        ),
        child: Center(
          child: Row(
            children: [
              iconImage,
              SizedBox(
                width: screenWidth * 0.03,
              ),
              Text(
                text,
                style: lexend(const Color(0xff000000), 12, FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
