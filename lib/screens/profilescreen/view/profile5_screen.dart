import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/mainscreen/view/main_screen.dart';
import 'package:perfectmatch/screens/profilescreen/widgets/check_list.dart';
import 'package:perfectmatch/screens/profilescreen/widgets/check_list_only_one.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/utils/common_helper.dart';


class Profile5Screen extends StatefulWidget {
  const Profile5Screen({super.key});

  @override
  State<Profile5Screen> createState() => _Profile5ScreenState();
}

class _Profile5ScreenState extends State<Profile5Screen> {
  // preferred family background
  final List<String> familyBackgroundList = [
    'Nuclear',
    'Joint',
    'No Preference',
  ];
  int? selectedfamilyBackground;
  final List<bool> selectedfamilyBackgroundList =
      List.generate(3, (index) => false);

  // preferred Number of Siblings
  final List<String> siblingsNumberList = [
    '1',
    '2',
    'No Preference',
  ];
  int? selectedsiblingsNumber;
  final List<bool> selectedsiblingsNumberList =
      List.generate(3, (index) => false);

  //Preferred Profession

  final List<String> professionList = [
    'IT/software',
    'Education/Teaching',
    'Healthcare/Medicine',
    'Engineering',
    'Art/Entertainment',
    'Self Employed',
    'Business/Management',
    'Finance/Accounting',
    'No Preference',
  ];

  final List<bool> selectedprofession = List.generate(9, (index) => false);

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
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Partner Preferences',
                style: lexend(Colors.black, 22, FontWeight.w600),
              ),
              hSpace(20),
              Text(
                'Preferred Family Background ',
                style: lexend(Colors.black, 14, FontWeight.w500),
              ),
              SizedBox(
                height: screenHeight * 0.1,
                child: CheckListOnlyOne(
                  checkList: familyBackgroundList,
                  selected: selectedfamilyBackgroundList,
                  onChanged: (index, value) {
                    setState(() {
                      for (int i = 0;
                          i < selectedfamilyBackgroundList.length;
                          i++) {
                        selectedfamilyBackgroundList[i] = i == index;
                      }
                      selectedfamilyBackground = index;
                    });
                  },
                  crossAxisCount: 3,
                ),
              ),
              Text(
                'Preferred Number of Siblings',
                style: lexend(Colors.black, 14, FontWeight.w500),
              ),
              SizedBox(
                height: screenHeight * 0.1,
                child: CheckListOnlyOne(
                  checkList: siblingsNumberList,
                  selected: selectedsiblingsNumberList,
                  onChanged: (index, value) {
                    setState(() {
                      for (int i = 0;
                          i < selectedsiblingsNumberList.length;
                          i++) {
                        selectedsiblingsNumberList[i] = i == index;
                      }
                      selectedsiblingsNumber = index;
                    });
                  },
                  crossAxisCount: 3,
                ),
              ),
              Text(
                'Preferred Profession',
                style: lexend(Colors.black, 14, FontWeight.w500),
              ),
              hSpace(10),
              Expanded(
                child: CheckList(
                  checkList: professionList,
                  selected: selectedprofession,
                  onChanged: (index, value) {
                    setState(() {
                      selectedprofession[index] = value!;
                    });
                  },
                  crossAxisCount: 1,
                ),
              ),
              PrimaryButton(
                text: 'Next',
                onTap: () {
                  Get.to(() => const MainScreen());
                },
              ),
              hSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}
