import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/search/views/search_page.dart';
import 'package:perfectmatch/screens/testimonial/views/widgets/testimonial_container.dart';
import 'package:perfectmatch/screens/widget/custom_appbar.dart';


class Testimonial extends StatelessWidget {
  const Testimonial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
        child: CustomAppBar(
          onPressed: () {
            HapticFeedback.heavyImpact();
            Get.back();
          },
          text: 'Success Stories',
          iconColor: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TestimonialImageContainer(
                  image: 'pure_joy',
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(
                  'Emma and John"s love story began with a simple swipe on the Perfect Match app. Emma, a vibrant graphic designer from New York, was initially hesitant about online dating. John, an adventurous travel photographer from San Francisco, had been looking for someone who shared his passion for exploring the world.Their profiles matched one sunny afternoon, and they quickly realized they had an instant connection. Their first conversation was filled with laughter and shared interests, from their favorite cuisines to their dream travel destinations.After weeks of chatting and video calls, they decided to meet in person. John flew to New York, and their first date was at a cozy café downtown. They spent hours talking, and it felt like they had known each other for years.As months passed, their bond grew stronger. They traveled together, exploring new places and making unforgettable memories. From the beaches of Hawaii to the mountains of Switzerland, every adventure brought them closer.Today, Emma and John are happily engaged and planning their wedding. They often reflect on how Perfect Match brought them together, grateful for the chance to find true love in the digital age.Emma says: "I never imagined I would find my soulmate online, but Perfect Match made it possible. John is everything I ever dreamed of and more."John adds: "Meeting Emma was the best thing that ever happened to me. Thanks to Perfect Match, I found my perfect partner to share my life and adventures with."',
                  style: lexend(Colors.black, 12, FontWeight.w400),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                ButtonNormal(
                  textSize: 15,
                  fontWeight: FontWeight.w500,
                  radius: 10,
                  height: screenHeight * 0.06,
                  width: screenWidth,
                  iconOrImage: const Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                  ),
                  text: 'Share',
                  onTap: () {
                    HapticFeedback.heavyImpact();
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
