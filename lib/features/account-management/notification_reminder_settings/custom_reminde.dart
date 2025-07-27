
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';


class CustomReminde extends StatefulWidget {
  final String text;

  const CustomReminde({super.key, required this.text});

  @override
  State<CustomReminde> createState() => _CustomRemindeState();
}

class _CustomRemindeState extends State<CustomReminde> {
  bool isSelected = false;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Row(
      children: [
        Text(
          widget.text,
          style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
            fontSize: 16.sp,
            color: isStarfield
                ?   AppColors.cF9F6F0
                : (UiDarkModeHelper.isDarkMode(context)
                ?  AppColors.cF9F6F0
                :  AppColors.c484848),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: toggleSelection,
          child: Container(
            width: 24,
            height: 24,
            child: Stack(
              children: [
                // Outer circle
                Positioned(
                  left: 4,
                  top: 4,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 1.5,
                          color: const Color(0xFF72BBFF),
                        ),
                      ),
                    ),
                  ),
                ),
                // Inner dot if selected
                if (isSelected)
                  Positioned(
                    left: 8.57,
                    top: 8.57,
                    child: Container(
                      width: 6.86,
                      height: 6.86,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF72BBFF),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
