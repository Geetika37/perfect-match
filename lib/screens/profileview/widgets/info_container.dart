import 'package:flutter/material.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/utils/common_helper.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Basic Information',
          style: lexend(
            const Color(0xff97263E),
            16,
            FontWeight.w600,
          ),
        ),
        hSpace(10),
        const DetailsRow(
          textTilte: 'Name',
          text: 'Malavika Menon',
        ),
        hSpace(7),
        const DetailsRow(
          textTilte: 'Profile ID',
          text: 'PMU123645',
        ),
        hSpace(7),
        const DetailsRow(
          textTilte: 'Age',
          text: '26',
        ),
        hSpace(7),
        const DetailsRow(
          textTilte: 'Gender',
          text: 'Female',
        ),
        hSpace(7),
        const DetailsRow(
          textTilte: 'Marital Status',
          text: 'Single',
        ),
      ],
    );
  }
}




class DetailsRow extends StatelessWidget {
  const DetailsRow({
    super.key,
    required this.textTilte,
    required this.text,
  });
  final String textTilte, text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            textTilte,
            style: lexend(
                const Color.fromARGB(255, 38, 38, 38), 14, FontWeight.w300),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: lexend(const Color(0xff000000), 14, FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
