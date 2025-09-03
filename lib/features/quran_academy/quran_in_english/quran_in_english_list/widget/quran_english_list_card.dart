import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class QuranEnglishListCard extends StatelessWidget {
  const QuranEnglishListCard({Key? key}) : super(key: key);

  final List<String> number = const [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
  ];

  final List<String> surahListTitle = const [
    'The Opening',
    'The Cow',
    'The Family of Imran',
    'The Women',
    'The Table Spread',
    'The Cattle',
    'The Heights',
    'The Spoils of War',
    'The Repentance',
    'Jonah',
    'Hud',
    'Joseph',
    'The Thunder',
  ];

  final List<String> surahListSubtitle = const [
    'Al-Fatihah',
    'Al-Baqarah',
    'Ali Imran',
    'An-Nisa',
    'Al-Maaida',
    'Al-Anam',
    'Al-Araf',
    'Al-Anfal',
    'At-Tawbah',
    'Yunus',
    'Hud',
    'Yusuf',
    'Ar-Ra\'d',
  ];

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return ListView.separated(
      itemCount: number.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (_, __) => Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Divider(
          color: isLight ? AppColors.cBEE0FF : AppColors.c3F678C,
          thickness: 1,
        ),
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {

           NavigationService.navigateTo(Routes.quranOpeningPlayScreen);
          },

          ///====================Data Design Section====================
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number[index],
                style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                  fontSize: 16.sp,
                  color: isStarfield
                      ? const Color(0xFFFEFEFE)
                      : (isLight ? Colors.black : Colors.white),
                ),
              ),
              UIHelper.horizontalSpace(16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      surahListTitle[index],
                      style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                        fontSize: 16.sp,
                        color: isStarfield
                            ? const Color(0xFFFEFEFE)
                            : (isLight ? Colors.black : Colors.white),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      surahListSubtitle[index],
                      style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                        fontSize: 16.sp,
                        color: isStarfield
                            ? const Color(0xFFFEFEFE)
                            : (isLight ? Colors.black : Colors.white),
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}