import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/profilescreen/view/profile5_screen.dart';
import 'package:perfectmatch/screens/profilescreen/widgets/check_list_only_one.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/utils/common_helper.dart';

class Profile4Screen extends StatefulWidget {
  const Profile4Screen({super.key});

  @override
  State<Profile4Screen> createState() => _Profile4ScreenState();
}

class _Profile4ScreenState extends State<Profile4Screen> {
  // familyTypeList
  final List<String> familyTypeList = [
    'Nuclear',
    'Joint',
  ];
  int? selectedFamilyType;
  final List<bool> selectedFamilyTypeList = List.generate(2, (index) => false);

  // Number of Siblings
  final List<String> siblingsNumberList = [
    '1',
    '2',
    '3',
    '4',
    '5+',
  ];
  int? selectedSiblingsNumber;
  final List<bool> selectedSiblingsNumberList =
      List.generate(5, (index) => false);

  bool isValidSelection() {
    return selectedFamilyTypeList.contains(true) &&
        selectedSiblingsNumberList.contains(true);
  }

  void validationErorrMessage() {
    Get.snackbar(
      'Validation Error',
      'Please select Family Type and Sibiling.',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
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
                'Family Backgrounds',
                style: lexend(Colors.black, 22, FontWeight.w600),
              ),
              hSpace(20),
              Text(
                'Family Type',
                style: lexend(Colors.black, 14, FontWeight.w500),
              ),
              hSpace(10),
              SizedBox(
                height: screenHeight * 0.1,
                child: CheckListOnlyOne(
                  checkList: familyTypeList,
                  selected: selectedFamilyTypeList,
                  onChanged: (index, value) {
                    setState(() {
                      for (int i = 0; i < selectedFamilyTypeList.length; i++) {
                        selectedFamilyTypeList[i] = i == index;
                      }
                      selectedFamilyType = index;
                    });
                  },
                  crossAxisCount: 3,
                ),
              ),
              hSpace(20),
              Text(
                'Number of Siblings',
                style: lexend(Colors.black, 14, FontWeight.w500),
              ),
              hSpace(10),
              SizedBox(
                height: screenHeight * 0.5,
                child: CheckListOnlyOne(
                  checkList: siblingsNumberList,
                  selected: selectedSiblingsNumberList,
                  onChanged: (index, value) {
                    setState(() {
                      for (int i = 0;
                          i < selectedSiblingsNumberList.length;
                          i++) {
                        selectedSiblingsNumberList[i] = i == index;
                      }
                      selectedSiblingsNumber = index;
                    });
                  },
                  crossAxisCount: 1,
                ),
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Next',
                onTap: () {
                  if (isValidSelection()) {
                    Get.to(() => const Profile5Screen());
                  } else {
                    validationErorrMessage();
                  }
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
