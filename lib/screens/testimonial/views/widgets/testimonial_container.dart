import 'package:flutter/material.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/utils/image_helper.dart';


class TestimonialImageContainer extends StatelessWidget {
  const TestimonialImageContainer({
    super.key, required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(getAssetImage(image)),
      Positioned(
          top: 120,
          left: 25,
          child: Column(
            children: [
              Text(
                'Pure Joy',
                style: lobsterTwo(const Color(0xffFDDE55), 80, FontWeight.w700),
              ),
              Text(
                "Emma and John's",
                style: lexend(const Color(0xffFFFFFF), 20, FontWeight.w400),
              ),
              Text(
                "Perfect Match",
                style: lexend(const Color(0xffFDDE55), 20, FontWeight.w400),
              ),
            ],
          ))
    ]);
  }
}
