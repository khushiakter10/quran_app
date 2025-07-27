import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';


class CustomThemeSelectionWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomThemeSelectionWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Check for light mode, dark mode, and starfield mode
    bool isLightMode = UiDarkModeHelper.isLightMode(context);
    bool isDarkMode = UiDarkModeHelper.isDarkMode(context);

    // Color Setting
    Color backgroundColor;
    Color borderColor;
    Color textColor;
    List<BoxShadow> boxShadow;

    if (isLightMode) {
      // light mode color setting
      backgroundColor =
      isSelected ? Colors.blue.withOpacity(0.1) : Colors.white;
      borderColor =
      isSelected ? AppColors.c72BBFF : Colors.grey.withOpacity(0.2);
      textColor = isSelected ? Colors.blue : Colors.black;
      boxShadow = [
        BoxShadow(
          color: Colors.blueAccent.withOpacity(0.2),
        ),
      ];
    } else if (isDarkMode) {
      // star field mode color setting
      backgroundColor = isSelected
          ? Colors.black.withOpacity(0.1)
          : Colors.black.withOpacity(0.1);
      borderColor = isSelected ? AppColors.c72BBFF : AppColors.c304F6B;
      textColor = isSelected ? AppColors.c72BBFF : Colors.white;
      boxShadow = [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
        ),
      ];
    } else {
      // dark mode color setting
      backgroundColor = isSelected
          ? Colors.black.withOpacity(0.1)
          : Colors.black.withOpacity(0.1);
      borderColor = isSelected ? AppColors.c72BBFF : AppColors.c304F6B;
      textColor = isSelected
          ? AppColors.c72BBFF
          : (UiDarkModeHelper.isDarkMode(context)
          ? Colors.white
          : Colors.white);
      boxShadow = [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
        ),
      ];
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 62.h,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(80.r),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
          boxShadow: boxShadow,
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

