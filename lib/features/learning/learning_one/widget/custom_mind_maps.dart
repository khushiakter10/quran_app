import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class CustomMindMaps extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback? OnTap;

  const CustomMindMaps({
    super.key,
    required this.icon,
    required this.title, this.OnTap,
  });

  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;
    return Expanded(

      child: GestureDetector(
        onTap: OnTap,
        child: Container(
          decoration: ShapeDecoration(
            color: isLight ? AppColors.cF9F6F0 :  Color(0xB23D668B),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: isLight ? Colors.transparent : Color(0xFF8EC9FF),
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 11.w),
            child: Column(
              children: [
                icon,
                UIHelper.verticalSpace(16.h),
                Text(title,
                    style: TextFontStyle.titleStyle16w500cF9F6F0Raleway
                        .copyWith(fontWeight: FontWeight.w600,
                        color: isStarfield
                            ? AppColors.cFEFEFE
                            : (UiDarkModeHelper.isDarkMode(context)
                            ? AppColors.cFEFEFE
                            :  AppColors.c484848)
                    ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
