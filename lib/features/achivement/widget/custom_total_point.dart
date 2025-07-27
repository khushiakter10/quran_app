import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';


class CustomTotalPoint extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomTotalPoint({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;
    return Container(
      width: 160.w,
      decoration: ShapeDecoration(

        color: isLight ? AppColors.cF9F6F0 :  Color(0xB2061420),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(color: isLight ? AppColors.cE8E8E8 :  Colors.transparent)
        ),

      ),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Column(
          children: [
            Text(title,
                textAlign: TextAlign.center,
                style: TextFontStyle.titleStyle24w600cF9F6F0CormorantGaramond
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 40.sp,

                  color: isStarfield
                      ? AppColors.cF9F6F0
                      : (UiDarkModeHelper.isDarkMode(context)
                      ? AppColors.cF9F6F0
                      : AppColors.c484848),
                )),
            Text(subtitle,
                 textAlign: TextAlign.center,
                 overflow: TextOverflow.ellipsis,
                 maxLines: 1,
                style: TextFontStyle.titleStyle16w500cF9F6F0Raleway
                    .copyWith(fontSize: 18.sp,
                  color: isStarfield
                      ? AppColors.cF9F6F0
                      : (UiDarkModeHelper.isDarkMode(context)
                      ?AppColors.cF9F6F0
                      : AppColors.c484848),
                )),
          ],
        ),
      ),
    );
  }
}
