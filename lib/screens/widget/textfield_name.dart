// name textformfield

import 'package:flutter/material.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';

class InputName extends StatefulWidget {
  const InputName({
    super.key,
    required this.title,
    required this.hint,
    required this.textController,
    required this.keyboardType,
    this.margin = 0,
  });

  final String title, hint;
  final TextEditingController textController;
  final TextInputType? keyboardType;
  final double margin;

  @override
  State<InputName> createState() => _InputNameState();
}

class _InputNameState extends State<InputName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(children: [
        TextFormField(
          controller: widget.textController,
          keyboardType: widget.keyboardType,
          validator: (value) {
            if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
              return 'Enter Correct Name';
            } else {
              return null;
            }
          },
          autocorrect: true,
          cursorColor: Colors.black,
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
            disabledBorder: OutlineInputBorder(
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
            contentPadding: const EdgeInsets.only(top: 30, left: 10),
            hintText: widget.hint,
            hintStyle: lexend(Colors.black12, 14, FontWeight.w400),
          ),
          style: lexend(AppColors.textFormFieldColor, 14, FontWeight.w300),
          textCapitalization: TextCapitalization.sentences,
        ),
        Positioned(
          top: 3,
          left: 10,
          child: Text(
            'Name',
            style: lexend(AppColors.primaryLite, 10, FontWeight.w400),
          ),
        ),
      ]),
    );
  }
}
