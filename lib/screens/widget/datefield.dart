
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:perfectmatch/constants/app_colors.dart';

class DropdownTextwithTitle extends StatelessWidget {
  const DropdownTextwithTitle({
    super.key,
    required this.title,
    required this.hint,
    this.keyboardType,
    required this.icon,
    required this.onTap,
    this.textValue = "",
    this.margin = 0,
  });

  final String title, hint, textValue;
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
                          fontWeight: FontWeight.w300,
                          color: textValue.isNotEmpty
                              ? Colors.black
                              : Colors.black12,
                          height: 1.1)),
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