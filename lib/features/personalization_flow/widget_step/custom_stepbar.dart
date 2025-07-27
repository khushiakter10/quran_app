
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_icons.dart';


class CustomStepBar extends StatelessWidget {
  final VoidCallback onTap;
  final int currentStep;
  final VoidCallback onSkip;
  final Function(int) onStepTap;
  final bool isDarkText;

  const CustomStepBar({
    super.key,
    required this.currentStep,
    required this.onSkip,
    required this.onStepTap,
    required this.onTap,
    required this.isDarkText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.c969696),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: SvgPicture.asset(AppIcons.arrowlefticon,color: isDarkText ? Colors.black : const Color(0xFFF9F6F0),),
            ),
          ),
        ),
        Row(
          children: List.generate(7, (index) {
            return GestureDetector(
              onTap: () => onStepTap(index),
              child: Container(
                width: 24.w,
                height: 4.h,
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                decoration: BoxDecoration(
                  color: index <= currentStep
                      ? AppColors.c72BBFF
                      : AppColors.c3F678C,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            );
          }),
        ),
        GestureDetector(
          onTap: onSkip,
          child: Text(
            'Skip',
            style: TextStyle(
              color: isDarkText ? Colors.black : const Color(0xFFF9F6F0),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 1.64,
            ),
          ),
        ),
      ],
    );
  }
}
















