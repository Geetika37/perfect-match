
// mobile textformfield

import 'package:flutter/material.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';

class InputMobilee extends StatefulWidget {
  const InputMobilee(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.textController,
      this.keyboardType});

  final String labelText, hintText;
  final TextEditingController textController;
  final TextInputType? keyboardType;

  @override
  State<InputMobilee> createState() => _InputMobileeState();
}

class _InputMobileeState extends State<InputMobilee> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Stack(children: [
        TextFormField(
          maxLength: 10,
          controller: widget.textController,
          keyboardType: widget.keyboardType,
          validator: (value) {
            if (value!.isEmpty || !RegExp(r'^\+?1?\d{9,15}$').hasMatch(value)) {
              return 'Enter Correct Phone Number';
            } else {
              return null;
            }
          },
          autocorrect: true,
          cursorColor: Colors.black,
          buildCounter: (BuildContext context,
              {int? currentLength, int? maxLength, bool? isFocused}) {
            return null; // Hides the counter
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.primarySecondary),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.primarySecondary),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.primarySecondary),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.primarySecondary),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.primarySecondary),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.only(
              top: 30,
              left: 10,
            ),
            hintText: widget.hintText,
            hintStyle: lexend(Colors.black12, 14, FontWeight.w400),
          ),
          style: lexend(AppColors.textFormFieldColor, 14, FontWeight.w300),
          textCapitalization: TextCapitalization.sentences,
        ),
        Positioned(
          top: 3,
          left: 10,
          child: Text(
            widget.labelText,
            style: lexend(AppColors.primaryLite, 10, FontWeight.w400),
          ),
        ),
      ]),
    );
  }
}
