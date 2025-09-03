import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/features/read_quran_juz/juz_english_translation/presentation/juz_english_translation_screen.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class LearningJuz extends StatelessWidget {
  const LearningJuz({Key? key}) : super(key: key);

  final List<String> alif = const [
    'Alif Lam Meem', 'Sayaqool', 'Tilkal Rusul',
    'Lan Tana Loo', 'Wal Mohsanat', 'La Yuhibbullah',
  ];

  final List<String> pagelist = const [
    'Page #2', 'Page #21', 'Page #39',
    'Page #57', 'Page #75', 'Page #93',
  ];

  final List<String> juz = const [
    'آلم', 'سَيَقُولُ', 'تِلْكَ ٱلْرُّسُلُ',
    'لَنْ تَنَالُوْ الْبِرَّ', 'وَٱلْمُحْصَنَاتُ', 'لَا يُحِبُّ ٱللهُ',
  ];

  final List<String> data = const ['1', '2', '3', '4', '5', '6'];

  @override
  Widget build(BuildContext context) {
    return Consumer<UiDarkModeController>(
        builder: (context, controller, child) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return GestureDetector(
      onTap: () {
        Get.to(JuzEnglishTranslationScreen());
      },
      child:

      ListView.separated(
        itemCount: alif.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (_, __) => Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),

          child: Divider(
            color: isLight ? AppColors.c72BBFF : AppColors.c3F678C,
            thickness: 1,
          ),
        ),
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data[index],
                style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                  fontSize: 16.sp,
                    color: isStarfield
                        ? AppColors.cF9F6F0
                        : (UiDarkModeHelper.isDarkMode(context)
                        ? AppColors.cF9F6F0
                        :  AppColors.c484848)
                ),
              ),
              UIHelper.horizontalSpace(16.w),
              Expanded(
                child: Text(
                  alif[index],
                  style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                    fontSize: 16.sp,
                      color: isStarfield
                          ? AppColors.cF9F6F0
                          : (UiDarkModeHelper.isDarkMode(context)
                          ? AppColors.cF9F6F0
                          :  AppColors.c484848)
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                juz[index],
                style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                    fontFamily: controller.getFontFamilyByIndex(
                        controller.selectedLanguageIndex),
                  fontSize: 16.sp,
               color: isStarfield
               ? AppColors.cF9F6F0
                : (UiDarkModeHelper.isDarkMode(context)
                ? AppColors.cF9F6F0
              :  AppColors.c484848)
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          );
        },
      ),
    );
  });
}}