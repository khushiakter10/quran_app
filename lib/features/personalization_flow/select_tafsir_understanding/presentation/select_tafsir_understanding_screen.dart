import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/personalization_flow/widget_step/custom_stepbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

import '../../../../common_widgets/custom_personalization_button.dart';

class SelectTafsirUnderstandingScreen extends StatefulWidget {
  const SelectTafsirUnderstandingScreen({super.key});

  @override
  State<SelectTafsirUnderstandingScreen> createState() =>
      _SelectTafsirUnderstandingScreenState();
}

class _SelectTafsirUnderstandingScreenState
    extends State<SelectTafsirUnderstandingScreen> {
  int selectedLanguageIndex = -1;

  // Consolidated and unique data lists
  final List<String> tafsirDeeperData = [
    'Tafsir Al-Jalalayn',
    'Tafsir Ibn Kathir',
    'Ma ariful Quran',
    'Al Mazhari',
    'Tafsir Al-Jalalayn',
    'Tafsir Ibn Kathir',
    'Ma ariful Quran',
    'Al Mazhari',
    'Tafsir Al-Jalalayn',
    'Tafsir Ibn Kathir',
    'Ma ariful Quran',
    'Al Mazhari',
    'Tafsir Al-Jalalayn',
    'Tafsir Ibn Kathir',
    'Ma ariful Quran',
    'Al Mazhari',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await UiDarkModeHelper.initTheme(context);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // Check for light mode, dark mode, and starfield mode
    bool isLightMode = UiDarkModeHelper.isLightMode(context);
    bool isDarkMode = UiDarkModeHelper.isDarkMode(context);

    return Consumer<UiDarkModeController>(
      builder: (context, controller, child) {
        final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
        final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
        final isLight = currentTheme == UiDarkModeHelper.lightTheme;

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
              gradient: isStarfield
                  ? null
                  : UiDarkModeHelper.getCurrentGradient(context),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomStepBar(
                      isDarkText: isLight,
                      currentStep: 4,
                      onTap: () {
                        NavigationService.goBack;
                      },
                      onSkip: () {
                        NavigationService.navigateTo(Routes.selectColorThemBackgroundScreen);
                      },
                      onStepTap: (index) => goToStep(index),
                    ),
                    UIHelper.verticalSpace(24.h),
                    Text(
                      'Select Tafsir for Deeper Understanding',
                      style: TextStyle(
                        color: isStarfield
                            ? const Color(0xFFF9F6F0)
                            : (isDarkMode ? Colors.white : Colors.black),
                        fontSize: 24.sp,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                        height: 1.32,
                      ),
                    ),
                    UIHelper.verticalSpace(24.h),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: tafsirDeeperData.length,
                        separatorBuilder: (context, index) =>
                            UIHelper.verticalSpace(8.h),
                        itemBuilder: (context, index) {
                          bool isSelected = selectedLanguageIndex == index;

                          // Define colors and shadow based on theme and selection
                          Color backgroundColor;
                          Color borderColor;
                          Color textColor;
                          List<BoxShadow> boxShadow;

                          if (isLightMode) {
                            // Light mode color settings
                            backgroundColor = isSelected
                                ? Colors.blue.withOpacity(0.1)
                                : Colors.white;
                            borderColor = isSelected
                                ? const Color(0xFF72BBFF)
                                : Colors.grey.withOpacity(0.2);
                            textColor = isSelected ? Colors.blue : Colors.black;
                            boxShadow = isSelected
                                ? [
                              BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                                : [];
                          } else if (isDarkMode) {
                            // Dark mode color settings
                            backgroundColor = isSelected
                                ? Colors.black.withOpacity(0.1)
                                : Colors.black.withOpacity(0.1);
                            borderColor = isSelected
                                ? const Color(0xFF72BBFF)
                                : const Color(0xFF304F6B);
                            textColor = isSelected
                                ? const Color(0xFF72BBFF)
                                : Colors.white;
                            boxShadow = [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ];
                          } else {
                            // Starfield mode color settings
                            backgroundColor = isSelected
                                ? Colors.black.withOpacity(0.1)
                                : Colors.black.withOpacity(0.1);
                            borderColor = isSelected
                                ? const Color(0xFF72BBFF)
                                : const Color(0xFF304F6B);
                            textColor = isSelected
                                ? const Color(0xFF72BBFF)
                                : const Color(0xFFF9F6F0);
                            boxShadow = [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ];
                          }

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedLanguageIndex = index;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              height: 62.h,
                              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                              decoration: ShapeDecoration(
                                shadows: boxShadow,
                                color: backgroundColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2,
                                    color: borderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(80.r),
                                ),
                              ),
                              child: Text(
                                tafsirDeeperData[index],
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 18.sp,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w500,
                                  height: 1.64,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    UIHelper.verticalSpace(16.h),
                    CustomPersonalizationButton(
                      text: 'Next',
                      onPressed: () {
                        NavigationService.navigateTo(Routes.likeToQuranScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void goToStep(int index) {
    // Navigation logic
  }
}