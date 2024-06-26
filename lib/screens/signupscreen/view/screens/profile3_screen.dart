import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/signupscreen/widgets/hobbieslist.dart';
import 'package:perfectmatch/screens/signupscreen/widgets/interestlist.dart';
import 'package:perfectmatch/screens/signupscreen/view/screens/profile4_screen.dart';
import 'package:perfectmatch/screens/signupscreen/widgets/check_list.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/screens/widget/snackbar.dart';
import 'package:perfectmatch/utils/common_helper.dart';
import 'package:perfectmatch/screens/signupscreen/controllers/controller.dart'; // Ensure the correct import for the controller

class Profile3Screen extends StatefulWidget {
  const Profile3Screen({super.key});

  @override
  State<Profile3Screen> createState() => _Profile3ScreenState();
}

class _Profile3ScreenState extends State<Profile3Screen> {
  final RegisterController registerController = Get.put(RegisterController());
  final TextEditingController otherHobbyController = TextEditingController();
  final TextEditingController otherInterestController = TextEditingController();

  bool isValidSelection() {
    return registerController.hobbiesController.value.isNotEmpty &&
        registerController.interestController.value.isNotEmpty;
  }

  void validationErrorMessage() {
    showErrorMessage(context,
        message: 'Please select at least one hobby and one interest.');
  }

  void updateSelectedHobbiesAndInterests() {
    registerController.hobbiesController.value = hobbiesList
        .where((hobby) =>
            registerController.hobbiesController.value.contains(hobby))
        .join(',');

    registerController.interestController.value = interestList
        .where((interest) =>
            registerController.interestController.value.contains(interest))
        .join(',');
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
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                    SizedBox(
                      height: screenHeight * 0.2,
                      child: CheckList(
                        checkList: hobbiesList,
                        selected: List<bool>.generate(
                            hobbiesList.length,
                            (index) => registerController
                                .hobbiesController.value
                                .split(',')
                                .contains(hobbiesList[index])),
                        onChanged: (index, value) {
                          setState(() {
                            var selectedHobbies = registerController
                                .hobbiesController.value
                                .split(',');
                            if (value == true) {
                              selectedHobbies.add(hobbiesList[index]);
                            } else {
                              selectedHobbies.remove(hobbiesList[index]);
                            }
                            registerController.hobbiesController.value =
                                selectedHobbies.join(',');
                          });
                        },
                        crossAxisCount: 3,
                      ),
                    ),
                    if (registerController.hobbiesController.value
                        .split(',')
                        .contains('Other'))
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          controller: otherHobbyController,
                          decoration: InputDecoration(
                            hintText: 'Enter Hobbies',
                            hintStyle: lexend(
                              const Color(0xff000000),
                              12,
                              FontWeight.w300,
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xff666666),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xff666666),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xff666666),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xff666666),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    hSpace(20),
                    Text(
                      'Interests ',
                      style: lexend(Colors.black, 14, FontWeight.w500),
                    ),
                    SizedBox(
                      height: screenHeight * 0.2,
                      child: CheckList(
                        checkList: interestList,
                        selected: List<bool>.generate(
                            interestList.length,
                            (index) => registerController
                                .interestController.value
                                .split(',')
                                .contains(interestList[index])),
                        onChanged: (index, value) {
                          setState(() {
                            var selectedInterests = registerController
                                .interestController.value
                                .split(',');
                            if (value == true) {
                              selectedInterests.add(interestList[index]);
                            } else {
                              selectedInterests.remove(interestList[index]);
                            }
                            registerController.interestController.value =
                                selectedInterests.join(',');
                          });
                        },
                        crossAxisCount: 3,
                      ),
                    ),
                    if (registerController.interestController.value
                        .split(',')
                        .contains('Other'))
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          controller: otherInterestController,
                          decoration: InputDecoration(
                            hintText: 'Enter Interests',
                            hintStyle: lexend(
                              const Color(0xff000000),
                              12,
                              FontWeight.w300,
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xff666666),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xff666666),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xff666666),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xff666666),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: PrimaryButton(
                text: 'Next',
                onTap: () {
                  if (isValidSelection()) {
                    updateSelectedHobbiesAndInterests();
                    Get.to(const Profile4Screen());
                  } else {
                    validationErrorMessage();
                  }
                },
              ),
            ),
            hSpace(10),
          ],
        ),
      ),
    );
  }
}
