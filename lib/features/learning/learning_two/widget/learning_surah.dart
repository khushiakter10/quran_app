

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class ReadQuranSurah extends StatelessWidget {
  const ReadQuranSurah({Key? key}) : super(key: key);

  final List<String> dataList = const [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];

  final List<String> surahAll = const [
    'Al-Fatihah',
    'Al-Baqarah',
    'Ali Imraan',
    'An Nisaa',
    'Al Maa ida',
    'Al An amm',
    'Al Araaf',
    'Al Anfaal',
  ];

  final List<String> surah = const [
    'الفاتحة',
    'البَقَرة',
    'آل عِمران',
    'النِّســَاء',
    'المَِـائِدة',
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

          return ListView.separated(
            itemCount: dataList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Divider(
                color: isLight ? AppColors.c72BBFF : AppColors.c3F678C,
                thickness: 1,
              ),
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  await controller.loadSelectedReadingType();
                  final type = controller.selectedReadingType;
                  if (type == 'Juz Style') {
                    Get.toNamed(Routes.juzEnglishTranslationScreen);
                  } else if (type == 'Scroll Style') {
                    Get.toNamed(Routes.readSurahScrollStyleScreen);
                  } else if (type == 'Verse-by-Verse') {
                    Get.toNamed(Routes.readSurahVerseByVerseScreen);
                  } else if (type == 'Word-for-Word') {
                    Get.toNamed(Routes.readSurahWordForWordScreen);
                  }
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      dataList[index],
                      style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                        fontSize: 16.sp,
                        color: isStarfield
                            ? const Color(0xFFFEFEFE)
                            : (isLight ? Colors.black : Colors.white),
                      ),
                    ),
                    UIHelper.horizontalSpace(16.w),
                    Expanded(
                      child: Text(
                        surahAll[index],
                        style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                          fontSize: 16.sp,
                          color: isStarfield
                              ? const Color(0xFFFEFEFE)
                              : (isLight ? Colors.black : Colors.white),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      surah[index],
                      style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                        fontFamily: controller.getFontFamilyByIndex(
                            controller.selectedLanguageIndex),
                        fontSize: 16.sp,
                        color: isStarfield
                            ? const Color(0xFFFEFEFE)
                            : (isLight ? Colors.black : Colors.white),
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}