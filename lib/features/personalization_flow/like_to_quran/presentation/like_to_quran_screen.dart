

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/features/personalization_flow/widget_step/custom_stepbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class LikeToQuranScreen extends StatefulWidget {
  const LikeToQuranScreen({super.key});

  @override
  State<LikeToQuranScreen> createState() => _LikeToQuranScreenState();
}

class _LikeToQuranScreenState extends State<LikeToQuranScreen> {
  int selectedLanguageIndex = -1;

  final List<String> title = [
    'Juz Style',
    'Scroll Style',
    'Verse-by-Verse',
    'Word-for-Word',
  ];

  final List<String> subtitle = [
    '(Page-flipping like a book)',
    '(Scroll down continuously)',
    '(One verse per screen)',
    '(Word translation)',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<UiDarkModeController>(
        builder: (context, controller, child) {
          final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
          final isLightMode = UiDarkModeHelper.isLightMode(context);
          final isDarkMode = UiDarkModeHelper.isDarkMode(context);
          final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;

          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: isStarfield
                    ? DecorationImage(
                  image: AssetImage(AppImages.personalizationbacroundImage),
                  fit: BoxFit.cover,
                )
                    : null,
                gradient:
                isStarfield ? null : UiDarkModeHelper.getCurrentGradient(context),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomStepBar(
                        isDarkText: isLightMode,
                        currentStep: 5,
                        onTap: () => NavigationService.goBack(),
                        onSkip: () => NavigationService.navigateTo(
                            Routes.selectColorThemBackgroundScreen),
                        onStepTap: (index) => {},
                      ),
                      UIHelper.verticalSpace(24.h),
                      Text(
                        'How would you like to read the Quran?',
                        style: TextFontStyle.textStyle18w500cF9F6F0Raleway.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: isStarfield
                              ? AppColors.cF9F6F0
                              : (isDarkMode
                              ? AppColors.cF9F6F0
                              : AppColors.c000000),
                        ),
                      ),
                      UIHelper.verticalSpace(32.h),
                      Expanded(
                        child: ListView.builder(
                          itemCount: title.length,
                          itemBuilder: (context, index) {
                            final isSelected = selectedLanguageIndex == index;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedLanguageIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 12.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 16.h),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? (isLightMode
                                      ? Colors.blue.withOpacity(0.1)
                                      : Colors.black.withOpacity(0.1))
                                      : (isLightMode
                                      ? Colors.white
                                      : Color(0x66061420)),
                                  borderRadius: BorderRadius.circular(80.r),
                                  border: Border.all(
                                    color: isSelected
                                        ? Color(0xFF72BBFF)
                                        : (isLightMode
                                        ? Colors.grey.withOpacity(0.2)
                                        : AppColors.c304F6B),
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title[index],
                                      style: TextFontStyle
                                          .textStyle18w500cF9F6F0Raleway
                                          .copyWith(color: isSelected ? Color(0xFF72BBFF) : isLightMode ? Colors.black : Colors.white),
                                    ),
                                    Text(
                                      subtitle[index],
                                      style: TextFontStyle
                                          .textStyle18w500cF9F6F0Raleway
                                          .copyWith(
                                        color: isSelected ? Color(0xFF72BBFF) : Colors.white70,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      CustomPersonalizationButton(
                        text: 'Next',
                        onPressed: () {
                          if (selectedLanguageIndex >= 0) {
                            controller
                                .saveSelectedReadingType(title[selectedLanguageIndex]);
                          }
                          NavigationService.navigateTo(
                              Routes.selectColorThemBackgroundScreen);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
