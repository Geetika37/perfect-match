// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/screens/loginscreen/view/login_screen.dart';
import 'package:perfectmatch/utils/image_helper.dart';
import '../../../utils/common_helper.dart';
import '../../widget/buttons.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.secondary,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 260),
                child: Image.asset(
                  getAssetImage('onboard_image'),
                  width: double.infinity,
                  fit: BoxFit.fill,
                )),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              width: double.infinity,
              height: 280,
              decoration: const ShapeDecoration(
                color: Color(0xFFF4F4F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Find the One Who Completes You',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF121212),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  hSpace(5),
                  const Text(
                    'Focuses on the idea of finding a soulmate, someone who perfectly complements the user.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xCC121212),
                        fontSize: 14,
                        height: 1.2,
                        fontWeight: FontWeight.w300),
                  ),
                  hSpace(30),
                  PrimaryButton(
                    width: 250,
                    text: 'Get Started',
                    onTap: () {
                      Get.off(() => LoginScreen());
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
