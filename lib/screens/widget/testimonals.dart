import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/screens/testimonial/views/testimonial.dart';
import 'package:perfectmatch/utils/common_helper.dart';

import '../../constants/app_colors.dart';

class TestiBox extends StatelessWidget {
  const TestiBox({
    super.key,
    required this.imageUrl,
    required this.text,
  });

  final String imageUrl, text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => const Testimonial()),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(0),
                width: 65,
                height: 65,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: AppColors.primary.withOpacity(0.4)),
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(6)),
                child: Stack(
                  children: [
                    const Center(
                      child: Icon(
                        Icons.image,
                        color: AppColors.inputDullColor,
                      ),
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(imageUrl),
                      ),
                    )
                  ],
                )),
            hSpace(2),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
