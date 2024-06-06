import 'package:flutter/material.dart';
import 'package:perfectmatch/utils/image_helper.dart';

class UnSelectedGenderContainer extends StatelessWidget {
  const UnSelectedGenderContainer({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xffF588A5),
        ),
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Image.asset(getAssetImage(image)),
      ),
    );
  }
}