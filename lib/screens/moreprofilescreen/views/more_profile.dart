import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/moreprofilescreen/models/setting_option_list.dart';
import 'package:perfectmatch/screens/moreprofilescreen/views/screens/manage_photos.dart';
import 'package:perfectmatch/screens/premiumplans/views/premium_plans.dart';
import 'package:perfectmatch/screens/userverification/views/user_verification.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/utils/common_helper.dart';
import 'package:perfectmatch/utils/image_helper.dart';

class MoreProfile extends StatefulWidget {
  const MoreProfile({super.key});

  @override
  State<MoreProfile> createState() => _MoreProfileState();
}

class _MoreProfileState extends State<MoreProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight * 0.38,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(getAssetImage('profileimage')),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                      ),
                      hSpace(screenHeight * 0.2),
                      Text(
                        'Abhilash Kumar',
                        style: lexend(Colors.white, 20, FontWeight.w600),
                      ),
                      Text(
                        'PM1256348',
                        style: lexend(Colors.white, 12, FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              hSpace(10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 10,
                  ),
                  // margin: const EdgeInsets.only(bottom: 100),
                  child: ListView.separated(
                    itemCount: settingsOptions.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 0,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        margin: settingsOptions.length == index + 1
                            ? EdgeInsets.only(bottom: 90)
                            : EdgeInsets.zero,
                        child: ListTile(
                          trailing: Image.asset(
                            getAssetImage(settingsOptions[index]['image']),
                            color: Colors.pink,
                          ),
                          title: Text(
                            settingsOptions[index]['text'],
                            style: lexend(Colors.black, 13, FontWeight.w600),
                          ),
                          onTap: () {
                            Get.to(() => const ManagePhotos());
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.356,
            left: 32,
            right: 32,
            child: Row(
              children: [
                ButtonNormal(
                  textSize: 10,
                  fontWeight: FontWeight.w400,
                  height: screenHeight * 0.045,
                  width: screenWidth * 0.4,
                  iconOrImage: Image.asset(getAssetImage('verified')),
                  text: 'Verify My Profile',
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    Get.to(UserVerification());
                  },
                  gradient: const LinearGradient(colors: [
                    Color(0xff1E90FF),
                    Color(0xff1E90FF),
                  ]),
                  radius: 5,
                ),
                wSpace(10),
                ButtonNormal(
                  textSize: 10,
                  fontWeight: FontWeight.w400,
                  height: screenHeight * 0.045,
                  width: screenWidth * 0.4,
                  iconOrImage: Image.asset(getAssetImage('starpremium')),
                  text: 'Upgrade to Premium',
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    Get.to(const PremiumPlans());
                  },
                  gradient: const LinearGradient(colors: [
                    Color(0xffF588A5),
                    Color(0xffF05E87),
                  ]),
                  radius: 5,
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
