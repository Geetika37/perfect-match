import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/profilescreen/view/profile4_screen.dart';
import 'package:perfectmatch/screens/profilescreen/widgets/check_list.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/utils/common_helper.dart';

class Profile3Screen extends StatefulWidget {
  const Profile3Screen({super.key});

  @override
  State<Profile3Screen> createState() => _Profile3ScreenState();
}

class _Profile3ScreenState extends State<Profile3Screen> {
  final List<String> hobbiesList = [
    'Reading',
    'Dance',
    'Writing',
    'Traveling',
    'Cooking',
    'Sports',
    'music',
    'Gardening',
    'Arts and Crafts',
    'Other',
  ];

  final List<String> interestList = [
    'Technology',
    'Fasion',
    'Fitness',
    'Movies',
    'Photography',
    'Socializing',
    'Volunteering',
    'Outdoor Activities',
    'Other',
  ];

  final List<bool> selectedHobbies = List.generate(10, (index) => false);
  final List<bool> selectedInterest = List.generate(10, (index) => false);

  bool isValidSelection() {
    return selectedHobbies.contains(true) && selectedInterest.contains(true);
  }

  void validationErorrMessage() {
    Get.snackbar(
      'Validation Error',
      'Please select at least one hobby and one interest.',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: BButton(
            onTap: () {
              Get.back();
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hobbies and Interests',
              style: lexend(Colors.black, 22, FontWeight.w600),
            ),
            hSpace(20),
            Text(
              'Hobbies ',
              style: lexend(Colors.black, 14, FontWeight.w500),
            ),
            Expanded(
              child: CheckList(
                checkList: hobbiesList,
                selected: selectedHobbies,
                onChanged: (index, value) {
                  setState(() {
                    selectedHobbies[index] = value!;
                  });
                },
                crossAxisCount: 3,
              ),
            ),
            hSpace(20),
            Text(
              'Interests ',
              style: lexend(Colors.black, 14, FontWeight.w500),
            ),
            Expanded(
              child: CheckList(
                checkList: interestList,
                selected: selectedInterest,
                onChanged: (index, value) {
                  setState(() {
                    selectedInterest[index] = value!;
                  });
                },
                crossAxisCount: 3,
              ),
            ),
            const Spacer(),
            PrimaryButton(
                text: 'Next',
                onTap: () {
                  if (isValidSelection()) {
                    Get.to(const Profile4Screen());
                  } else {
                    validationErorrMessage();
                  }
                }),
            hSpace(10),
          ],
        ),
      ),
    ));
  }
}
