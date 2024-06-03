import 'package:get/get.dart';
import 'package:perfectmatch/screens/onboardingscreen/view/onboarding_screen.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    navigateToLogin();
    super.onReady();
  }

  Future navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.to(() => const OnBoardingScreen());
  }
}
