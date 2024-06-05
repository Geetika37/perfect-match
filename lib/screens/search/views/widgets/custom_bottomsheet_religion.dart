import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/search/views/search_page.dart';
import 'package:perfectmatch/screens/search/views/widgets/outlined_button.dart';
import 'package:perfectmatch/screens/search/views/widgets/textfield_search.dart';
import 'package:perfectmatch/utils/image_helper.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final List<String> religions = [
    'Buddhism',
    'Christianity',
    'Hinduism',
    'Islam',
    'Jainism',
    'Judaism'
  ];
  int? selectedReligionIndex;
  final List<bool> selected = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: screenHeight * 0.04),
          // TextFieldSearch(
          //   color: const Color(0xffFFFFFF),
          //   iconImage: Image.asset(getAssetImage('search')),
          //   text: 'search',
          //   height: screenHeight * 0.06,
          //   width: screenWidth,
          // ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Image.asset(getAssetImage('search')),
              hintText: 'Search',
              hintStyle: lexend(
                const Color(0xff000000),
                12,
                FontWeight.w300,
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 255, 255, 255),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
          SizedBox(height: screenHeight * 0.02),
          _buildCheckboxList(),
          SizedBox(height: screenHeight * 0.02),
          Row(
            children: [
              ButtonOutlined(
                height: screenHeight * 0.058,
                width: screenWidth * 0.43,
                text: 'Back',
                onTap: () {
                  HapticFeedback.heavyImpact();
                  Get.back();
                },
              ),
              SizedBox(width: screenWidth * 0.05),
              ButtonNormal(
                textSize: 15,
                fontWeight: FontWeight.w500,
                radius: 10,
                height: screenHeight * 0.058,
                width: screenWidth * 0.43,
                text: 'Done',
                onTap: () {
                  HapticFeedback.heavyImpact();
                  Get.back();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxList() {
    return Column(
      children: List.generate(religions.length, (index) {
        return Row(
          children: [
            Checkbox(
              activeColor: Colors.pink,
              checkColor: const Color(0xffF4F4F6),
              value: selected[index],
              side: const BorderSide(color: Colors.pink),
              onChanged: (bool? value) {
                setState(() {
                  selected[index] = value!;
                });
              },
            ),
            Expanded(
              child: Text(
                religions[index],
                style: lexend(Colors.black, 14, FontWeight.w400),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class CustomBottomSheetReligionOneSelected extends StatefulWidget {
  const CustomBottomSheetReligionOneSelected({super.key});

  @override
  State<CustomBottomSheetReligionOneSelected> createState() =>
      _CustomBottomSheetReligionOneSelectedState();
}

class _CustomBottomSheetReligionOneSelectedState
    extends State<CustomBottomSheetReligionOneSelected> {
  final List<String> religions = [
    'Buddhism',
    'Christianity',
    'Hinduism',
    'Islam',
    'Jainism',
    'Judaism'
  ];
  int? selectedReligionIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: screenHeight * 0.04),
          // TextFieldSearch(
          //   color: const Color(0xffFFFFFF),
          //   iconImage: Image.asset(getAssetImage('search')),
          //   text: 'search',
          //   height: screenHeight * 0.06,
          //   width: screenWidth,
          // ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Image.asset(getAssetImage('search')),
              hintText: 'Search',
              hintStyle: lexend(
                const Color(0xff000000),
                12,
                FontWeight.w300,
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 255, 255, 255),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
          SizedBox(height: screenHeight * 0.02),
          _buildCheckboxList(),
          SizedBox(height: screenHeight * 0.02),
          Row(
            children: [
              ButtonOutlined(
                height: screenHeight * 0.058,
                width: screenWidth * 0.43,
                text: 'Back',
                onTap: () {
                  HapticFeedback.heavyImpact();
                  Get.back();
                },
              ),
              SizedBox(width: screenWidth * 0.05),
              ButtonNormal(
                textSize: 15,
                fontWeight: FontWeight.w500,
                radius: 10,
                height: screenHeight * 0.058,
                width: screenWidth * 0.43,
                text: 'Done',
                onTap: () {
                  HapticFeedback.heavyImpact();
                  Get.back();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxList() {
    return Column(
      children: List.generate(religions.length, (index) {
        return Row(
          children: [
            Checkbox(
              activeColor: Colors.pink,
              checkColor: const Color(0xffF4F4F6),
              value: selectedReligionIndex == index,
              side: const BorderSide(color: Colors.pink),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedReligionIndex = index;
                  } else {
                    selectedReligionIndex = null;
                  }
                });
              },
            ),
            Expanded(
              child: Text(
                religions[index],
                style: lexend(Colors.black, 14, FontWeight.w400),
              ),
            ),
          ],
        );
      }),
    );
  }
}
