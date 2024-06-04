import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import '../../../constants/app_colors.dart';

class InputMobile extends StatelessWidget {
  const InputMobile({
    super.key,
    required this.title,
    required this.prefix,
    required this.hint,
    required this.textController,
  });

  final String title, prefix, hint;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 0),
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 1, color: AppColors.inputDullColor)),
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              title,
              style: const TextStyle(
                  color: AppColors.inputPlaceHolderColor, fontSize: 12),
            ),
          ),
          CupertinoTextField(
            keyboardType: TextInputType.phone,
            controller: textController,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
            autocorrect: true,
            prefix: Text(
              prefix,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            cursorColor: Colors.black,
            decoration: const BoxDecoration(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textCapitalization: TextCapitalization.sentences,
            placeholderStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black12,
            ),
            placeholder: hint,
          ),
        ],
      ),
    );
  }
}

// class InputText extends StatelessWidget {
//   const InputText({
//     super.key,
//     required this.title,
//     required this.hint,
//     required this.textController,
//     required this.keyboardType,
//     required this.onChanged,
//     required this.validator,
//   });

//   final String title, hint;
//   final TextEditingController textController;
//   final TextInputType? keyboardType;
//   final Function(String) onChanged;
//   final String? Function(String?) validator;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 55,
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
//       decoration: ShapeDecoration(
//         shape: RoundedRectangleBorder(
//           side: const BorderSide(width: 1, color: Color(0x7FF05E87)),
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       child: TextFormField(
//         key: key,
//         onChanged: onChanged,
//         controller: textController,
//         keyboardType: keyboardType,
//         validator: validator,
//         autocorrect: true,
//         cursorColor: Colors.black,
//         decoration: InputDecoration(
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//           border: InputBorder.none,
//           hintText: hint,
//           hintStyle: const TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.w400,
//             color: Colors.black12,
//           ),
//         ),
//         style: const TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//         textCapitalization: TextCapitalization.sentences,
//       ),
//     );
//   }
// }

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.title,
    required this.hint,
    required this.textController,
    required this.keyboardType,
    required this.onChanged,
    required this.validator,
  });

  final String title, hint;
  final TextEditingController textController;
  final TextInputType? keyboardType;
  final Function(String) onChanged;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      onChanged: onChanged,
      controller: textController,
      keyboardType: keyboardType,
      validator: validator,
      autocorrect: true,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0x7FF05E87)),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0x7FF05E87)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0x7FF05E87)),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0x7FF05E87)),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black12,
        ),
      ),
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      textCapitalization: TextCapitalization.sentences,
    );
  }
}

class InputPassword extends StatelessWidget {
  const InputPassword({
    super.key,
    required this.title,
    required this.hint,
    required this.textController,
  });

  final String title, hint;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    RxBool isShow = RxBool(true);

    return Container(
      height: 50,
      padding: const EdgeInsets.only(bottom: 0, left: 0, right: 5, top: 0),
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 1, color: AppColors.inputDullColor)),
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: AppColors.inputPlaceHolderColor, fontSize: 12),
                  ),
                ),
                Obx(
                  () => CupertinoTextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isShow.value,
                    controller: textController,
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                    autocorrect: true,
                    cursorColor: Colors.black,
                    decoration: const BoxDecoration(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    placeholderStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black12,
                    ),
                    placeholder: hint,
                  ),
                ),
              ],
            ),
          ),
          Obx(() => TouchableOpacity(
              onTap: () {
                if (isShow.value) {
                  isShow.value = false;
                } else {
                  isShow.value = true;
                }
              },
              child: Icon(
                isShow.value ? Icons.visibility : Icons.visibility_off,
                size: 20,
              )))
        ],
      ),
    );
  }
}

class DropdownTextwithTitle extends StatelessWidget {
  const DropdownTextwithTitle({
    super.key,
    required this.title,
    required this.hint,
    required this.textController,
    this.keyboardType,
    required this.icon,
    required this.onTap,
    this.textValue = "",
    this.margin = 0,
  });

  final String title, hint, textValue;
  final TextEditingController textController;
  final TextInputType? keyboardType;
  final double margin;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.only(top: margin),
        padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10, top: 5),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.primarySecondary),
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: AppColors.primaryLite, fontSize: 10),
                    ),
                  ),
                  Text(textValue.isNotEmpty ? textValue : hint,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: textValue.isNotEmpty
                              ? Colors.black
                              : Colors.black12,
                          height: 1)),
                ],
              ),
            ),
            SvgPicture.asset('assets/svg/calendar.svg')
          ],
        ),
      ),
    );
  }
}
