import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/screens/profilescreen/screens/profile1_screen/views/profile1_screen.dart';
import 'package:perfectmatch/utils/common_helper.dart';

import '../../widget/buttons.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hSpace(10),
              BButton(
                onTap: () {
                  Get.back();
                },
              ),
              hSpace(35),
              const Text(
                'Enter Verification code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF121212),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              hSpace(5),
              const Text(
                'We have sent a one-time passcode to your number +918606387380',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0x99121212),
                  fontSize: 13,
                  height: 1.5,
                  letterSpacing: -0.05,
                ),
              ),
              hSpace(50),
              OtpTextField(
                numberOfFields: 4,
                fieldWidth: 55,
                fieldHeight: 55,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                filled: true,
                fillColor: AppColors.primaryLite.withOpacity(0.8),
                focusedBorderColor: AppColors.primaryLite,
                borderRadius: const BorderRadius.all(Radius.circular(60)),
                borderWidth: 1,
                autoFocus: true,
                cursorColor: AppColors.primaryLite,
                contentPadding: const EdgeInsets.all(16),
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Resent it 00:30s"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
              hSpace(15),
              Center(
                child: DualtoneButton(
                  text1: 'Resent otp in ',
                  text2: '00:30s',
                  onTap: () {},
                ),
              ),
              hSpace(50),
              PrimaryButton(
                text: 'Verify',
                onTap: () {
                  Get.to(() => const Profile1Screen());
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
