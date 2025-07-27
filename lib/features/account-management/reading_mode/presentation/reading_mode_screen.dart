import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class ReadingModeScreen extends StatefulWidget {
  const ReadingModeScreen({super.key});

  @override
  State<ReadingModeScreen> createState() => _ReadingModeScreenState();
}

class _ReadingModeScreenState extends State<ReadingModeScreen> {
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

                    CustomAppbarWidget(
                      showIcon: false,
                      text: 'Reading Mode',
                      onTap: () {
                        NavigationService.goBack();
                      },
                    ),
                    UIHelper.verticalSpace(41.h),
                    Text(
                      'How would you like to read the Quran?',
                      style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                        color: isStarfield
                            ? const Color(0xFFF9F6F0)
                            : (isDarkMode ? Colors.white : Colors.black),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    UIHelper.verticalSpace(17.h),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: title.length,
                        itemBuilder: (BuildContext context, int index) {
                          final bool isSelected = selectedLanguageIndex == index;

                          // Define colors and shadow based on theme and selection
                          Color backgroundColor;
                          Color borderColor;
                          Color textColor;
                          Color subtitleColor;
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
                            subtitleColor =
                            isSelected ? Colors.blue : Colors.black54;
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
                                : const Color(0x66061420);
                            borderColor = isSelected
                                ? const Color(0xFF72BBFF)
                                : AppColors.c304F6B;
                            textColor = isSelected
                                ? const Color(0xFF72BBFF)
                                : Colors.white;
                            subtitleColor = isSelected
                                ? const Color(0xFF72BBFF)
                                : Colors.white70;
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
                                : const Color(0x66061420);
                            borderColor = isSelected
                                ? const Color(0xFF72BBFF)
                                : AppColors.c304F6B;
                            textColor = isSelected
                                ? const Color(0xFF72BBFF)
                                : const Color(0xFFF9F6F0);
                            subtitleColor = isSelected
                                ? const Color(0xFF72BBFF)
                                : Colors.white70;
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
                              margin: EdgeInsets.only(bottom: 12.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 16.h),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title[index],
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 18.sp,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w500,
                                      height: 1.64,
                                    ),
                                  ),
                                  Text(
                                    subtitle[index],
                                    style: TextStyle(
                                      color: subtitleColor,
                                      fontSize: 16.sp,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w500,
                                      height: 1.64,
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
                      text: 'Save',
                      onPressed: () {
                        NavigationService.navigateTo(Routes.settingsScreen);
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