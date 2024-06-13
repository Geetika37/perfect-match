import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/premiumplans/widgets/premium_purschase_container.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/screens/widget/custom_appbar.dart';


class PremiumPlans extends StatelessWidget {
  const PremiumPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
        child: CustomAppBar(
          onPressed: () {
            HapticFeedback.heavyImpact();
            Get.back();
          },
          text: '',
          iconColor: const Color(0xffFAAFBE),
          backgroundColor: Colors.black,
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(children: [
            Column(
              children: [
                Text(
                  'Upgrade to Premium',
                  style: lexend(const Color(0xffFAAFBE), 22, FontWeight.w600),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Text(
                  'Choose a subscription plan to unlock all the functionality of the application',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: lexend(const Color(0xffFAAFBE), 14, FontWeight.w400),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                const PremiumPurchaseContainer(),
              ],
            ),
            Positioned(
                bottom: 0,
                child: Column(
                  children: [
                    ButtonNormal(
                      textSize: 15,
                      fontWeight: FontWeight.w500,
                      radius: 10,
                      height: screenHeight * 0.06,
                      width: screenWidth * 0.94,
                      text: 'Purchase',
                      onTap: () {
                        HapticFeedback.heavyImpact();
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          'Restore Purchase. ',
                          style: lexend(
                              const Color.fromARGB(255, 163, 162, 162),
                              10,
                              FontWeight.w400),
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        InkWell(
                          onTap: () {
                            HapticFeedback.heavyImpact();
                          },
                          child: const Text(
                            'Terms of Service, Privacy Policy',
                            style: TextStyle(
                              color: Color(0xffF05E87),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xffF05E87),
                              decorationThickness: 2.0,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ))
          ]),
        ),
      )),
    );
  }
}
