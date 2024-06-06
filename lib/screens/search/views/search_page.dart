import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/search/widgets/custom_bottomsheet_caste.dart';
import 'package:perfectmatch/screens/search/widgets/custom_bottomsheet_religion.dart';
import 'package:perfectmatch/screens/search/widgets/custom_slider.dart';
import 'package:perfectmatch/screens/search/widgets/custom_textfield.dart';
import 'package:perfectmatch/screens/search/widgets/outlined_button.dart';
import 'package:perfectmatch/screens/search/widgets/textfield_search.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/screens/widget/custom_appbar.dart';
import 'package:perfectmatch/utils/image_helper.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pinCodeController = TextEditingController();
  String selectedTitle = '';

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFieldSearch(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  iconImage: Image.asset(getAssetImage('search')),
                  text: 'Enter profile ID here',
                  height: screenHeight * 0.06,
                  width: screenWidth,
                  selectedTitle: selectedTitle,
                  onTitleSelected: (title) {
                    setState(() {
                      selectedTitle = title;
                    });
                  },
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
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Success')),
                      );
                    }
                  },
                ),
                sizedBox,
              ],
            ),
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

class LocationRow extends StatefulWidget {
  const LocationRow({
    super.key,
  });

  @override
  State<LocationRow> createState() => _LocationRowState();
}

class _LocationRowState extends State<LocationRow> {
  String? _validatePinCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a PIN code';
    }
    if (value.length != 6) {
      return 'PIN code must be exactly 6 digits';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'PIN code must contain only digits';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TextFieldSearch(
        //   color: const Color.fromARGB(255, 255, 255, 255),
        //   iconImage: Image.asset(getAssetImage('location')),
        //   text: 'location',
        //   height: screenHeight * 0.06,
        //   width: screenWidth * 0.65,
        // ),

        Expanded(
          child: TextFormField(
            validator: _validatePinCode,
            decoration: InputDecoration(
              prefixIcon: Image.asset(getAssetImage('location')),
              hintText: 'Location',
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
