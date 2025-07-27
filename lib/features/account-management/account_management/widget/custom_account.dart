import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';



class CustomAccount extends StatelessWidget {
  final String text;
  final Widget? icon;

  const CustomAccount({
    super.key,
    required this.text, this.icon,

  });

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: isLight ? AppColors.cF9F6F0 :  Color(0xB2061420),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
        child: Row(
          children: [
            Text(
             text,
              style: TextFontStyle.titleStyle12w400cF9F6F0Raleway
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 18.sp,
                color: isStarfield
                    ? AppColors.cF9F6F0
                    : (UiDarkModeHelper.isDarkMode(context)
                    ? AppColors.cF9F6F0
                    : AppColors.c484848),
              ),
            ),
            Spacer(),
           SvgPicture.asset(AppIcons.arrwrights,height: 24)


          ],
        ),
      ),
    );
  }
}
