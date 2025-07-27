import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class CustomContinueReading extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final String text;

  const CustomContinueReading({
    super.key,
    required this.title,
    required this.subtitle,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Container(
        width: 152.w,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(
              color: isStarfield
                  ?  Color(0xFF3F678C)
                  : (isLight ? AppColors.cF9F6F0 : const Color(0xFF304F6B)),
              width: 0.50,
            ),
          ),
          color: isStarfield
              ?  Colors.transparent.withOpacity(0.3)
              : (isLight ? AppColors.cF9F6F0 : Colors.transparent.withOpacity(0.3)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  icon,
                  UIHelper.horizontalSpace(4.w),
                  Expanded(
                    child: Text(
                      title,
                      style: TextFontStyle.textStyle12w400c72BBFFRaleway
                          .copyWith(
                        color: isStarfield
                            ? Colors.blue
                            : (isLight ? Colors.black : Colors.blue),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(4.h),
              Text(
                subtitle,
                style: TextStyle(
                  color: isStarfield
                      ? const Color(0xFFFEFEFE)
                      : (isLight ? Colors.black : Colors.white),
                  fontSize: 20,
                  fontFamily: 'Cormorant Garamond',
                  fontWeight: FontWeight.w600,
                  height: 1.32,
                  letterSpacing: -0.40,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  color: isStarfield
                      ? const Color(0xFFFEFEFE)
                      : (isLight ? Colors.black : Colors.white),
                  fontSize: 12,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}