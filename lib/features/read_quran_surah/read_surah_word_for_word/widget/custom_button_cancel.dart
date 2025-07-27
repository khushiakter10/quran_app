
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class CustomButtonCancel extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final TextStyle? cancelTextStyle;
  final TextStyle? doneTextStyle;
  final VoidCallback? onFirstTap;
  final VoidCallback? onSecondTap;

  const CustomButtonCancel({
    super.key,
    this.cancelTextStyle,
    this.title,
    this.subtitle,
    this.doneTextStyle,
    this.onFirstTap,
    this.onSecondTap,
  });

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onFirstTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: isLight ? Color(0xFFE8E8E8) : AppColors.c1E2F3F,
                borderRadius: BorderRadius.circular(80.r),
              ),
              child: Center(
                child: Text(
                  title ?? '',
                  style: cancelTextStyle ??
                      TextFontStyle.textStyle16w500c969696NeutrifPro.copyWith(
                          color: isLight
                              ? AppColors.c000000
                              :  AppColors.c969696)
                ),
              ),
            ),
          ),
        ),
        UIHelper.horizontalSpace(8.w),
        Expanded(
          child: GestureDetector(
            onTap: onSecondTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: isLight ? AppColors.c72BBFF : AppColors.c72BBFF,
                borderRadius: BorderRadius.circular(80.r),
              ),
              child: Center(
                child: Text(
                  subtitle ?? '',
                  style: doneTextStyle ??
                      TextFontStyle.textStyle16w500c000000NeutrifPro
                          .copyWith(
                          color: isLight
                              ? AppColors.c000000
                              :  AppColors.c000000),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
