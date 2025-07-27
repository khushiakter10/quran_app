import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class CustomAllFeature extends StatelessWidget {
  const CustomAllFeature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            GestureDetector(
              onTap: () {
                NavigationService.navigateTo(Routes.readQuranSurahScreen);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: isLight ? AppColors.cF9F6F0 :  Color(0x6605131F),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(  color: isLight ? Colors.transparent : AppColors.c3F678C, width: 1.w)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 40.w),
                  child: Column(
                    children: [
                      SvgPicture.asset(AppIcons.fetureredquran,height: 47.h),

                      Text(
                        'Read Quran',
                        style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                          fontSize: 14.sp,
                          color: isStarfield
                              ? AppColors.cFEFEFE
                              : (UiDarkModeHelper.isDarkMode(context)
                              ? AppColors.cFEFEFE
                              : AppColors.c000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            UIHelper.horizontalSpace(4.w),

            GestureDetector(
              onTap: () {
                NavigationService.navigateTo(Routes.quranAcademyScreen);
              },

              child: Container(
                decoration: BoxDecoration(

                    color: isLight ? AppColors.cF9F6F0 :  Color(0x6605131F),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(  color: isLight ? Colors.transparent : AppColors.c3F678C, width: 1.w)),

                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 23.h, horizontal: 40.w),
                  child: Column(
                    children: [
                      SvgPicture.asset(AppIcons.koranrfeture,height: 30.h),

                      Text(
                        'Quran\nAcademy',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                          fontSize: 14.sp,
                          color: isStarfield
                              ? AppColors.cFEFEFE
                              : (UiDarkModeHelper.isDarkMode(context)
                              ? AppColors.cFEFEFE
                              : AppColors.c000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
        UIHelper.verticalSpace(4.h),



        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            GestureDetector(
              onTap: (){NavigationService.navigateTo(Routes.newsScreen);},
              child: Container(
                decoration: BoxDecoration(

                    color: isLight ? AppColors.cF9F6F0 :  Color(0x6605131F),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(  color: isLight ? Colors.transparent : AppColors.c3F678C, width: 1.w)),

                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 40.w),
                  child: Column(
                    children: [
                      SvgPicture.asset(AppIcons.newsIcon,height: 48.h),

                      Text(
                        'News          ',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                          fontSize: 14.sp,
                          color: isStarfield
                              ? AppColors.cFEFEFE
                              : (UiDarkModeHelper.isDarkMode(context)
                              ? AppColors.cFEFEFE
                              : AppColors.c000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            UIHelper.horizontalSpace(4.w),

            GestureDetector(
              onTap: (){
                NavigationService.navigateTo(Routes.audioQuranScreen);
              },
              child: Container(
                decoration: BoxDecoration(

                    color: isLight ? AppColors.cF9F6F0 :  Color(0x6605131F),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(  color: isLight ? Colors.transparent : AppColors.c3F678C, width: 1.w)),


                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 23.h, horizontal: 40.w),
                  child: Column(
                    children: [
                      SvgPicture.asset(AppIcons.audioQuran,height: 30.h),

                      Text(
                        'Audio\nQuran      ',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                          fontSize: 14.sp,
                          color: isStarfield
                              ? AppColors.cFEFEFE
                              : (UiDarkModeHelper.isDarkMode(context)
                              ? AppColors.cFEFEFE
                              : AppColors.c000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),

      ],
    );
  }
}