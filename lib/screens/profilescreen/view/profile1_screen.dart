import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/screens/profilescreen/view/profile2_screen.dart';
import 'package:perfectmatch/screens/profilescreen/widgets/upload_picbox.dart';
import 'package:perfectmatch/utils/common_helper.dart';


import '../../widget/buttons.dart';
import '../../widget/input.dart';

class Profile1Screen extends StatefulWidget {
  const Profile1Screen({super.key});

  @override
  State<Profile1Screen> createState() => _Profile1ScreenState();
}

class _Profile1ScreenState extends State<Profile1Screen> {
  TextEditingController name = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  String _selectedDate = '';

  @override
  Widget build(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Padding(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Text(
                "Provide Your Information\n",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Personal Informations",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Lexend',
                ),
              ),
            ],
          ),
        ),
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
        margin: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hSpace(6),
                const Text(
                  "Profile Pictures",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                hSpace(6),
                Row(
                  children: [
                    UploadPicBox(deviceWidth: deviceWidth),
                    wSpace(10),
                    UploadPicBox(deviceWidth: deviceWidth),
                    wSpace(10),
                    UploadPicBox(deviceWidth: deviceWidth),
                  ],
                ),
                InputTextwithTitle(
                  title: 'Name',
                  hint: 'Enter your full name',
                  textController: name,
                  keyboardType: TextInputType.text,
                  margin: 15,
                  onChanged: (String) {},
                  validator: (String) {},
                ),
                InputTextwithTitle(
                  title: 'Mobile',
                  hint: 'Enter your mobile number',
                  textController: name,
                  keyboardType: TextInputType.phone,
                  margin: 15,
                  onChanged: (String) {},
                  validator: (String) {},
                ),
                InputTextwithTitle(
                  title: 'Email',
                  hint: 'Enter your Email ID',
                  textController: name,
                  keyboardType: TextInputType.emailAddress,
                  margin: 15,
                  onChanged: (String) {},
                  validator: (String) {},
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
                Row(
                  children: [
                    Expanded(
                      child: DropdownTextwithTitle(
                        title: 'Height',
                        hint: 'In feets',
                        textController: name,
                        keyboardType: TextInputType.emailAddress,
                        margin: 15,
                        icon: Icons.keyboard_arrow_down,
                        onTap: () {},
                      ),
                    ),
                    wSpace(10),
                    Expanded(
                      child: DropdownTextwithTitle(
                        title: 'Blood Group',
                        hint: 'Choose',
                        textController: name,
                        keyboardType: TextInputType.emailAddress,
                        margin: 15,
                        icon: Icons.keyboard_arrow_down,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                DropdownTextwithTitle(
                  title: 'Profession',
                  hint: 'Choose profession',
                  textController: name,
                  keyboardType: TextInputType.emailAddress,
                  margin: 15,
                  icon: Icons.keyboard_arrow_down,
                  onTap: () {},
                ),
                DropdownTextwithTitle(
                  title: 'Highest Education',
                  hint: 'Choose highest education',
                  textController: name,
                  keyboardType: TextInputType.emailAddress,
                  margin: 15,
                  icon: Icons.keyboard_arrow_down,
                  onTap: () {},
                ),
                hSpace(20),
                PrimaryButton(
                  text: 'Next',
                  onTap: () {
                    // Get.to(()=>OtpScreen());
                    Get.to(() => const Profile2Screen());
                  },
                ),
                hSpace(20),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = DateFormat('dd/MM/yyyy').format(picked);
        _dateController.text = _selectedDate;
      });
    }
  }

  void doValidation(
      GlobalKey<FormFieldState>? keyName, GlobalKey<FormState>? formKey) {
    if (formKey != null) {
      if (formKey.currentState?.validate() ?? false) {
        showSuccessMessage(context, message: 'Form Validated');
        Get.to(() => const Profile2Screen());
      }
    } else if (keyName != null) {
      keyName.currentState?.validate();
    }
  }

  void showSuccessMessage(
    BuildContext context, {
    required String message,
  }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
