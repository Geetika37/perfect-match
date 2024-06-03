import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/search/views/widgets/custom_bottomsheet_caste.dart';
import 'package:perfectmatch/screens/search/views/widgets/custom_bottomsheet_religion.dart';
import 'package:perfectmatch/screens/search/views/widgets/custom_slider.dart';
import 'package:perfectmatch/screens/search/views/widgets/custom_textfield.dart';
import 'package:perfectmatch/screens/search/views/widgets/outlined_button.dart';
import 'package:perfectmatch/screens/search/views/widgets/textfield_search.dart';
import 'package:perfectmatch/screens/widget/custom_appbar.dart';
import 'package:perfectmatch/utils/image_helper.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(height: screenHeight * 0.02);
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F6),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
        child: CustomAppBar(
          onPressed: () {
            HapticFeedback.heavyImpact();
            Get.back();
          },
          text: 'Search',
          iconColor: Colors.black,
          backgroundColor: const Color(0xffF4F4F6),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFieldSearch(
                color: const Color.fromARGB(255, 255, 255, 255),
                iconImage: Image.asset(getAssetImage('search')),
                text: 'Enter profile ID here',
                height: screenHeight * 0.06,
                width: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.02),
              // TextField(
              //   decoration: InputDecoration(
              //     prefixIcon: const Icon(
              //       Icons.search,
              //       size: 30,
              //       color: Colors.grey,
              //     ),
              //     hintText: 'Enter profile ID here',
              //     hintStyle: lexend(
              //       const Color(0xff000000),
              //       12,
              //       FontWeight.w300,
              //     ),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(14),
              //     ),
              //     filled: true,
              //     fillColor: const Color.fromARGB(255, 255, 255, 255),
              //     contentPadding: const EdgeInsets.symmetric(
              //         vertical: 10.0, horizontal: 20.0),
              //   ),
              // ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  ButtonNormal(
                    textSize: 15,
                    fontWeight: FontWeight.w500,
                    radius: 10,
                    height: screenHeight * 0.058,
                    width: screenWidth * 0.43,
                    text: 'Search',
                    onTap: () {
                      HapticFeedback.heavyImpact();
                    },
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  ButtonOutlined(
                    height: screenHeight * 0.058,
                    width: screenWidth * 0.43,
                    text: 'Saved',
                    onTap: () {
                      HapticFeedback.heavyImpact();
                    },
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              const FieldTitle(
                title: 'Location',
              ),
              SizedBox(height: screenHeight * 0.02),
              const LocationRow(),
              SizedBox(height: screenHeight * 0.02),
              const FieldTitle(title: 'Age'),
              Text(
                '18 years - 28 years',
                style: lexend(Colors.black, 10, FontWeight.w400),
              ),
              const CustomSlider(),
              SizedBox(height: screenHeight * 0.01),
              const FieldTitle(title: 'Income'),
              Text(
                '₹15000 - ₹30000',
                style: lexend(Colors.black, 10, FontWeight.w400),
              ),
              const CustomSlider(),
              SizedBox(height: screenHeight * 0.01),
              CustomTextField(
                text: 'Religions',
                onTap: () {
                  HapticFeedback.mediumImpact();
                  _showBottomSheetReligion(context);
                },
              ),
              sizedBox,
              CustomTextField(
                text: 'Caste',
                onTap: () {
                  HapticFeedback.mediumImpact();
                  _showBottomSheetCaste(context);
                },
              ),
              sizedBox,
              CustomTextField(
                text: 'Education',
                onTap: () {
                  HapticFeedback.mediumImpact();
                  _showBottomSheetReligionOneChecked(context);
                },
              ),
              sizedBox,
              CustomTextField(
                text: 'Family Type',
                onTap: () {
                  HapticFeedback.mediumImpact();
                  _showBottomSheetReligion(context);
                },
              ),
              sizedBox,
              CustomTextField(
                text: 'Profession',
                onTap: () {
                  HapticFeedback.mediumImpact();
                  _showBottomSheetReligion(context);
                },
              ),
              sizedBox,
              CustomTextField(
                text: 'Interests',
                onTap: () {
                  HapticFeedback.mediumImpact();
                  _showBottomSheetReligion(context);
                },
              ),
              sizedBox,
              CustomTextField(
                text: 'Hobbies',
                onTap: () {
                  HapticFeedback.mediumImpact();
                  _showBottomSheetReligion(context);
                },
              ),
              sizedBox,
              ButtonNormal(
                textSize: 15,
                fontWeight: FontWeight.w500,
                radius: 10,
                height: screenHeight * 0.06,
                width: screenWidth,
                text: 'Apply',
                onTap: () {
                  HapticFeedback.heavyImpact();
                },
              ),
              sizedBox,
            ],
          ),
        ),
      )),
    );
  }

  void _showBottomSheetReligion(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const CustomBottomSheet(),
    );
  }

  void _showBottomSheetCaste(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const CustomBottomSheetCaste(),
    );
  }

  void _showBottomSheetReligionOneChecked(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const CustomBottomSheetReligionOneSelected(),
    );
  }
}

class FieldTitle extends StatelessWidget {
  const FieldTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: lexend(Colors.black, 12, FontWeight.w400),
      ),
    );
  }
}

class LocationRow extends StatelessWidget {
  const LocationRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextFieldSearch(
          color: const Color.fromARGB(255, 255, 255, 255),
          iconImage: Image.asset(getAssetImage('location')),
          text: 'location',
          height: screenHeight * 0.06,
          width: screenWidth * 0.65,
        ),
        SizedBox(width: screenWidth * 0.05),
        ButtonNormal(
          textSize: 15,
          fontWeight: FontWeight.w500,
          radius: 10,
          height: screenHeight * 0.058,
          width: screenWidth * 0.2,
          text: 'Go',
          onTap: () {
            HapticFeedback.heavyImpact();
          },
        )
      ],
    );
  }
}

class ButtonNormal extends StatelessWidget {
  const ButtonNormal({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.onTap,
    this.gradient,
    required this.radius,
    this.iconOrImage,
    required this.textSize,
    required this.fontWeight,
  });
  final double height;
  final double width;
  final String text;
  final Function() onTap;
  final Widget? iconOrImage;
  final Gradient? gradient;
  final double radius, textSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: gradient ??
              const LinearGradient(
                colors: [
                  Color(0xFFEF5D89),
                  Color(0xFFF588A5),
                  Color(0xFFFAAFBE),
                  Color(0xFFFDD7E4),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: iconOrImage != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconOrImage!,
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  Text(
                    text,
                    style: lexend(Colors.white, textSize, fontWeight),
                  )
                ],
              )
            : Center(
                child: Text(
                  text,
                  style: lexend(Colors.white, textSize, fontWeight),
                ),
              ),
      ),
    );
  }
}
