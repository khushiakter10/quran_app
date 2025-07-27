

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/features/personalization_flow/widget_step/custom_stepbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';



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
      await controller.initialize();
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
                child: Column(
                  children: [
                    CustomStepBar(
                      isDarkText: isLight,
                      currentStep: 2,
                      onTap: () => NavigationService.goBack(),
                      onSkip: () => NavigationService.navigateTo(
                          Routes.selectColorThemBackgroundScreen),
                      onStepTap: goToStep,
                    ),
                    UIHelper.verticalSpace(24.h),
                    Text(
                      'Set Your Preferred Font Size',
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
                    UIHelper.verticalSpace(32.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: title.length,
                        itemBuilder: (context, index) => _buildFontSizeOption(
                            context, index, controller, isLight),
                      ),
                    ),
                    UIHelper.verticalSpace(24.h),
                    _buildNextButton(context, controller),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFontSizeOption(
      BuildContext context,
      int index,
      UiDarkModeController controller,
      bool isLight
      ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: ShapeDecoration(
        color: isLight ? Colors.white : const Color(0x66061420),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: isLight ? Colors.grey : const Color(0xFF304F6B),
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title[index],
            style: TextStyle(
              color: isLight ? Colors.black : const Color(0xFFF9F6F0),
              fontSize: 18.sp,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
              height: 1.64,
            ),
          ),
          UIHelper.verticalSpace(12.h),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              subtitle[index],
              style: TextStyle(
                color: isLight ? Colors.black : const Color(0xFFB8B8B8),
                fontSize: controller.fontSize + (controller.sliderValues[index] * 14),
                fontFamily: index == 0 ? 'Amiri Quran' : 'Raleway',
                fontWeight: FontWeight.w500,
                height: 1.64,
              ),
              textDirection: index == 0 ? TextDirection.rtl : TextDirection.ltr,
            ),
          ),
          UIHelper.verticalSpace(12.h),
          Row(
            children: [
              Text(
                'A',
                style: TextStyle(
                  color: isLight ? Colors.black : const Color(0xFFB8B8B8),
                  fontSize: 12.sp,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  height: 1.64,
                ),
              ),
              UIHelper.horizontalSpace(8.w),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 5.h,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.r),
                    overlayShape: SliderComponentShape.noOverlay,
                    activeTrackColor: AppColors.c72BBFF,
                    inactiveTrackColor: AppColors.cE8E8E8,
                    thumbColor: AppColors.c72BBFF,
                  ),
                  child: Slider(
                    value: controller.sliderValues[index],
                    min: 0.0,
                    max: 1.0,
                    onChanged: (newValue) => controller.updateSingleSlider(index, newValue),
                  ),
                ),
              ),
              UIHelper.horizontalSpace(8.w),
              Text(
                'A',
                style: TextStyle(
                  color: isLight ? Colors.black : const Color(0xFFB8B8B8),
                  fontSize: 20.sp,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  height: 1.64,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton(BuildContext context, UiDarkModeController controller) {
    return CustomPersonalizationButton(
      text: 'Next',
      onPressed: () async {
        // Save current values
        await controller.saveFontSize(controller.fontSize);
        await controller.saveSliderValues();

        // Navigate to next screen
        NavigationService.navigateTo(Routes.selectQariForRecitationScreen);
      },
    );
  }

  void goToStep(int index) {
    // Handle step navigation if needed
  }
}