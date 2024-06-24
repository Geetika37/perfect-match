import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/app_colors.dart';

class DropdownState extends StatefulWidget {
  const DropdownState({
    super.key,
    required this.title,
    required this.hint,
    required this.icon,
    this.margin = 0,
    required this.stateController,
    required this.items,
    this.onChanged,
  });

  final String title, hint;
  final double margin;
  final IconData icon;
  final RxString stateController;
  final List<DropdownMenuItem<String>> items;
  final void Function(String?)? onChanged;

  @override
  State<DropdownState> createState() => _DropdownStateState();
}

class _DropdownStateState extends State<DropdownState> {
  String? dropdownValue;

  @override
  void initState() {
    if (widget.items.isNotEmpty) {
      dropdownValue = widget.items[0].value;
    }
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
                widget.stateController.value = newValue;
                if (widget.onChanged != null) {
                  widget.onChanged!(newValue);
                }
              });
            },
            items: widget.items,
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





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:perfectmatch/constants/app_colors.dart';
// import 'package:perfectmatch/constants/styles/textstyle.dart';

// class DropdownState extends StatefulWidget {
//   const DropdownState({
//     super.key,
//     required this.title,
//     required this.hint,
//     required this.icon,
//     this.margin = 0,
//     required this.stateController,
//   });

//   final String title, hint;
//   final double margin;
//   final IconData icon;
//   final RxString stateController;

//   @override
//   State<DropdownState> createState() => _DropdownStateState();
// }

// class _DropdownStateState extends State<DropdownState> {
//   late String dropdownValue;

//   @override
//   void initState() {
//     dropdownValue = 'Select';
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(top: 10),
//       child: Stack(
//         children: [
//           DropdownButtonFormField<String>(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       width: 1, color: AppColors.primarySecondary),
//                   borderRadius: BorderRadius.circular(10)),
//               enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       width: 1, color: AppColors.primarySecondary),
//                   borderRadius: BorderRadius.circular(10)),
//               focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       width: 1, color: AppColors.primarySecondary),
//                   borderRadius: BorderRadius.circular(10)),
//               errorBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       width: 1, color: AppColors.primarySecondary),
//                   borderRadius: BorderRadius.circular(10)),
//               focusedErrorBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       width: 1, color: AppColors.primarySecondary),
//                   borderRadius: BorderRadius.circular(10)),
//               contentPadding: const EdgeInsets.only(top: 30, left: 10),
//             ),
//             isExpanded: true,
//             value: dropdownValue,
//             icon: const Icon(Icons.keyboard_arrow_down_rounded,
//                 color: Colors.black),
//             iconSize: 24,
//             style: const TextStyle(
//                 color: Colors.black87,
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//                 height: 1.5),
//             onChanged: (String? newValue) {
//               setState(() {
//                 dropdownValue = newValue!;
//                 widget.stateController.value = newValue;
//               });
//             },
//             items: <String>[
//               'Select',
//               'python developer',
//               'Web developer',
//               'UI/UX designer'
//             ].map<DropdownMenuItem<String>>(
//               (String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(
//                     value,
//                     style: value == 'Select'
//                         ? lexend(Colors.black12, 14, FontWeight.w400)
//                         : lexend(
//                             AppColors.textFormFieldColor, 14, FontWeight.w400),
//                   ),
//                 );
//               },
//             ).toList(),
//             validator: (value) {
//               if (value == null || value == 'Select') {
//                 return 'Please select a valid option';
//               }
//               return null;
//             },
//           ),
//           Positioned(
//             top: 2,
//             left: 10,
//             child: Text(
//               widget.title,
//               style:
//                   const TextStyle(color: AppColors.primaryLite, fontSize: 10),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
