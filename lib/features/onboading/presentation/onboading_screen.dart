

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/common_widgets/custom_button.dart';
import 'package:quran_app/constants/app_constants.dart';
import 'package:quran_app/features/auth/login/presentation/login_screen.dart';
import 'package:quran_app/features/onboading/widgets/onboarding_card1.dart';
import 'package:quran_app/features/onboading/widgets/onboarding_card2.dart';
import 'package:quran_app/features/onboading/widgets/onboarding_card3.dart';
import 'package:quran_app/helpers/di.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  final List<Widget> _onboardingPages = [
    const OnboardingCard1(),
    const OnboardingCard2(),
    const OnboardingCard3(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageIndex = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Onboarding Pages
          PageView(
            controller: _pageController,
            children: _onboardingPages,
          ),


          Positioned(
            top: 45,
            right: 45,
            child: GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.c000000,
                ),
              ),
            ),
          ),


          Positioned(
            bottom: 120.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                SmoothPageIndicator(
                  controller: _pageController,
                  count: _onboardingPages.length,
                  effect: ExpandingDotsEffect(
                    dotWidth: 5.0,
                    dotHeight: 8.0,
                    activeDotColor: AppColors.c72BBFF,
                    dotColor: AppColors.cFFFFFF,
                  ),
                ),

              ],
            ),
          ),

          Positioned(
            bottom: 24.h,
            left: 0,
            right: 0,
            child: _currentPageIndex == 2
                ? Padding(
              padding:  EdgeInsets.all(16.sp),
              child: CustomButton(
                borderRadius: 80.r,
                name: 'Continue',
                minWidth: 150.w,
                color: AppColors.cFFB703,
                textStyle:TextFontStyle.textStyle14w500c000000Raleway.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                ),
                onCallBack: () {
                  print("?????????????????????????? hello ");
                  appData.write(kKeyIsFirstTime,false);

                  Get.to(LoginScreen());
                },
                context: context,
              ),
            )
                : Padding(
              padding:  EdgeInsets.all(16.0.sp),
              child: GestureDetector(
                  onTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: CustomButton(
                    borderRadius: 80.r,
                    name: "Continue",
                    textStyle:TextFontStyle.textStyle14w500c000000Raleway.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700
                    ),

                    onCallBack: (){
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );

                    }, context: context,color: AppColors.cFFB703,)
              ),
            ),
          ),
        ],
      ),
    );
  }


}