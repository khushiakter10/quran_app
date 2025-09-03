
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
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
                    // Step bar
                    CustomStepBar(
                      isDarkText: isLight,
                      currentStep: 1,
                      onTap: () {
                        NavigationService.goBack;
                      },
                      onSkip: () {
                        NavigationService.navigateTo(
                            Routes.selectColorThemBackgroundScreen);
                      },
                      onStepTap: (index) => goToStep(index),
                    ),
                    UIHelper.verticalSpace(24.h),

                    Text(
                      'Choose Quran Calligraphy Style',
                      style: TextFontStyle.textStyle18w500cF9F6F0Raleway.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: isStarfield
                            ? AppColors.cF9F6F0
                            : (UiDarkModeHelper.isDarkMode(context)
                            ? AppColors.cF9F6F0
                            : AppColors.c000000),
                      ),
                    ),
                    UIHelper.verticalSpace(24.h),

                    // List of fonts - wrap with Expanded to avoid overflow
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.title.length,
                        separatorBuilder: (context, index) =>
                            UIHelper.verticalSpace(8.h),
                        itemBuilder: (context, index) {
                          bool isSelected = controller.selectedLanguageIndex == index;
                          return CustomLanguageSelectionTitle(
                            title: controller.title[index],
                            isSelected: isSelected,
                            onTap: () {
                              setState(() {
                                controller.selectedLanguageIndex = index;
                              });
                            },
                          );
                        },
                      ),
                    ),

                    UIHelper.verticalSpace(37.h),

                    // Dotted border with preview text using selected font family
                    DottedBorder(
                      color: AppColors.c72BBFF,
                      strokeWidth: 1,
                      borderType: BorderType.RRect,
                      radius: Radius.circular(8.r),
                      dashPattern: [6, 3],
                      child: Container(
                        width: 327,
                        padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 32.w),
                        decoration: BoxDecoration(
                          gradient: isStarfield
                              ? null
                              : UiDarkModeHelper.getCurrentGradient(context),
                          color: const Color(0x66061420),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                            textAlign: TextAlign.center,
                            style: TextFontStyle.textStyle16w600c060606Madina.copyWith(
                              fontSize: 25,

                              fontFamily: controller.getFontFamilyByIndex(
                                  controller.selectedLanguageIndex),
                              color: isStarfield
                                  ? AppColors.c72BBFF
                                  : (UiDarkModeHelper.isDarkMode(context)
                                  ? AppColors.c72BBFF
                                  : AppColors.c000000),
                            ),
                          ),
                        ),
                      ),
                    ),

                    UIHelper.verticalSpace(20.h),

                    CustomPersonalizationButton(
                      text: 'Next',
                      onPressed: () async{
                        await controller.saveFontFamily(controller.getFontFamilyByIndex(
                            controller.selectedLanguageIndex));
                        await controller.saveSliderValues();
                        print(">>>>>>>>>>>>>>>>> font name is ${controller.fontFamily.toString()}");
                        NavigationService.navigateTo(Routes.preferredFontSizeScreen);
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
  }
}
