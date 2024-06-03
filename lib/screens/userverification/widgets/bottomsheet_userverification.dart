
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/userverification/controllers/user_verification_controller.dart';
import 'package:perfectmatch/utils/common_helper.dart';


class BottomSheetImageUpload extends StatefulWidget {
  const BottomSheetImageUpload({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomSheetImageUpload> createState() => _BottomSheetImageUploadState();
}

class _BottomSheetImageUploadState extends State<BottomSheetImageUpload> {
  final UserVerificationController userVerificationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.24,
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, right: 40, left: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                pickImage(false);
              },
              child: Text(
                'Take Photo',
                style: lexend(
                  Colors.black,
                  16,
                  FontWeight.w500,
                ),
              ),
            ),
            hSpace(13),
            InkWell(
              onTap: () {
                pickImage(true);
              },
              child: Text(
                'Choose existing photo',
                style: lexend(
                  Colors.black,
                  16,
                  FontWeight.w500,
                ),
              ),
            ),
            hSpace(40),
            Center(
                child: InkWell(
              onTap: () => Get.back(),
              child: Text(
                'Cancel',
                style: lexend(
                  Colors.black,
                  20,
                  FontWeight.w500,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  void pickImage(bool pickGalleryImage) async {
    XFile? image;
    final picker = ImagePicker();

    if (pickGalleryImage) {
      image = await picker.pickImage(source: ImageSource.gallery);
    } else {
      image = await picker.pickImage(source: ImageSource.camera);
    }

    if (image != null) {
      final croppedImage = await cropImages(image);

      if (croppedImage != null) {
        userVerificationController.selectedImagePath(croppedImage.path);
        Get.back();
      }
    }
  }

  Future<CroppedFile> cropImages(XFile image) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Crop Image',
        )
      ],
    );
    return croppedFile!;
  }
}
