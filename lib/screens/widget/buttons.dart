import 'package:flutter/material.dart';
import 'package:perfectmatch/utils/common_helper.dart';
import 'package:perfectmatch/utils/image_helper.dart';

import 'package:remixicon/remixicon.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import '../../../constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.width = double.infinity,
    required this.text,
    required this.onTap,
    this.textSize = 17,
    this.height = 56,
  });

  final double width, textSize, height;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-1, 0.05),
            end: Alignment(1.00, -0.05),
            colors: [Color(0xFFEF5D89), Color(0xFFF487A4), Color(0xFFFAAFBE)],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1, color: const Color(0x7FF05E87).withOpacity(0.1)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: textSize,
            height: 0.08,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.41,
          ),
        ),
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    this.width = double.infinity,
    required this.text,
    required this.icon,
    required this.onTap,
    this.height = 35,
  });

  final double width, height;
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-1, 0.05),
            end: Alignment(1.00, -0.05),
            colors: [Color(0xFFEF5D89), Color(0xFFF487A4), Color(0xFFFAAFBE)],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1, color: const Color(0x7FF05E87).withOpacity(0.1)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            wSpace(5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                height: 0.08,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.41,
              ),
            ),
            wSpace(5),
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    this.width = double.infinity,
    required this.text,
    required this.image,
    this.textSize = 14,
    this.height = 50,
    required this.onTap,
  });

  final double width, textSize, height;
  final String text, image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1, color: const Color(0x7FF05E87).withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              getAssetImage(image),
              width: 20,
              height: 20,
            ),
            wSpace(5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: textSize,
                height: 0.08,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.41,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(55)),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 21),
            ),
          )),
    );
  }
}

class DualtoneButton extends StatelessWidget {
  const DualtoneButton({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
    this.textSize = 14,
  });

  final String text1, text2;
  final VoidCallback onTap;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: text1,
                style: TextStyle(
                  color: const Color(0x99121212),
                  fontSize: textSize,
                  letterSpacing: -0.05,
                ),
              ),
              TextSpan(
                text: text2,
                style: TextStyle(
                  color: const Color(0xFFF05E87),
                  fontSize: textSize,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.05,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class BButton extends StatelessWidget {
  const BButton({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(55)),
          child: Center(
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 21),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                )
              ],
            ),
          )),
    );
  }
}

class SmallButton extends StatelessWidget {
  const SmallButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
        decoration: BoxDecoration(
            border: Border.all(width: 0, color: AppColors.inputDullColor),
            color: AppColors.primary.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
        ),
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    super.key,
    this.width = double.infinity,
    required this.text,
    required this.text2,
    required this.icon,
    required this.onTap,
    this.height = 32,
    this.isComplete = false,
    this.textSize = 14,
  });

  final double width, height, textSize;
  final String text, text2;
  final IconData icon;
  final VoidCallback onTap;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text2,
          style: const TextStyle(
              fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        hSpace(5),
        TouchableOpacity(
          activeOpacity: isComplete ? 1 : 0.5,
          onTap: isComplete ? null : onTap,
          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: ShapeDecoration(
              gradient: isComplete
                  ? const LinearGradient(
                      begin: Alignment(-1, 0.05),
                      end: Alignment(1.00, -0.05),
                      colors: [
                        Color(0xFF139500),
                        Color(0xFF279F00),
                        Color(0xFF05AA00)
                      ],
                    )
                  : const LinearGradient(
                      begin: Alignment(-1, 0.05),
                      end: Alignment(1.00, -0.05),
                      colors: [
                        Color(0xFFEF5D89),
                        Color(0xFFF487A4),
                        Color(0xFFFAAFBE)
                      ],
                    ),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: const Color(0x7FF05E87).withOpacity(0.1)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: isComplete
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Remix.check_double_fill,
                        color: Colors.white,
                        size: 14,
                      ),
                      wSpace(2),
                      const Text(
                        "Completed",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          height: 1.3,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.41,
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: Colors.white,
                        size: 16,
                      ),
                      wSpace(3),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: textSize,
                          height: 1.3,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.41,
                        ),
                      ),
                      wSpace(5),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    this.width = 48,
    required this.icon,
    required this.onTap,
    this.height = 48,
  });

  final double width, height;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-1, 0.05),
            end: Alignment(1.00, -0.05),
            colors: [Color(0xFFEF5D89), Color(0xFFF487A4), Color(0xFFFAAFBE)],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1, color: const Color(0x7FF05E87).withOpacity(0.1)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }
}
