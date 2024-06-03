import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';

class PremiumPurchaseContainer extends StatefulWidget {
  const PremiumPurchaseContainer({
    super.key,
  });

  @override
  State<PremiumPurchaseContainer> createState() =>
      _PremiumPurchaseContainerState();
}

class _PremiumPurchaseContainerState extends State<PremiumPurchaseContainer> {
  var onPressed1 = false;
  var onPressed2 = false;
  var onPressed3 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // container 1
        InkWell(
          onTap: () {
            HapticFeedback.heavyImpact();
            setState(() {
              onPressed1 = !onPressed1;
              onPressed2 = false;
              onPressed3 = false;
            });
          },
          child: onPressed1
              ? const ContainerSelected(
                  title: 'Find Your Forever',
                  subTitle: 'Enjoy Unlimited Features and Exclusive Perks!',
                  price: '₹4,500',
                  monthly: 'monthly',
                )
              : const ContainerUnSelected(
                  bgColor: Color.fromARGB(255, 45, 45, 45),
                  title: 'Find Your Forever',
                  subTitle: 'Enjoy Unlimited Features and Exclusive Perks!',
                  price: '₹4,500',
                  plan: 'monthly',
                  textColor: Color.fromARGB(255, 254, 202, 221),
                ),
        ),
        SizedBox(height: screenHeight * 0.01),

        // container 2

        InkWell(
          onTap: () {
            HapticFeedback.heavyImpact();

            setState(() {
              onPressed2 = !onPressed2;
              onPressed1 = false;
              onPressed3 = false;
            });
          },
          child: onPressed2
              ? const ContainerSelected(
                  title: 'Experience Romance',
                  subTitle: 'Get Enhanced Visibility and Priority Support!',
                  price: '₹1,999',
                  monthly: 'monthly')
              : const ContainerUnSelected(
                  bgColor: Color(0xff3F3F3F),
                  subTitle: 'Get Enhanced Visibility and Priority Support!',
                  title: 'Experience Romance',
                  price: '₹1,999',
                  plan: 'monthly',
                  textColor: Color(0xffFDD7E4),
                ),
        ),
        SizedBox(height: screenHeight * 0.01),

        // container 3

        InkWell(
          onTap: () {
            HapticFeedback.heavyImpact();

            setState(() {
              onPressed3 = !onPressed3;
              onPressed1 = false;
              onPressed2 = false;
            });
          },
          child: onPressed3
              ? const ContainerSelected(
                  title: 'Discover Love',
                  subTitle: 'Unlock More Matches and Messages!',
                  price: '₹599',
                  monthly: 'monthly')
              : const ContainerUnSelected(
                  bgColor: Color(0xff2D2C2C),
                  subTitle: 'Unlock More Matches and Messages!',
                  title: 'Discover Love',
                  price: '₹599',
                  plan: 'monthly',
                  textColor: Color(0xFFFDD7E4),
                ),
        ),
      ],
    );
  }
}

class ContainerUnSelected extends StatelessWidget {
  const ContainerUnSelected({
    super.key,
    required this.bgColor,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.plan,
    required this.textColor,
  });
  final Color bgColor;
  final Color textColor;

  final String title;
  final String subTitle;
  final String price;
  final String plan;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.13,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
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
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: lexend(textColor, 16, FontWeight.w600),
                        ),
                        Text(
                          subTitle,
                          style: lexend(textColor, 10, FontWeight.w400),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            price,
                            style: lexend(textColor, 14, FontWeight.w600),
                          ),
                          Text(
                            plan,
                            style: lexend(textColor, 8, FontWeight.w600),
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
