import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/signupscreen/widgets/selectedgender.dart';
import 'package:perfectmatch/screens/signupscreen/widgets/unselectedgender.dart';
import 'package:perfectmatch/screens/signupscreen/view/screens/profile3_screen.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/utils/common_helper.dart';
import 'package:perfectmatch/screens/signupscreen/controllers/controller.dart'; // Ensure the correct import for the controller

class Profile2Screen extends StatefulWidget {
  const Profile2Screen({super.key});

  @override
  State<Profile2Screen> createState() => _Profile2ScreenState();
}

class _Profile2ScreenState extends State<Profile2Screen> {
  final RegisterController registerController = Get.put(RegisterController());
  RxBool isSelected = false.obs;

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
          padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
          child: Form(
            key: GlobalKey<FormState>(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Your Gender',
                  style: lexend(Colors.black, 22, FontWeight.w600),
                ),
                Text(
                  'Please select your gender',
                  style: lexend(Colors.black, 12, FontWeight.w400),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            HapticFeedback.heavyImpact();
                            registerController.genderController.value =
                                'female';
                          },
                          child: Obx(
                            () => registerController.genderController.value ==
                                    'female'
                                ? const SelectedGenderContainer(image: 'female')
                                : const UnSelectedGenderContainer(
                                    image: 'female'),
                          ),
                        ),
                        hSpace(10),
                        Text(
                          'Female',
                          style: lexend(Colors.black, 12, FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            HapticFeedback.heavyImpact();
                            registerController.genderController.value = 'male';
                          },
                          child: Obx(
                            () => registerController.genderController.value ==
                                    'male'
                                ? const SelectedGenderContainer(image: 'male')
                                : const UnSelectedGenderContainer(
                                    image: 'male'),
                          ),
                        ),
                        hSpace(10),
                        Text(
                          'Male',
                          style: lexend(Colors.black, 12, FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                Obx(
                  () => isSelected.value
                      ? Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(
                            'Please select your gender',
                            style: lexend(
                                const Color.fromARGB(255, 186, 34, 23),
                                12,
                                FontWeight.w400),
                          ),
                        )
                      : const SizedBox(),
                ),
                const Spacer(),
                PrimaryButton(
                  text: 'Next',
                  onTap: () {
                    if (registerController.genderController.value.isNotEmpty) {
                      Get.to(const Profile3Screen());
                    } else {
                      isSelected.value = true;
                    }
                  },
                ),
                hSpace(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
