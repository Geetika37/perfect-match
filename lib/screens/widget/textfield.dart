import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/size.dart';
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
            errorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.primarySecondary),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.only(
              top: 30,
              left: 10,
            ),
            hintText: widget.hint,
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
            contentPadding: const EdgeInsets.only(
              top: 30,
              left: 10,
            ),
            hintText: widget.hintText,
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
            contentPadding: const EdgeInsets.only(
              top: 30,
              left: 10,
            ),
            hintText: widget.hintText,
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

// dropdown Heights
class DropdownHeights extends StatefulWidget {
  const DropdownHeights({
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
  State<DropdownHeights> createState() => _DropdownHeightsState();
}

class _DropdownHeightsState extends State<DropdownHeights> {
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
            contentPadding: const EdgeInsets.only(
              top: 30,
              left: 10,
            ),
            // hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black12,
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
          ),
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
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(152, 151, 151, 1),
                ),
              ),
            );
          }).toList(),
        ),
        Positioned(
          top: 3,
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
