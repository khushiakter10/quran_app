
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

class FontSizeScreen extends StatefulWidget {
  const FontSizeScreen({super.key});

  @override
  State<FontSizeScreen> createState() => _FontSizeScreenState();
}

class _FontSizeScreenState extends State<FontSizeScreen> {
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















class CustomFontSizeCard extends StatelessWidget {
  const CustomFontSizeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isLight,
    required this.fontSize,
    required this.sliderValues,
    this.fontFamily,
    this.sliderIndex,
  });

  final String title;
  final String subtitle;
  final bool isLight;
  final double fontSize;
  final double sliderValues;
  final String? fontFamily;
  final dynamic sliderIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<UiDarkModeController>(
        builder: (context, controller, child) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: ShapeDecoration(
              color: isLight ? AppColors.cFFFFFF :  Color(0x66061420),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: isLight ? AppColors.cE8E8E8 :  Color(0xFF304F6B),
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextFontStyle.textStyle18w500cF9F6F0Raleway.copyWith(
                    color: isLight ? AppColors.c000000 :  AppColors.cF9F6F0,
                    fontWeight: FontWeight.w600,

                  ),
                ),
                UIHelper.verticalSpace(12.h),



                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    subtitle,
                    // textAlign: TextAlign.end,
                    style: TextFontStyle.textStyle16w500B8B8B8Raleway.copyWith(
                      color: isLight ? Colors.black :  Color(0xFFB8B8B8),
                      fontSize:fontSize ,
                      fontFamily:fontFamily,
                    ),
                    // textDirection: index == 0 ? TextDirection.rtl : TextDirection.ltr,
                  ),
                ),



                UIHelper.verticalSpace(12.h),
                Row(
                  children: [
                    Text(
                      'T',
                      style: TextFontStyle.textStyle16w500B8B8B8Raleway.copyWith(
                        fontSize: 12.sp,
                        color: isLight ? AppColors.c000000 :  AppColors.cB8B8B8,

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
                          value: sliderValues,
                          min: 0.0,
                          max: 1.0,
                          onChanged: (newValue) => controller.updateSingleSlider(sliderIndex, newValue),
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpace(8.w),
                    Text(
                      'T',
                      style: TextFontStyle.textStyle16w500B8B8B8Raleway.copyWith(
                        color: isLight ? AppColors.c000000 :  AppColors.cB8B8B8,
                        fontSize: 20.sp,

                      ),
                    ),
                  ],
                ),
              ],
            ),);
        } );
  }
}









