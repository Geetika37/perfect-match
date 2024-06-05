import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/screens/loginscreen/view/login_screen.dart';
import 'package:perfectmatch/screens/otpscreen/view/otp_screen.dart';
import 'package:perfectmatch/utils/common_helper.dart';
import '../../../utils/image_helper.dart';
import '../../widget/buttons.dart';
import '../../widget/input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameInput = TextEditingController();
  TextEditingController emailMobileInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = getDeviceHeight(context);

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Container(
          padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
          height: deviceHeight,
          child: Stack(
            children: [
              Column(
                children: [
                  hSpace(50),
                  Center(
                    child: Image.asset(
                      getAssetImage('login_logo'),
                      width: 240,
                    ),
                  ),
                  hSpace(15),
                  const Text(
                    'Join Now to Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF121212),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 const Text(
                    'Create your account and start your journey with us today!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0x99121212),
                      fontSize: 11,
                      letterSpacing: -0.05,
                    ),
                  ),
                  hSpace(25),
                  InputText(
                    title: '',
                    hint: 'Name',
                    textController: nameInput,
                    keyboardType: TextInputType.text,
                    onChanged: (String) {},
                    validator: (String) {},
                  ),
                  hSpace(20),
                  InputText(
                    onChanged: (String) {},
                    validator: (String) {},
                    title: '',
                    hint: 'Email or Phone',
                    textController: emailMobileInput,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  hSpace(25),
                  PrimaryButton(
                    text: 'Continue',
                    onTap: () {
                      Get.to(() => OtpScreen());
                    },
                  ),
                  hSpace(15),
                  const Text(
                    "Or Sign up with",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  hSpace(20),
                  Row(
                    children: [
                      Expanded(
                        child: SocialButton(
                            text: "Google",
                            image: "logos_google",
                            onTap: () {}),
                      ),
                      wSpace(10),
                      Expanded(
                        child: SocialButton(
                            text: "Facebook",
                            image: "logos_facebook",
                            onTap: () {}),
                      ),
                    ],
                  ),
                  hSpace(15),
                  DualtoneButton(
                    text1: 'Already have an account? ',
                    text2: 'Login',
                    onTap: () {
                      Get.off(() => LoginScreen());
                    },
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: DualtoneButton(
                  textSize: 12,
                  text1: 'By continuing, you agree to Perfect match’s ',
                  text2: 'Terms of Service, Privacy Policy',
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
