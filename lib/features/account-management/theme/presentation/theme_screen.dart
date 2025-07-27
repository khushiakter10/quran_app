import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/features/personalization_flow/sign_up_preferred_language/widget/custom_thim_selection_widget.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() =>
      _ThemeScreenState();
}

class _ThemeScreenState
    extends State<ThemeScreen> {
  int selectedLanguageIndex = 0;

  final List<String> selectColorTitle = [
    'Starfield (Default)',
    'Dark Mode',
    'Light Mode',
  ];

  final List<String> themeValues = [
    UiDarkModeHelper.starfieldTheme,
    UiDarkModeHelper.darkTheme,
    UiDarkModeHelper.lightTheme,
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await UiDarkModeHelper.initTheme(context);
      setState(() {
        final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
        selectedLanguageIndex = themeValues.indexOf(currentTheme);
      });
    });
  }

  void _changeTheme(int index) {
    setState(() {
      selectedLanguageIndex = index;
      UiDarkModeHelper.setTheme(context, themeValues[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
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
          gradient: isStarfield ? null : UiDarkModeHelper.getCurrentGradient(context),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CustomAppbarWidget(
                  showIcon: false,
                  text: 'Theme',
                  onTap: () {
                    NavigationService.goBack();
                  },
                ),
                UIHelper.verticalSpace(41.h),


                Text(
                  'Select the color theme and background',
                  style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(

                    color: isStarfield
                        ? const Color(0xFFF9F6F0)
                        : (UiDarkModeHelper.isDarkMode(context) ? Colors.white : Colors.black),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,

                  ),
                ),


                UIHelper.verticalSpace(24.h),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: selectColorTitle.length,
                  separatorBuilder: (context, index) => UIHelper.verticalSpace(8.h),
                  itemBuilder: (context, index) {
                    bool isSelected = selectedLanguageIndex == index;
                    return CustomThemeSelectionWidget(
                      title: selectColorTitle[index],
                      isSelected: isSelected,
                      onTap: () => _changeTheme(index),
                    );
                  },
                ),
                const Spacer(),
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
  }

  void goToStep(int index) {
    // Navigation logic
  }
}
