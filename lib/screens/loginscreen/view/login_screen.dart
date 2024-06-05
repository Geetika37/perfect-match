import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/screens/otpscreen/view/otp_screen.dart';
import 'package:perfectmatch/screens/signupscreen/view/signup_screen.dart';
import 'package:perfectmatch/utils/common_helper.dart';
import '../../../utils/image_helper.dart';
import '../../widget/buttons.dart';
import '../../widget/input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailMobileKey = GlobalKey<FormFieldState>();

  final _emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  final _phoneRegex = r'^\d{10}$';

  TextEditingController emailMobileInput = TextEditingController();

  String? _emailMobileValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email or Phone cannot be empty';
    }
    if (!RegExp(_emailRegex).hasMatch(value) &&
        !RegExp(_phoneRegex).hasMatch(value)) {
      return 'Please enter valid Email or Phone';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = getDeviceHeight(context);

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
          height: deviceHeight,
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    hSpace(50),
                    Center(
                      child: Image.asset(
                        getAssetImage('login_logo'),
                        width: 300,
                      ),
                    ),
                    hSpace(15),
                    const Text(
                      'Login to Continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    hSpace(40),
                    InputText(
                      title: '',
                      hint: 'Email or Phone',
                      textController: emailMobileInput,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        doValidation(_emailMobileKey, null);
                      },
                      validator: _emailMobileValidation,
                    ),
                    hSpace(25),
                    PrimaryButton(
                      text: 'Continue',
                      onTap: () {
                        doValidation(null, _formKey);
                      },
                    ),
                    hSpace(25),
                    const Text(
                      "Or Login with",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    hSpace(25),
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
                      text1: 'Don’t have an account? ',
                      text2: 'Sign Up',
                      onTap: () {
                        Get.off(() => const SignupScreen());
                      },
                    )
                  ],
                ),
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

  void doValidation(
      GlobalKey<FormFieldState>? keyName, GlobalKey<FormState>? formKey) {
    if (formKey != null) {
      if (formKey.currentState?.validate() ?? false) {
        showSuccessMessage(context, message: 'Form Validated');
        Get.to(() => const OtpScreen());
      }
    } else if (keyName != null) {
      keyName.currentState?.validate();
    }
  }

  void showSuccessMessage(
    BuildContext context, {
    required String message,
  }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
