import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/features/community/community/presentation/community_screen.dart';
import 'package:quran_app/features/home_screen/presentation/home_screen.dart';
import 'package:quran_app/features/learning/learning_one/presentation/learning_one_screen.dart';
import 'package:quran_app/features/profile/profile/presentation/profile_screen.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';








class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();

  final List<Widget> screens = [
    HomeScreen(),
    LearningOneScreen(),
    CommunityScreen (),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Scaffold(
      extendBody: true,
      body: PageStorage(
        bucket: bucket,
        child: screens[currentTab],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.c1C2E3F,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          child: BottomNavigationBar(
            backgroundColor:   isLight ? AppColors.cFFFFFF : AppColors.c1C2E3F,



            type: BottomNavigationBarType.fixed,
            currentIndex: currentTab,
            onTap: (index) {
              setState(() {
                currentTab = index;
              });
            },
            selectedFontSize: 12,
            unselectedFontSize: 12,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.homeunactive,
                      color: currentTab == 0
                          ? AppColors.c72BBFF
                          : AppColors.c969696,
                      height: 24,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: currentTab == 0
                            ? Colors.lightBlueAccent
                            : AppColors.c969696,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.book,
                      color: currentTab == 1
                          ? AppColors.c72BBFF
                          : AppColors.c969696,
                      height: 24,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Learning',
                      style: TextStyle(
                        color: currentTab == 1
                            ? Colors.lightBlueAccent
                            : AppColors.c969696,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.communityUnActive,
                      color: currentTab == 2
                          ? AppColors.c72BBFF
                          : AppColors.c969696,
                      height: 24,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Community',
                      style: TextStyle(
                        color: currentTab == 2
                            ? Colors.lightBlueAccent
                            : AppColors.c969696,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.profileUnActive,
                      color: currentTab == 3
                          ? AppColors.c72BBFF
                          : AppColors.c969696,
                      height: 24,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: currentTab == 3
                            ? Colors.lightBlueAccent
                            : AppColors.c969696,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
