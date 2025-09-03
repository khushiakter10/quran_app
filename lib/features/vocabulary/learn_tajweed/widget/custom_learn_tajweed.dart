import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class Custom extends StatelessWidget {
  final String data;
  final String title;
  final String subtitle;

  const Custom({
    super.key,
    required this.data,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UiDarkModeController>(
        builder: (context, controller, child) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///======================= Data ==========================///
            Container(
              padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: AppColors.cE9DEC8,
                borderRadius: BorderRadius.circular(80.r),
              ),
              child: Text(
                data,
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle12w400c484848Raleway.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            UIHelper.horizontalSpace(16.w),

            ///====================== Title & Subtitle ========================///
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextFontStyle.titleStyle16w400cF9F6F0Persian.copyWith(
                      fontFamily: controller.getFontFamilyByIndex(
                          controller.selectedLanguageIndex),
                      color: isStarfield
                          ? const Color(0xFFF9F6F0)
                          : (UiDarkModeHelper.isDarkMode(context)
                          ? AppColors.cFFFFFF
                          : AppColors.c000000),


                    ),
                  ),
                  UIHelper.verticalSpace(4.h),
                  Text(
                    subtitle,
                    style: TextFontStyle.titleStyle16w400cF9F6F0Persian.copyWith(
                      fontSize: 14.sp,
                      color: isStarfield
                          ? const Color(0xFFF9F6F0)
                          : (UiDarkModeHelper.isDarkMode(context)
                          ? AppColors.cFFFFFF
                          : AppColors.c000000),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        UIHelper.verticalSpace(16.h),


        if (data != '8') ...[
          Divider(
            color: isLight ? AppColors.cE8E8E8 : AppColors.c3F678C,
            thickness: 1,
          ),
          UIHelper.verticalSpace(16.h),
        ],
      ],
    );
  });
}}
