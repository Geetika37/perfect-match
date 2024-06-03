import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/screens/premiumplans/views/premium_plans.dart';
import 'package:perfectmatch/screens/profilescreen/view/profile_details.dart';
import 'package:perfectmatch/screens/search/views/search_page.dart';
import 'package:perfectmatch/utils/common_helper.dart';
import 'package:perfectmatch/utils/image_helper.dart';

import 'package:remixicon/remixicon.dart';

import '../../../widget/Testimonals.dart';
import '../../../widget/buttons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                hSpace(10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      getAssetImage('long_logo'),
                      width: 105,
                      color: AppColors.primary,
                    ),
                    const Expanded(child: SizedBox()),
                    const Icon(
                      Icons.notifications,
                      size: 26,
                      color: AppColors.primaryLite,
                    ),
                    wSpace(10),
                    MyIconButton(
                      onTap: () {
                        Get.to(const SearchPage());
                      },
                      text: 'Search',
                      icon: Remix.search_2_line,
                      width: 110,
                    )
                  ],
                ),
                hSpace(12),
                const Text(
                  "Testimonials",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                hSpace(6),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return TestiBox(
                        imageUrl:
                            'https://picsum.photos/200?random=1${index + 1}',
                        text: 'Pure joy- $index',
                      );
                    },
                  ),
                ),
                hSpace(5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: PrimaryButton(
                            onTap: () {},
                            text: 'Prospects',
                            textSize: 14,
                            height: 45)),
                    wSpace(10),
                    Expanded(
                        child: SocialButton(
                      text: "Upgrade to Premium",
                      image: 'star',
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        Get.to(const PremiumPlans());
                      },
                      textSize: 12,
                      height: 45,
                    ))
                  ],
                ),
                hSpace(15),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1,
                          color: const Color(0x7FF05E87).withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Complete your profile",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      hSpace(2),
                      const Text(
                        "Please provide the necessary details to help us match you with compatible partners.",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            height: 1.2),
                      ),
                      hSpace(10),
                      Row(
                        children: [
                          Expanded(
                              child: UpdateButton(
                            text: 'Upload',
                            icon: Remix.image_2_fill,
                            onTap: () {},
                            textSize: 11,
                            text2: 'Profile Photo',
                          )),
                          wSpace(8),
                          Expanded(
                              child: UpdateButton(
                            text: 'Edit',
                            icon: Remix.edit_2_fill,
                            isComplete: true,
                            onTap: () {},
                            textSize: 11,
                            text2: 'Personal Details',
                          )),
                          wSpace(8),
                          Expanded(
                              child: UpdateButton(
                            text: 'Manage',
                            icon: Remix.settings_2_fill,
                            onTap: () {},
                            textSize: 11,
                            text2: 'Partner Preference',
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                hSpace(10),
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      int id = index + 1;
                      return ProfilesCard(
                        onTap: () {
                          Get.to(const ProfileDetails());
                        },
                        id: id,
                        name: 'Exampe Name',
                        age: '20',
                        pmId: 'PM38879',
                        job: 'Software Engineer',
                        place: 'Thrissur, Kerala',
                        image: 'https://picsum.photos/335/433?random=$id',
                      );
                    },
                  ),
                ),
                hSpace(100)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilesCard extends StatelessWidget {
  const ProfilesCard({
    super.key,
    required this.id,
    required this.name,
    required this.age,
    required this.pmId,
    required this.job,
    required this.place,
    required this.image,
    required this.onTap,
  });

  final String name, age, pmId, job, place, image;
  final int id;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(10),
        height: 450,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2)),
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 250,
                padding: const EdgeInsets.only(
                    top: 110, bottom: 10, left: 20, right: 20),
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.00, -1.00),
                    end: const Alignment(0, 1),
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(1)
                    ],
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name($age)',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                    hSpace(3),
                    Text(
                      pmId,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 11,
                        fontFamily: 'Lexend',
                        height: 0,
                      ),
                    ),
                    hSpace(2),
                    Row(
                      children: [
                        const Icon(
                          Remix.suitcase_2_fill,
                          size: 10,
                          color: Colors.white,
                        ),
                        wSpace(4),
                        Text(
                          job,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    hSpace(1),
                    Row(
                      children: [
                        const Icon(
                          Remix.map_pin_2_fill,
                          size: 10,
                          color: Colors.white,
                        ),
                        wSpace(4),
                        Text(
                          place,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    hSpace(12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundButton(
                          icon: Remix.close_fill,
                          onTap: () {},
                        ),
                        RoundButton(
                          icon: Remix.chat_1_fill,
                          onTap: () {},
                        ),
                        RoundButton(
                          icon: Remix.star_smile_fill,
                          onTap: () {},
                        ),
                        RoundButton(
                          icon: Remix.heart_add_2_fill,
                          onTap: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
