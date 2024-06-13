import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/search/widgets/outlined_button.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/utils/image_helper.dart';

class CustomBottomSheetCaste extends StatefulWidget {
  const CustomBottomSheetCaste({super.key});

  @override
  State<CustomBottomSheetCaste> createState() => _CustomBottomSheetCasteState();
}

class _CustomBottomSheetCasteState extends State<CustomBottomSheetCaste> {
  final List<Map<String, dynamic>> casteList = [
    {'category': 'Brahmin Castes', 'name': 'Saraswat Brahmin'},
    {'category': 'Brahmin Castes', 'name': 'Iyer (Tamil Brahmin)'},
    {'category': 'Brahmin Castes', 'name': 'Iyengar (Tamil Brahmin)'},
    {'category': 'Brahmin Castes', 'name': 'Namboodiri Brahmin'},
    {'category': 'Kshatriya Castes', 'name': 'Rajput'},
    {'category': 'Kshatriya Castes', 'name': 'Agarwal'},
    {'category': 'Kshatriya Castes', 'name': 'Oswal'},
    {'category': 'Shudra Castes', 'name': 'Yadav'},
    {'category': 'Shudra Castes', 'name': 'Kurmi'},
    {'category': 'Shudra Castes', 'name': 'Nador'},
    {'category': 'Scheduled Tribes (ST)', 'name': 'Bhil'},
    {'category': 'Scheduled Tribes (ST)', 'name': 'Gond'},
    {'category': 'Scheduled Tribes (ST)', 'name': 'Santhal'},
    {'category': 'Other Castes/Communities', 'name': 'Sindhi'},
    {'category': 'Other Castes/Communities', 'name': 'Parsi'},
    {'category': 'Other Castes/Communities', 'name': 'Christian Dalit'},
    {'category': 'Other Castes/Communities', 'name': 'Muslim(Sunni, Shia)'},
    {'category': 'Other Castes/Communities', 'name': 'Sikh'},
  ];

  final List<bool> selected = List.generate(18, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: screenHeight * 0.6,
        child: Column(
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
            SizedBox(height: screenHeight * 0.02),
            Expanded(child: _buildCheckboxList()), // Use Expanded here
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
      ),
    );
  }

  Widget _buildCheckboxList() {
    String currentCategory = '';

    return ListView.builder(
      itemCount: casteList.length,
      itemBuilder: (context, index) {
        bool isCategoryChanged =
            casteList[index]['category'] != currentCategory;
        if (isCategoryChanged) {
          currentCategory = casteList[index]['category'];
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isCategoryChanged)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  currentCategory,
                  style: lexend(const Color(0xff666666), 14, FontWeight.w500),
                ),
              ),
            Row(
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
                    casteList[index]['name'],
                    style: lexend(Colors.black, 14, FontWeight.w400),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
