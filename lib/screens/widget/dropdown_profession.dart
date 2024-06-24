// profession

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';

class DropdownProfession extends StatefulWidget {
  const DropdownProfession({
    super.key,
    required this.title,
    required this.hint,
    required this.icon,
    this.margin = 0,
    required this.professionController,
  });

  final String title, hint;
  final double margin;
  final IconData icon;
  final RxString professionController;

  @override
  State<DropdownProfession> createState() => _DropdownProfessionState();
}

class _DropdownProfessionState extends State<DropdownProfession> {
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = 'Select';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1, color: AppColors.primarySecondary),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1, color: AppColors.primarySecondary),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1, color: AppColors.primarySecondary),
                  borderRadius: BorderRadius.circular(10)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1, color: AppColors.primarySecondary),
                  borderRadius: BorderRadius.circular(10)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1, color: AppColors.primarySecondary),
                  borderRadius: BorderRadius.circular(10)),
              contentPadding: const EdgeInsets.only(top: 30, left: 10),
            ),
            isExpanded: true,
            value: dropdownValue,
            icon: const Icon(Icons.keyboard_arrow_down_rounded,
                color: Colors.black),
            iconSize: 24,
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                height: 1.5),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                widget.professionController.value = newValue;
              });
            },
            items: <String>[
              'Select',
              'python developer',
              'Web developer',
              'UI/UX designer'
            ].map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: value == 'Select'
                        ? lexend(Colors.black12, 14, FontWeight.w400)
                        : lexend(
                            AppColors.textFormFieldColor, 14, FontWeight.w400),
                  ),
                );
              },
            ).toList(),
            validator: (value) {
              if (value == null || value == 'Select') {
                return 'Please select a valid option';
              }
              return null;
            },
          ),
          Positioned(
            top: 2,
            left: 10,
            child: Text(
              widget.title,
              style:
                  const TextStyle(color: AppColors.primaryLite, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
