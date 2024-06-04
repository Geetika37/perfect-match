// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:perfectmatch/constants/app_colors.dart';
// import 'package:perfectmatch/constants/size.dart';
// import 'package:perfectmatch/screens/profilescreen/view/profile2_screen.dart';
// import 'package:perfectmatch/screens/profilescreen/widgets/upload_picbox.dart';
// import 'package:perfectmatch/screens/widget/textfield.dart';
// import 'package:perfectmatch/utils/common_helper.dart';

// import '../../widget/buttons.dart';
// import '../../widget/input.dart';

// class Profile1Screen extends StatefulWidget {
//   const Profile1Screen({super.key});

//   @override
//   State<Profile1Screen> createState() => _Profile1ScreenState();
// }

// class _Profile1ScreenState extends State<Profile1Screen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController heightController = TextEditingController();

//   TextEditingController _dateController = TextEditingController();
//   String _selectedDate = '';

//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     double deviceWidth = getDeviceWidth(context);

//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.background,
//         title: const Padding(
//           padding: EdgeInsets.only(top: 40),
//           child: Column(
//             children: [
//               Text(
//                 "Provide Your Information\n",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 22,
//                   fontFamily: 'Lexend',
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Text(
//                 "Personal Informations",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   fontFamily: 'Lexend',
//                 ),
//               ),
//             ],
//           ),
//         ),
//         leading: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//           child: BButton(
//             onTap: () {
//               Get.back();
//             },
//           ),
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         margin: const EdgeInsets.only(top: 20),
//         child: SingleChildScrollView(
//           child: Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 hSpace(6),
//                 const Text(
//                   "Profile Pictures",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12,
//                   ),
//                 ),
//                 hSpace(6),
//                 Row(
//                   children: [
//                     UploadPicBox(deviceWidth: deviceWidth),
//                     wSpace(10),
//                     UploadPicBox(deviceWidth: deviceWidth),
//                     wSpace(10),
//                     UploadPicBox(deviceWidth: deviceWidth),
//                   ],
//                 ),
//                 InputName(
//                   title: 'Name',
//                   hint: 'Enter your full name',
//                   textController: nameController,
//                   keyboardType: TextInputType.name,
//                   margin: 15,
//                 ),
//                 hSpace(screenHeight * 0.01),
//                 InputMobilee(
//                   labelText: 'Mobile',
//                   hintText: 'Enter your Mobile Number',
//                   keyboardType: TextInputType.number,
//                   textController: phoneController,
//                 ),
//                 hSpace(screenHeight * 0.01),
//                 InputEmail(
//                   labelText: 'Email',
//                   hintText: 'Enter your Email ID',
//                   textController: emailController,
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 DropdownTextwithTitle(
//                   title: 'Date of Birth',
//                   hint: 'DD/MM/YYYY',
//                   textController: _dateController,
//                   margin: 15,
//                   icon: Icons.calendar_month,
//                   onTap: () {
//                     setState(() {
//                       _selectDate();
//                     });
//                   },
//                   textValue: _selectedDate,
//                 ),
//                 hSpace(screenHeight * 0.02),
//                 Row(
//                   children: [
//                     const Expanded(
//                         child: DropdownHeights(
//                       title: 'Heights',
//                       hint: 'Heights',
//                       icon: Icons.arrow_drop_down_sharp,
//                     )),
//                     wSpace(10),
//                     const Expanded(
//                       child: DropdownHeights(
//                         title: 'Blood Group',
//                         hint: 'Blood Group',
//                         icon: Icons.arrow_drop_down_sharp,
//                       ),
//                     ),
//                   ],
//                 ),
//                 hSpace(screenHeight * 0.02),
//                 const DropdownHeights(
//                   title: 'Profession',
//                   hint: 'Choose profession',
//                   icon: Icons.arrow_drop_down_sharp,
//                 ),
//                 hSpace(screenHeight * 0.02),
//                 const DropdownHeights(
//                   title: 'Highest Education',
//                   hint: 'Choose highest education',
//                   icon: Icons.arrow_drop_down_sharp,
//                 ),
//                 hSpace(20),
//                 PrimaryButton(
//                   text: 'Next',
//                   onTap: () {
//                     HapticFeedback.mediumImpact();
//                     if (formKey.currentState!.validate()) {
//                       showSuccessMessage(context, message: 'Submitted success');
//                       Get.to(const Profile2Screen());
//                     }
//                   },
//                 ),
//                 hSpace(20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ));
//   }

//   Future<void> _selectDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1950),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null) {
//       setState(() {
//         _selectedDate = DateFormat('dd/MM/yyyy').format(picked);
//         _dateController.text = _selectedDate;
//       });
//     }
//   }

//   void showSuccessMessage(
//     BuildContext context, {
//     required String message,
//   }) {
//     final snackBar = SnackBar(
//       content: Text(
//         message,
//         style: const TextStyle(color: Colors.white),
//       ),
//       backgroundColor: Colors.green,
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/profilescreen/view/profile2_screen.dart';
import 'package:perfectmatch/screens/profilescreen/widgets/upload_picbox.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/screens/widget/input.dart';
import 'package:perfectmatch/screens/widget/textfield.dart';
import 'package:perfectmatch/utils/common_helper.dart';

class Profile1Screen extends StatefulWidget {
  const Profile1Screen({super.key});

  @override
  State<Profile1Screen> createState() => _Profile1ScreenState();
}

class _Profile1ScreenState extends State<Profile1Screen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  String _selectedDate = '';
  RxBool isImageAdded = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<GlobalKey<UploadPicBoxState>> _uploadPicBoxKeys = [
    GlobalKey<UploadPicBoxState>(),
    GlobalKey<UploadPicBoxState>(),
    GlobalKey<UploadPicBoxState>(),
  ];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);

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
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Provide Your Information",
                    style: lexend(Colors.black, 22, FontWeight.w600),
                  ),
                  hSpace(screenHeight * 0.01),
                  Text(
                    "Personal Informations",
                    style: lexend(Colors.black, 12, FontWeight.w400),
                  ),
                  hSpace(8),
                  Row(
                    children: [
                      UploadPicBox(
                        key: _uploadPicBoxKeys[0],
                        deviceWidth: deviceWidth,
                        onImageSelected: _checkImageSelections,
                      ),
                      wSpace(10),
                      UploadPicBox(
                        key: _uploadPicBoxKeys[1],
                        deviceWidth: deviceWidth,
                        onImageSelected: _checkImageSelections,
                      ),
                      wSpace(10),
                      UploadPicBox(
                        key: _uploadPicBoxKeys[2],
                        deviceWidth: deviceWidth,
                        onImageSelected: _checkImageSelections,
                      ),
                    ],
                  ),
                  Obx(
                    () => isImageAdded.value
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              'Please Upload all Profile Pictures',
                              style: lexend(
                                  const Color.fromARGB(255, 186, 34, 23),
                                  12,
                                  FontWeight.w400),
                            ),
                          )
                        : const SizedBox(),
                  ),
                  InputName(
                    title: 'Name',
                    hint: 'Enter your full name',
                    textController: nameController,
                    keyboardType: TextInputType.name,
                    margin: 15,
                  ),
                  hSpace(screenHeight * 0.01),
                  InputMobilee(
                    labelText: 'Mobile',
                    hintText: 'Enter your Mobile Number',
                    keyboardType: TextInputType.number,
                    textController: phoneController,
                  ),
                  hSpace(screenHeight * 0.01),
                  InputEmail(
                    labelText: 'Email',
                    hintText: 'Enter your Email ID',
                    textController: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  DropdownTextwithTitle(
                    title: 'Date of Birth',
                    hint: 'DD/MM/YYYY',
                    textController: _dateController,
                    margin: 15,
                    icon: Icons.calendar_month,
                    onTap: () {
                      setState(() {
                        _selectDate();
                      });
                    },
                    textValue: _selectedDate,
                  ),
                  hSpace(screenHeight * 0.01),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: DropdownHeights(
                          title: 'Heights',
                          hint: 'Heights',
                          icon: Icons.arrow_drop_down_sharp,
                        ),
                      ),
                      wSpace(10),
                      const Expanded(
                        child: DropdownHeights(
                          title: 'Blood Group',
                          hint: 'Blood Group',
                          icon: Icons.arrow_drop_down_sharp,
                        ),
                      ),
                    ],
                  ),
                  hSpace(screenHeight * 0.01),
                  const DropdownHeights(
                    title: 'Profession',
                    hint: 'Choose profession',
                    icon: Icons.arrow_drop_down_sharp,
                  ),
                  hSpace(screenHeight * 0.01),
                  const DropdownHeights(
                    title: 'Highest Education',
                    hint: 'Choose highest education',
                    icon: Icons.arrow_drop_down_sharp,
                  ),
                  hSpace(20),
                  PrimaryButton(
                    text: 'Next',
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      if (_validateForm()) {
                        showSuccessMessage(context,
                            message: 'Submitted successfully');
                        Get.to(const Profile2Screen());
                      }
                    },
                  ),
                  hSpace(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = DateFormat('dd/MM/yyyy').format(picked);
        _dateController.text = _selectedDate;
      });
    }
  }

  void _checkImageSelections() {
    setState(() {});
  }

  bool _validateForm() {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    for (var key in _uploadPicBoxKeys) {
      if (!key.currentState!.isImageSelected()) {
        isImageAdded.value = true;
        showErrorMessage(context,
            message: 'Please upload all profile pictures.');
        return false;
      }
    }

    return true;
  }

  void showSuccessMessage(BuildContext context, {required String message}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage(BuildContext context, {required String message}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
