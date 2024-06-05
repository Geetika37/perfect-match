import 'package:flutter/material.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';

// name textformfield

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
      padding: const EdgeInsets.only(
        top: 10,
      ),
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
            contentPadding: const EdgeInsets.only(
              top: 30,
              left: 10,
            ),
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

// mobile textformfield

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

// email textformfield

class InputEmail extends StatefulWidget {
  const InputEmail(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.textController,
      this.keyboardType});

  final String labelText, hintText;
  final TextEditingController textController;
  final TextInputType? keyboardType;

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
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
            if (value!.isEmpty ||
                !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
              return 'Enter Correct Email ID';
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

// dropdown
class Dropdown extends StatefulWidget {
  const Dropdown({
    super.key,
    required this.title,
    required this.hint,
    required this.icon,
    this.textValue = "",
    this.margin = 0,
  });

  final String title, hint, textValue;
  final double margin;
  final IconData icon;

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = 'Select';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Stack(children: [
        DropdownButtonFormField<String>(
          validator: (value) {
            if (value == null || value == 'Select') {
              return 'Please select a valid option';
            }
            return null;
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
          ),
          isExpanded: true,
          value: dropdownValue,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black,
          ),
          iconSize: 24,
          style: const TextStyle(
              color: Colors.black87,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 1.5),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Select', 'Male', 'Female']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: value == 'Select'
                    ? lexend(Colors.black12, 14, FontWeight.w400)
                    : lexend(AppColors.textFormFieldColor, 14, FontWeight.w400),
              ),
            );
          }).toList(),
        ),
        Positioned(
          top: 2,
          left: 10,
          child: Text(
            widget.title,
            style: const TextStyle(color: AppColors.primaryLite, fontSize: 10),
          ),
        )
      ]),
    );
  }
}
