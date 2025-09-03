
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';

class CustomAlFatiha extends StatelessWidget {
  final BorderRadius borderRadius;
  final String label;
  final bool isSelected;
  final bool isDisabled;

  const CustomAlFatiha({
    required this.borderRadius,
    required this.label,
    required this.isSelected,
    required this.isDisabled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      //color: isSelected ? Colors.red :   AppColors.c2B3747.withOpacity(0.55),

        color: isSelected
            ? (isLight ? AppColors.cFFFFFF : AppColors.c19202B)
            : (isLight ?  AppColors.cFFFFFF : AppColors.c36313A),

        border: Border.all(color:

        isStarfield
            ? Colors.transparent
            : (isLight ? AppColors.cE8E8E8 : Colors.transparent),
        ),


      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: isSelected
              ? TextFontStyle.textStyle12w400c000000Raleway.copyWith(
               color: (isLight ? AppColors.c000000 : AppColors.cFFFFFF)
          )
              : TextFontStyle.textStyle12w400c8F8A8ERaleway.copyWith(
            color:  (isLight ?  AppColors.cB8B8B8 :AppColors.c958D91),
          ),
        ),
      ),
    );
  }
}




