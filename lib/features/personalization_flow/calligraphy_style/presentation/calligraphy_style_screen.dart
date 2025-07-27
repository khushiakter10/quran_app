import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/features/personalization_flow/sign_up_preferred_language/widget/custom_language_selection_title.dart';
import 'package:quran_app/features/personalization_flow/widget_step/custom_stepbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class CalligraphyStyleScreen extends StatefulWidget {
  const CalligraphyStyleScreen({super.key});

  @override
  State<CalligraphyStyleScreen> createState() => _CalligraphyStyleScreenState();
}

class _CalligraphyStyleScreenState extends State<CalligraphyStyleScreen> {
  int selectedLanguageIndex = -1;

  final List<String> title = [
    'Madina',
    'Amiri Quran',
    'Kitab Regular (Tajweed)',
    'Word by Word Quran',
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
    // Listen to theme changes using Provider
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
                      currentStep: 1,
                      onTap: () {
                        NavigationService.goBack;
                      },
                      onSkip: () {
                        NavigationService.navigateTo(Routes.selectColorThemBackgroundScreen);
                      },
                      onStepTap: (index) => goToStep(index),
                    ),
                    Text(
                      'Choose Quran Calligraphy Style',
                      style: TextStyle(
                        color: isStarfield
                            ? const Color(0xFFF9F6F0)
                            : (UiDarkModeHelper.isDarkMode(context)
                                ? Colors.white
                                : Colors.black),
                        fontSize: 24.sp,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                        height: 1.32,
                      ),
                    ),
                    UIHelper.verticalSpace(24.h),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: title.length,
                      separatorBuilder: (context, index) =>
                          UIHelper.verticalSpace(8.h),
                      itemBuilder: (context, index) {
                        bool isSelected = selectedLanguageIndex == index;
                        return CustomLanguageSelectionTitle(
                          title: title[index],
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              selectedLanguageIndex = index;
                            });
                          },
                        );
                      },
                    ),
                    UIHelper.verticalSpace(37.h),
                    DottedBorder(
                      color: AppColors.c72BBFF,
                      strokeWidth: 1,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(8),
                      dashPattern: [6, 3],
                      child: Container(
                        width: 327,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.h, vertical: 32.w),
                        decoration: BoxDecoration(
                          gradient: isStarfield
                              ? null
                              : UiDarkModeHelper.getCurrentGradient(context),
                          color: const Color(0x66061420),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            ' بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                            textAlign: TextAlign.center,

                            style: TextStyle(
                              color: isStarfield
                                  ? const Color(0xFF72BBFF)
                                  : (UiDarkModeHelper.isDarkMode(context)
                                      ? Colors.blue
                                      : Colors.black),
                              fontSize: 16.sp,
                              fontFamily: 'Amiri Quran',
                              fontWeight: FontWeight.w400,
                              height: 1.32,
                            ),

                            // style: TextStyle(
                            //   color: const Color(0xFF72BBFF),
                            //   fontSize: 16,
                            //   fontFamily: 'Amiri Quran',
                            //   fontWeight: FontWeight.w400,
                            // ),
                          ),
                        ),
                      ),
                    ),
                     Spacer(),
                    CustomPersonalizationButton(
                      text: 'Next',
                      onPressed: () {
                        NavigationService.navigateTo(
                            Routes.preferredFontSizeScreen);
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
