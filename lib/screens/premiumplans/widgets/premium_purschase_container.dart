
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/screens/premiumplans/widgets/selected_container.dart';
import 'package:perfectmatch/screens/premiumplans/widgets/unselected_container.dart';

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
