import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/screens/splashscreen/controller/splash_controller.dart';

import '../../../utils/image_helper.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  final SplashController splashController = Get.put(SplashController());

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (context) {
          return Scaffold(
              backgroundColor: AppColors.primary,
              body: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF97263E).withOpacity(1), // #97263E
                      const Color(0xFFEF5D89).withOpacity(0.2), // #EF5D89
                    ],
                    center:
                        Alignment.center, // Center of the gradient (default)
                    radius:
                        4.0, // Full-size radius (covers the whole container)
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    getAssetImage('logo_down_text'),
                    width: 260,
                  ),
                ),
              ));
        });
  }
}
