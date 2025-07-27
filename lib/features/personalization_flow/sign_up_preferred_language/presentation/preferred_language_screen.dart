import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/features/personalization_flow/sign_up_preferred_language/widget/custom_language_selection_title.dart';
import 'package:quran_app/features/personalization_flow/widget_step/custom_stepbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class StepController extends GetxController {}


class PreferredLanguageScreen extends StatefulWidget {
  const PreferredLanguageScreen({super.key});

  @override
  State<PreferredLanguageScreen> createState() => _PreferredLanguageScreenState();
}

class _PreferredLanguageScreenState extends State<PreferredLanguageScreen> {



  int appbarIndex = 0;
  int selectedLanguageIndex = -1;
  final StepController stepController = Get.put(StepController());

  final List<String> title = [
    'English',
    'French',
    'Urdu',
    'German',
    'Spanish',
    'Hindi',
    'Arabic',
    'Chinese',
  ];

  void _changeTheme(int index) {
    setState(() {
      selectedLanguageIndex = index;
    });
  }

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
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CustomStepBar(
                            isDarkText: isLight,
                            currentStep: 0,
                            onTap: () {
                              NavigationService.goBack();
                            },
                            onSkip: () {
                              NavigationService.navigateTo(Routes.selectColorThemBackgroundScreen);
                            },
                            onStepTap: (index) => goToStep(index),
                          ),

                          UIHelper.verticalSpace(24.h),
                          Text(
                            'Select Your Preferred Language',
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
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,

                              itemCount: title.length,
                              separatorBuilder: (context, index) => UIHelper.verticalSpace(8.h),
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
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
                    child: CustomPersonalizationButton(
                      text: 'Next',
                      onPressed: () {
                        NavigationService.navigateTo(Routes.calligraphyStyleScreen);
                      },
                    ),
                  ),
                ],
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