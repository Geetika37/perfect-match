import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/screens/signupscreen/view/screens/profile1_screen.dart';
import 'package:perfectmatch/screens/signupscreen/view/signup_screen.dart';
import 'package:perfectmatch/screens/splashscreen/view/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      FlutterNativeSplash.remove();
    });

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'Lexend',
        fontFamily: GoogleFonts.lexend().fontFamily,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.trans,
        ),
      ),
      title: 'Perfect Match',
      // home: const Profile1Screen(),
      // home: SplashScreen(),
      home: SignupScreen(),
    );
  }
}
