
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

import '../../../account-management/font_size/presentation/font_size_screen.dart';

class PreferredFontSizeScreen extends StatefulWidget {
  const PreferredFontSizeScreen({super.key});

  @override
  State<PreferredFontSizeScreen> createState() => _PreferredFontSizeScreenState();
}

class _PreferredFontSizeScreenState extends State<PreferredFontSizeScreen> {
  final List<String> title = [
    'Quranic Script',
    'Translation',
    'Transliteration',
  ];

  final List<String> subtitle = [
    'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
    'In the Name of Allah—the Most Compassionate, Most Merciful.',
    'Bismi Allahi alrrahmani alrraheemi',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final controller = Provider.of<UiDarkModeController>(context, listen: false);
      await controller.loadAllPreferences();
      await UiDarkModeHelper.initTheme(context);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ///============= Stepbar =================///
                      CustomStepBar(
                        isDarkText: isLight,
                        currentStep: 2,
                        onTap: () => NavigationService.goBack,
                        onSkip: () => NavigationService.navigateTo(
                            Routes.selectColorThemBackgroundScreen),
                        onStepTap: goToStep,
                      ),
                      UIHelper.verticalSpace(24.h),
                      ///================= Done =================//

                      Text(
                        'Set Your Preferred Font Size',
                        style: TextFontStyle.textStyle18w500cF9F6F0Raleway.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: isStarfield
                              ?  AppColors.cF9F6F0
                              : (UiDarkModeHelper.isDarkMode(context)
                              ? AppColors.cF9F6F0
                              : AppColors.c000000),

                        ),
                      ),
                      UIHelper.verticalSpace(12.h),
                  ///================ ListView ==============//


                  CustomFontSizeCard(title: "Quranic Script",
                          subtitle: "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
                          fontSize: controller.fontSize + (controller.sliderValues[0] * 14),
                        fontFamily:controller.getFontFamilyByIndex(
                                      controller.selectedLanguageIndex),
                        isLight: isLight,
                        sliderValues: controller.sliderValues[0],
                        sliderIndex: 0,
                      ),
                      // UIHelper.verticalSpace(24.h),

                  CustomFontSizeCard(title: "Translation",
                          subtitle: "In the Name of Allah—the Most Compassionate, Most Merciful.",
                          fontSize: controller.fontSize + (controller.sliderValues[1] * 14),

                        isLight: isLight,
                        sliderValues: controller.sliderValues[1],
                        sliderIndex: 1,
                      ),
                      // UIHelper.verticalSpace(24.h),

                  CustomFontSizeCard(title: "Transliteration",
                          subtitle: "Bismi Allahi alrrahmani alrraheemiِ",
                          fontSize: controller.fontSize + (controller.sliderValues[2] * 14),

                        isLight: isLight,
                        sliderValues: controller.sliderValues[2],
                        sliderIndex: 2,
                      ),

                      ///==================== Done =================///

                      _buildNextButton(context, controller),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
 

  Widget _buildNextButton(BuildContext context, UiDarkModeController controller) {
    
    return CustomPersonalizationButton(
      text: 'Next',
      onPressed: () async {
        await controller.saveFontSize(controller.fontSize);
        await controller.saveSliderValues();
        NavigationService.navigateTo(Routes.selectQariForRecitationScreen);
      },
    );
  }
  void goToStep(int index) {
  }
}
