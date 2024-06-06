
import 'package:flutter/material.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';

class ContainerUnSelected extends StatelessWidget {
  const ContainerUnSelected({
    super.key,
    required this.bgColor,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.plan,
    required this.textColor,
  });
  final Color bgColor;
  final Color textColor;

  final String title;
  final String subTitle;
  final String price;
  final String plan;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.13,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: lexend(textColor, 16, FontWeight.w600),
                        ),
                        Text(
                          subTitle,
                          style: lexend(textColor, 10, FontWeight.w400),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            price,
                            style: lexend(textColor, 14, FontWeight.w600),
                          ),
                          Text(
                            plan,
                            style: lexend(textColor, 8, FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
