import 'package:flutter/material.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';


// textformfield

class InputTextFormField extends StatefulWidget {
  const InputTextFormField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.textController,
      this.keyboardType});

  final String labelText, hintText;
  final TextEditingController textController;
  final TextInputType? keyboardType;

  @override
  State<InputTextFormField> createState() => _InputTextFormFieldState();
}

class _InputTextFormFieldState extends State<InputTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Stack(children: [
        TextFormField(
          controller: widget.textController,
          keyboardType: widget.keyboardType,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter value';
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
          style: const TextStyle(
              fontSize: 14,
              color: AppColors.textFormFieldColor,
              fontWeight: FontWeight.w300,
              height: 1.7),
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


