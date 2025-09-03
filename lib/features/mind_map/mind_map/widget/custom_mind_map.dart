import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class CustoMmindMap extends StatelessWidget {
  CustoMmindMap({super.key});

  final List<String> number = ['1', '2', '3', '4', '5', '6', '7', '8'];

  final List<String> title = [
    'The Opening',
    'The Cow',
    'The Family of Imran',
    'The Women',
    'The Table Spread',
    'The Cattle',
    'The Heights',
    'The Spoils of War',
  ];

  final List<String> subtitle = [
    'Al-Fatihah',
    'Al-Baqarah',
    'Ali Imraan',
    'An-Nisa',
    'Al Maa ida',
    'Al-An am',
    'Al-A raf',
    'Al-Anfal',
  ];

  final List<String> surah = [
    'الفاتحة',
    'البَقَرة',
    'آل عِمران',
    'النِّســاء',
    'المَـائِدة',
    'الأنْعـام',
    'الأعراف',
    'الأنْفـال',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<UiDarkModeController>(
        builder: (context, controller, child) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: number.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    number[index],
                    style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                      fontSize: 16.sp,
                      color: isStarfield
                          ? const Color(0xFFF9F6F0)
                          : (UiDarkModeHelper.isDarkMode(context)
                          ? AppColors.cFFFFFF
                          : AppColors.c000000),
                    ),
                  ),
                  UIHelper.horizontalSpace(16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title[index],
                        style: TextFontStyle.titleStyle16w500cF9F6F0Raleway.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isStarfield
                              ? const Color(0xFFF9F6F0)
                              : (UiDarkModeHelper.isDarkMode(context)
                              ? AppColors.cFFFFFF
                              : AppColors.c000000),
                        ),
                      ),
                      Text(
                        subtitle[index],
                        style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                          fontSize: 14.sp,
                          color: isStarfield
                              ? const Color(0xFFF9F6F0)
                              : (UiDarkModeHelper.isDarkMode(context)
                              ? AppColors.cFFFFFF
                              : AppColors.c000000),
                        ),
                      ),
                    ],
                  ),
                   Spacer(),
                  Text(
                    surah[index],
                    style: TextFontStyle.titleStyle16w400cF9F6F0Persian.copyWith(
                    fontFamily: controller.getFontFamilyByIndex(
                      controller.selectedLanguageIndex),
                      color: isStarfield
                          ? const Color(0xFFF9F6F0)
                          : (UiDarkModeHelper.isDarkMode(context)
                          ? AppColors.cFFFFFF
                          : AppColors.c000000),
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(16.h),
   ///================================ Divider ================================///
              if (index < number.length - 1) ...[
                Divider(
                  color: isLight ? AppColors.cE8E8E8 : AppColors.c3F678C,
                  thickness: 1,
                ),
                UIHelper.verticalSpace(16.h),
              ],
            ],
          );
        },
      ),
    );
  });
}}
