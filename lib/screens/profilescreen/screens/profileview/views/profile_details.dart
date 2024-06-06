import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/profilescreen/screens/profileview/widgets/info_container.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/utils/common_helper.dart';
import 'package:perfectmatch/utils/image_helper.dart';

import 'package:remixicon/remixicon.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff97263E),
            )),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Profile Details',
            style: lexend(
              const Color(0xff97263E),
              16,
              FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 450,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        width: 1, color: Colors.grey.withOpacity(0.2)),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage(getAssetImage('girlimage')),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                        ),
                      ),
                    ),
                    Positioned(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundButton(
                            icon: Remix.close_fill,
                            onTap: () {},
                          ),
                          InkWell(
                            onTap: () {},
                            child: Image.asset(getAssetImage('moreicon')),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              hSpace(10),
              const InfoContainer(),
              hSpace(30),
              const InfoContainer(),
              hSpace(30),
              const InfoContainer(),
              hSpace(30),
              const InfoContainer(),
            ],
          ),
        ),
      ),
    ));
  }
}

