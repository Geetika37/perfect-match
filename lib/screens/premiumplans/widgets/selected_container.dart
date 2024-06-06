import 'package:flutter/material.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';

class ContainerSelected extends StatelessWidget {
  const ContainerSelected({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.monthly,
  });
  final String title;
  final String subTitle;
  final String price;
  final String monthly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.13,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
          gradient: const LinearGradient(
            colors: [
              Color(0xffF05E87),
              Color(0xffF58FAC),
              Color.fromARGB(255, 114, 84, 92),
              Color.fromARGB(255, 60, 59, 59),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFF588A5),
                    Color(0xFFE8B8C7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: lexend(Colors.white, 18, FontWeight.w800),
                        ),
                        Text(
                          subTitle,
                          style: lexend(Colors.white, 10, FontWeight.w400),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            price,
                            style: lexend(const Color.fromARGB(255, 0, 0, 0),
                                14, FontWeight.w600),
                          ),
                          Text(
                            monthly,
                            style: lexend(Colors.white, 8, FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
