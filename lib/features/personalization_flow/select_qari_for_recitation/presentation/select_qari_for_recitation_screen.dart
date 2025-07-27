import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/features/personalization_flow/widget_step/custom_stepbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class SelectQariForRecitationScreen extends StatefulWidget {
  const SelectQariForRecitationScreen({super.key});

  @override
  State<SelectQariForRecitationScreen> createState() =>
      _SelectQariForRecitationScreenState();
}

class _SelectQariForRecitationScreenState
    extends State<SelectQariForRecitationScreen> {
  int selectedIndex = -1;


  final List<Map<String, String>> qariData = [
    {'name': 'Saad Al Ghamdi', 'image': 'assets/images/saadall.png'},
    {'name': 'Khalil-Husari', 'image': 'assets/images/khalilImage.png'},
    {'name': 'Abdul Basit', 'image': 'assets/images/abdulImage.png'},
    {'name': 'Tawfeeq As-Sayegh', 'image': 'assets/images/sayeghImage.png'},
    {'name': 'Saad Al Ghamdi', 'image': 'assets/images/saadall.png'},
    {'name': 'Khalil-Husari', 'image': 'assets/images/khalilImage.png'},
    {'name': 'Abdul Basit', 'image': 'assets/images/abdulImage.png'},
    {'name': 'Tawfeeq As-Sayegh', 'image': 'assets/images/sayeghImage.png'},
    {'name': 'Saad Al Ghamdi', 'image': 'assets/images/saadall.png'},
    {'name': 'Khalil-Husari', 'image': 'assets/images/khalilImage.png'},
    {'name': 'Abdul Basit', 'image': 'assets/images/abdulImage.png'},
    {'name': 'Tawfeeq As-Sayegh', 'image': 'assets/images/sayeghImage.png'},

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
                  children: [
                    CustomStepBar(
                      isDarkText: isLight,
                      currentStep: 3,
                      onTap: () {
                        NavigationService.goBack;
                      },
                      onSkip: () {
                        NavigationService.navigateTo(Routes.selectColorThemBackgroundScreen);
                      },
                      onStepTap: (index) => goToStep(index),
                    ),
                    UIHelper.verticalSpace(16.h),
                    Text(
                      'Select a Qari for Recitation',
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
                    UIHelper.verticalSpace(16.h),
                    Expanded(
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: qariData.length,
                        itemBuilder: (BuildContext context, int index) {
                          bool isSelected = selectedIndex == index;

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

                          debugPrint('Rendering Qari: ${qariData[index]['name']}');
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 12.h),
                              padding: EdgeInsets.all(8.w),
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
                              child: Row(
                                children: [
                                  Image.asset(
                                    qariData[index]['image']!,
                                    height: 59.h,
                                    width: 59.w,
                                    errorBuilder: (context, error, stackTrace) {
                                      debugPrint(
                                          'Image load failed for: ${qariData[index]['image']}');
                                      return Icon(
                                        Icons.error,
                                        size: 59.h,
                                        color: Colors.red,
                                      );
                                    },
                                  ),
                                  UIHelper.horizontalSpace(10.w),
                                  Expanded(
                                    child: Text(
                                      qariData[index]['name']!,
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 18.sp,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w500,
                                        height: 1.64,
                                      ),
                                    ),
                                  ),
                                ],
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
                        NavigationService.navigateTo(
                            Routes.selectTafsirUnderstandingScreen);
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