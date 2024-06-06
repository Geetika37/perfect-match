import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/profilescreen/screens/profile3_screen/views/profile3_screen.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/utils/common_helper.dart';
import 'package:perfectmatch/utils/image_helper.dart';

class Profile2Screen extends StatefulWidget {
  const Profile2Screen({super.key});

  @override
  State<Profile2Screen> createState() => _Profile2ScreenState();
}

class _Profile2ScreenState extends State<Profile2Screen> {
  var onPressed1 = false;
  var onPressed2 = false;
  RxBool isSelected = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          key: formKey,
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
                          setState(() {
                            onPressed1 = !onPressed1;
                            onPressed2 = false;
                          });
                        },
                        child: onPressed1
                            ? const SelectedGenderContainer(
                                image: 'female',
                              )
                            : const UnSelectedGenderContainer(
                                image: 'female',
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
                          setState(() {
                            onPressed2 = !onPressed2;
                            onPressed1 = false;
                          });
                        },
                        child: onPressed2
                            ? const SelectedGenderContainer(
                                image: 'male',
                              )
                            : const UnSelectedGenderContainer(
                                image: 'male',
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
                          style: lexend(const Color.fromARGB(255, 186, 34, 23),
                              12, FontWeight.w400),
                        ),
                      )
                    : const SizedBox(),
              ),
              const Spacer(),
              PrimaryButton(
                  text: 'Next',
                  onTap: () {
                    if (onPressed1 || onPressed2) {
                      Get.to(const Profile3Screen());
                    } else {
                      isSelected.value = true;
                    }
                  }),
              hSpace(10),
            ],
          ),
        ),
      ),
    ));
  }
}

class UnSelectedGenderContainer extends StatelessWidget {
  const UnSelectedGenderContainer({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xffF588A5),
        ),
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Image.asset(getAssetImage(image)),
      ),
    );
  }
}

class SelectedGenderContainer extends StatelessWidget {
  const SelectedGenderContainer({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF588A5),
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Image.asset(getAssetImage(image)),
      ),
    );
  }
}
