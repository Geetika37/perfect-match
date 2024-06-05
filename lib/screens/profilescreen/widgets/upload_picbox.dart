import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/utils/image_helper.dart';

class UploadPicBoxRectangle extends StatefulWidget {
  const UploadPicBoxRectangle({
    super.key,
    required this.deviceWidth,
    required this.onImageSelected,
  });

  final double deviceWidth;
  final VoidCallback onImageSelected;
  @override
  State<UploadPicBoxRectangle> createState() => UploadPicBoxRectangleState();
}

class UploadPicBoxRectangleState extends State<UploadPicBoxRectangle> {
  File? _image;
  final ImageHelper _imageHelper = ImageHelper();

  Future<void> _pickAndCropImage() async {
    // Pick an image
    List<XFile> pickedFiles = await _imageHelper.pickImage(multiple: false);
    if (pickedFiles.isNotEmpty) {
      XFile pickedFile = pickedFiles.first;

      // Crop the image
      CroppedFile? croppedFile = await _imageHelper.crop(file: pickedFile);

      // Set the cropped image to the state
      if (croppedFile != null) {
        setState(() {
          _image = File(croppedFile.path);
        });
        widget.onImageSelected();
      }
    }
  }

  bool isImageSelected() {
    return _image != null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidth,
        height: screenHeight * 0.2,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.primary),
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
            borderRadius: BorderRadius.circular(10)),
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
                  : GestureDetector(
                      onTap: _pickAndCropImage,
                      child: Image.asset(getAssetImage('imageupload_pink')),
                    ),
            ),
            Positioned(
              child: _image != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: _pickAndCropImage,
                          child: SvgPicture.asset(
                              'assets/svg/uploadimagewhite.svg'),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ));
  }
}

class UploadPicBox extends StatefulWidget {
  const UploadPicBox({
    super.key,
    required this.deviceWidth,
    required this.onImageSelected,
  });

  final double deviceWidth;
  final VoidCallback onImageSelected;

  @override
  State<UploadPicBox> createState() => UploadPicBoxState();
}

class UploadPicBoxState extends State<UploadPicBox> {
  File? _image;
  final ImageHelper _imageHelper = ImageHelper();

  Future<void> _pickAndCropImage() async {
    List<XFile> pickedFiles = await _imageHelper.pickImage(multiple: false);
    if (pickedFiles.isNotEmpty) {
      XFile pickedFile = pickedFiles.first;
      CroppedFile? croppedFile = await _imageHelper.crop(file: pickedFile);
      if (croppedFile != null) {
        setState(() {
          _image = File(croppedFile.path);
        });
        widget.onImageSelected();
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
        // color: const Color.fromARGB(255, 200, 197, 197).withOpacity(0.4),
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
                : const Icon(
                    Icons.image,
                    color: AppColors.inputDullColor,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: _pickAndCropImage,
                // child: const Icon(
                //   Icons.add_a_photo,
                //   color: AppColors.primary,
                //   size: 20,
                // ),
                child: SvgPicture.asset('assets/svg/uploadimage.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





// class UploadPicBox extends StatefulWidget {
//   const UploadPicBox({
//     super.key,
//     required this.deviceWidth,
//   });

//   final double deviceWidth;

//   @override
//   State<UploadPicBox> createState() => _UploadPicBoxState();
// }

// class _UploadPicBoxState extends State<UploadPicBox> {
//   File? _image;
//   final ImageHelper _imageHelper = ImageHelper();
//   bool _isImageSelected = true;

//   Future<void> _pickAndCropImage() async {
//     // Pick an image
//     List<XFile> pickedFiles = await _imageHelper.pickImage(multiple: false);
//     if (pickedFiles.isNotEmpty) {
//       XFile pickedFile = pickedFiles.first;

//       // Crop the image
//       CroppedFile? croppedFile = await _imageHelper.crop(file: pickedFile);

//       // Set the cropped image to the state
//       if (croppedFile != null) {
//         setState(() {
//           _image = File(croppedFile.path);
//           _isImageSelected = true;
//         });
//       }
//     }
//   }

//   void validImageSelection() {
//     setState(() {
//       _isImageSelected = _image != null;

//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: (widget.deviceWidth - 60) / 3,
//         height: (widget.deviceWidth - 60) / 3,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             border: Border.all(width: 1, color: AppColors.primary),
//             color: Colors.grey.withOpacity(0.4),
//             borderRadius: BorderRadius.circular(10)),
//         child: Stack(
//           children: [
//             Center(
//               child: _image != null
//                   ? ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.file(
//                         _image!,
//                         width: double.infinity,
//                         height: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                     )
//                   : const Icon(
//                       Icons.image,
//                       color: AppColors.inputDullColor,
//                     ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Align(
//                   alignment: Alignment.bottomRight,
//                   child: GestureDetector(
//                     onTap: () {
//                       _pickAndCropImage();
//                       validImageSelection();
//                     },
//                     child: const Icon(
//                       Icons.add_a_photo,
//                       color: AppColors.primary,
//                       size: 20,
//                     ),
//                   )),
//             ),

//           ],
//         ));
//   }
// }
