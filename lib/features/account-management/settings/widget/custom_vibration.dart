
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';

class CustomVibration extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;


  final VoidCallback onTap;

  const CustomVibration({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,


    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isLight ? AppColors.cF9F6F0 : const Color(0xB2061420),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 18.w),
          child: Row(
            children: [
              Text(
                title,
                style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,

                  color: isStarfield
                      ? AppColors.cF9F6F0
                      : (UiDarkModeHelper.isDarkMode(context)
                      ? AppColors.cF9F6F0
                      : AppColors.c484848),
                ),
              ),
              const Spacer(),
              Transform.scale(
                scale: 0.7,
                child: Switch(
                  value: value,
                  activeColor: Colors.white,
                  activeTrackColor: AppColors.c72BBFF,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade400,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashRadius: 0,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
