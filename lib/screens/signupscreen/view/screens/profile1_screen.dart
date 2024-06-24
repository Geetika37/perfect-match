import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/signupscreen/controllers/controller.dart';
import 'package:perfectmatch/screens/signupscreen/view/screens/profile2_screen.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/screens/widget/datefield.dart';
import 'package:perfectmatch/screens/widget/dropdown_bloodgroup.dart';
import 'package:perfectmatch/screens/widget/dropdown_education.dart';
import 'package:perfectmatch/screens/widget/dropdown_profession.dart';
import 'package:perfectmatch/screens/widget/textfield.dart';
import 'package:perfectmatch/screens/widget/textfield_email.dart';
import 'package:perfectmatch/screens/widget/textfield_mobile.dart';
import 'package:perfectmatch/screens/widget/textfield_name.dart';
import 'package:perfectmatch/utils/common_helper.dart';
import 'package:perfectmatch/utils/image_helper.dart';

class Profile1Screen extends StatefulWidget {
  const Profile1Screen({super.key});

  @override
  State<Profile1Screen> createState() => _Profile1ScreenState();
}

class _Profile1ScreenState extends State<Profile1Screen> {
  final RegisterController registerController = Get.put(RegisterController());
  RxBool isImageAdded = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<UploadPicBoxState> _uploadPicBoxKey =
      GlobalKey<UploadPicBoxState>();

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
                    "Personal Information",
                    style: lexend(Colors.black, 12, FontWeight.w400),
                  ),
                  hSpace(8),
                  UploadPicBox(
                    key: _uploadPicBoxKey,
                    deviceWidth: deviceWidth,
                    onImageSelected: _checkImageSelections,
                  ),
                  Obx(
                    () => isImageAdded.value
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              'Please Upload a Profile Picture',
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
                    textController: registerController.nameController.value,
                    keyboardType: TextInputType.name,
                    margin: 15,
                  ),
                  hSpace(screenHeight * 0.01),
                  InputMobilee(
                    labelText: 'Mobile',
                    hintText: 'Enter your Mobile Number',
                    keyboardType: TextInputType.number,
                    textController: registerController.phoneController.value,
                  ),
                  hSpace(screenHeight * 0.01),
                  InputEmail(
                    labelText: 'Email',
                    hintText: 'Enter your Email ID',
                    textController: registerController.emailController.value,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  DropdownTextwithTitle(
                    title: 'Date of Birth',
                    hint: 'DD/MM/YYYY',
                    margin: 15,
                    icon: Icons.calendar_month,
                    onTap: () {
                      setState(() {
                        _selectDate();
                      });
                    },
                    textValue: registerController.dobController.value,
                  ),
                  hSpace(screenHeight * 0.01),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InputTextFormField(
                          labelText: 'Height',
                          hintText: 'Height',
                          textController:
                              registerController.heightController.value,
                        ),
                      ),
                      wSpace(10),
                      Expanded(
                        child: Dropdown(
                          title: 'Blood Group',
                          hint: 'Blood Group',
                          icon: Icons.arrow_drop_down_sharp,
                          bloodGroupController:
                              registerController.bloodGroupController,
                        ),
                      ),
                    ],
                  ),
                  hSpace(screenHeight * 0.01),
                  DropdownProfession(
                    title: 'Profession',
                    hint: 'Choose profession',
                    icon: Icons.arrow_drop_down_sharp,
                    professionController:
                        registerController.professionController,
                  ),
                  DropdownEducation(
                    title: 'Highest Education',
                    hint: 'Choose highest education',
                    icon: Icons.arrow_drop_down_sharp,
                    educationController: registerController.educationController,
                  ),
                  hSpace(20),
                  PrimaryButton(
                    text: 'Next',
                    onTap: () async {
                      HapticFeedback.mediumImpact();

                      if (_validateForm()) {
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
        registerController.dobController.value =
            DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  void _checkImageSelections() {
    setState(() {
      isImageAdded.value = _uploadPicBoxKey.currentState != null &&
          _uploadPicBoxKey.currentState!.isImageSelected();
    });
  }

  bool _validateForm() {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    if (_uploadPicBoxKey.currentState == null ||
        !_uploadPicBoxKey.currentState!.isImageSelected()) {
      isImageAdded.value = true;
      return false;
    }

    return true;
  }
}

class UploadPicBox extends StatefulWidget {
  const UploadPicBox({
    super.key,
    required this.deviceWidth,
    required this.onImageSelected,
    this.defaultImage = 'assets/images/upload.png', // Default image asset
  });

  final double deviceWidth;
  final VoidCallback onImageSelected;
  final String defaultImage;

  @override
  State<UploadPicBox> createState() => UploadPicBoxState();
}

class UploadPicBoxState extends State<UploadPicBox> {
  File? _image;
  XFile? image;
  final RegisterController registerController = Get.put(RegisterController());

  final ImageHelper _imageHelper = ImageHelper();

  Future<void> _pickAndCropImage() async {
    List<XFile> pickedFiles = await _imageHelper.pickImage(multiple: false);
    if (pickedFiles.isNotEmpty) {
      XFile pickedFile = pickedFiles.first;
      CroppedFile? croppedFile = await _imageHelper.crop(file: pickedFile);
      if (croppedFile != null) {
        setState(() {
          _image = File(croppedFile.path);
          image = XFile(croppedFile.path);
        });
        widget.onImageSelected();
        registerController.profileImageController.value = image;
      }
    }
  }

  bool isImageSelected() {
    return _image != null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (widget.deviceWidth - 60) / 3,
      height: (widget.deviceWidth - 60) / 3,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColors.primarySecondary),
        color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Center(
            child: _image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      _image!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.defaultImage,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: _pickAndCropImage,
                child: SvgPicture.asset('assets/svg/uploadimage.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
