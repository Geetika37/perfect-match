import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/screens/mainscreen/view/screens/explore_page.dart';
import 'package:perfectmatch/screens/mainscreen/view/screens/profiles_page.dart';
import 'package:perfectmatch/screens/moreprofilescreen/views/more_profile.dart';
import 'package:perfectmatch/utils/common_helper.dart';

import 'package:remixicon/remixicon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);
  int maxCount = 4;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      const ProfilePage(),
      const ExplorePage(),
      const ProfilePage(),
      const MoreProfile(),
    ];

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: getDeviceHeight(context) + getDeviceTop(context),
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                  bottomBarPages.length, (index) => bottomBarPages[index]),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: AppColors.primary,
              showLabel: true,
              textOverflow: TextOverflow.visible,
              maxLine: 1,
              shadowElevation: 0,
              elevation: 0,
              kBottomRadius: 0,
              notchColor: AppColors.primary,

              removeMargins: true,
              showShadow: true,
              durationInMilliSeconds: 300,
              itemLabelStyle:
                  const TextStyle(fontSize: 10, color: Colors.white),
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Remix.team_fill,
                    color: Colors.white54,
                    size: 20,
                  ),
                  activeItem: Icon(
                    Remix.team_fill,
                    color: Colors.white,
                    size: 20,
                  ),
                  itemLabel: 'Profiles',
                ),
                BottomBarItem(
                  inActiveItem: Icon(Remix.function_add_fill,
                      size: 20, color: Colors.white54),
                  activeItem: Icon(
                    Remix.function_add_fill,
                    size: 20,
                    color: Colors.white,
                  ),
                  itemLabel: 'Explore',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Remix.message_3_fill,
                    size: 20,
                    color: Colors.white54,
                  ),
                  activeItem: Icon(
                    Remix.message_3_fill,
                    color: Colors.white,
                    size: 20,
                  ),
                  itemLabel: 'Inbox',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Remix.user_smile_fill,
                    size: 20,
                    color: Colors.white54,
                  ),
                  activeItem: Icon(
                    Remix.user_smile_fill,
                    size: 20,
                    color: Colors.white,
                  ),
                  itemLabel: 'More',
                ),
              ],
              onTap: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear,
                );
              },
              kIconSize: 20.0,
            ),
          )
        ],
      ),
      extendBody: true,
    );
  }
}
