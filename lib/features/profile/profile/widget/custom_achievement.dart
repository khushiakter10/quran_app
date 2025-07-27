

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class CustomAchievement extends StatelessWidget {
  const CustomAchievement({
    super.key,
    required this.text,
    required this.iconPath,
    required this.arrowIconPath,
  });

  final String text;
  final String iconPath;
  final String arrowIconPath;

  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(

        color: isLight ? AppColors.cF9F6F0 :  Color(0xB2061420),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: ShapeDecoration(
                color: isLight ? AppColors.c72BBFF :   AppColors.c72BBFF,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.r),
                ),
              ),
              child: SvgPicture.asset(
                iconPath,
                height: 16.h,
              ),
            ),
            UIHelper.horizontalSpace(8.w),
            Expanded(
              child: Text(
                text,
                maxLines: 2,
                style: TextFontStyle.titleStyle12w400c757575Raleway.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: isStarfield
                      ? AppColors.cF9F6F0
                      : (UiDarkModeHelper.isDarkMode(context)
                      ?  AppColors.cFFFFFF
                      : AppColors.c484848),
                ),
              ),
            ),
            SvgPicture.asset(
              arrowIconPath,
              height: 24.h,
              color: isLight ? AppColors.c969696 :  AppColors.c969696
            ),
          ],
        ),
      ),
    );
  }
}

