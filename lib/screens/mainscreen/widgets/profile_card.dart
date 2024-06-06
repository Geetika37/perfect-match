
import 'package:flutter/material.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/utils/common_helper.dart';
import 'package:remixicon/remixicon.dart';

class ProfilesCard extends StatelessWidget {
  const ProfilesCard({
    super.key,
    required this.id,
    required this.name,
    required this.age,
    required this.pmId,
    required this.job,
    required this.place,
    required this.image,
    required this.onTap,
  });

  final String name, age, pmId, job, place, image;
  final int id;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(10),
        height: 450,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2)),
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 250,
                padding: const EdgeInsets.only(
                    top: 110, bottom: 10, left: 20, right: 20),
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.00, -1.00),
                    end: const Alignment(0, 1),
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(1)
                    ],
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name($age)',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                    hSpace(3),
                    Text(
                      pmId,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 11,
                        fontFamily: 'Lexend',
                        height: 0,
                      ),
                    ),
                    hSpace(2),
                    Row(
                      children: [
                        const Icon(
                          Remix.suitcase_2_fill,
                          size: 10,
                          color: Colors.white,
                        ),
                        wSpace(4),
                        Text(
                          job,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    hSpace(1),
                    Row(
                      children: [
                        const Icon(
                          Remix.map_pin_2_fill,
                          size: 10,
                          color: Colors.white,
                        ),
                        wSpace(4),
                        Text(
                          place,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    hSpace(12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundButton(
                          icon: Remix.close_fill,
                          onTap: () {},
                        ),
                        RoundButton(
                          icon: Remix.chat_1_fill,
                          onTap: () {},
                        ),
                        RoundButton(
                          icon: Remix.star_smile_fill,
                          onTap: () {},
                        ),
                        RoundButton(
                          icon: Remix.heart_add_2_fill,
                          onTap: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
