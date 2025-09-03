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


class DilogBox extends StatelessWidget {
  const DilogBox({super.key});

  void _confirmLogout(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor:    isLight ? AppColors.cF9F6F0 : AppColors.c72BBFF,
        title: Text(
          textAlign: TextAlign.center,
          'Khusbu',
          style: TextFontStyle.textStyle18w600c000000Raleway,
        ),
        content: Text(
          textAlign: TextAlign.center,
          'Are you sure you want to log out?',
          style: TextFontStyle.textStyle12w400c000000Raleway.copyWith(fontSize: 15),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              'No',
              style: TextFontStyle.textStyle18w600c000000Raleway,
            ),
          ),
          TextButton(
            onPressed: () {
              NavigationService.navigateTo(Routes.loginScreen);
            },
            child: Text(
              'Yes',
              style: TextFontStyle.textStyle18w600c000000Raleway,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: isLight ? AppColors.cF9F6F0 :  Color(0xB2061420),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.logoutIcon, height: 24.h, color: isLight ? AppColors.c969696 :  AppColors.c969696 ),
            UIHelper.horizontalSpace(8.w),

            GestureDetector(
              onTap: () => _confirmLogout(context),
              child: Text(
                'Log Out',
                style: TextFontStyle.titleStyle12w400c757575Raleway.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: isStarfield
                      ? AppColors.cF9F6F0
                      : (UiDarkModeHelper.isDarkMode(context)
                      ? AppColors.cFFFFFF
                      : AppColors.c484848),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
