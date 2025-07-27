import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/account-management/settings/widget/custom_settings.dart';
import 'package:quran_app/features/account-management/settings/widget/custom_vibration.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isVibration = false;
  bool isShow = false;
  bool isTransliteration = false;
  bool isAutoPlay = false;

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;

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
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Static App Bar
                CustomAppbarWidget(
                  showIcon: false,
                  text: 'Settings',
                  onTap: () {
                    NavigationService.goBack;
                  },
                ),

                UIHelper.verticalSpace(30.h),


                Expanded(
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(Routes.languageScreen);
                        },
                        child: CustomSettings(text: 'Language'),
                      ),


                      UIHelper.verticalSpace(8.h),
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(
                              Routes.changeFontScreen);
                        },
                        child: CustomSettings(text: 'Calligraphy Style'),
                      ),
                      UIHelper.verticalSpace(8.h),
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(Routes.fontSizeScreen);
                        },
                        child: CustomSettings(text: 'Font Size'),
                      ),
                      UIHelper.verticalSpace(8.h),
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(Routes.recitersScreen);
                        },
                        child: CustomSettings(text: 'Reciter'),
                      ),
                      UIHelper.verticalSpace(8.h),
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(
                              Routes.tafsirSignUpScreen);
                        },
                        child: CustomSettings(text: 'Tafsir'),
                      ),
                      UIHelper.verticalSpace(8.h),
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(
                              Routes.readingModeScreen);
                        },
                        child: CustomSettings(text: 'Reading Mode'),
                      ),
                      UIHelper.verticalSpace(8.h),
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(Routes.themeScreen);
                        },
                        child: CustomSettings(text: 'Theme'),
                      ),
                      UIHelper.verticalSpace(8.h),

                      CustomVibration(
                        title: 'Vibration',
                        value: isVibration,
                        onChanged: (val) {
                          setState(() {
                            isVibration = val;
                          });
                        },
                        onTap: () {},
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomVibration(
                        title: 'Show Translation',
                        value: isShow,
                        onChanged: (val) {
                          setState(() {
                            isShow = val;
                          });
                        },
                        onTap: () {},
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomVibration(
                        title: 'Show Transliteration',
                        value: isTransliteration,
                        onChanged: (val) {
                          setState(() {
                            isTransliteration = val;
                          });
                        },
                        onTap: () {},
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomVibration(
                        title: 'Auto Play',
                        value: isAutoPlay,
                        onChanged: (val) {
                          setState(() {
                            isAutoPlay = val;
                          });
                        },
                        onTap: () {},
                      ),
                      UIHelper.verticalSpace(20.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
