import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class CustoMindShare extends StatelessWidget {
  final bool showIcon;
  final String text;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? icon;
  final TextStyle? textStyle;
  final TextStyle? subtitleStyle;

  const CustoMindShare({
    Key? key,
    required this.text,
    this.subtitle,
    this.showIcon = false,
    this.onTap,
    this.icon,
    this.textStyle,
    this.subtitleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UiDarkModeController>(
        builder: (context, controller, child) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///===========Back Button===========
          GestureDetector(
            onTap: onTap ?? () {
              NavigationService.goBack();
            },
            child: Container(
              padding: EdgeInsets.all(12.sp),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xFF969696),
                  ),
                  borderRadius: BorderRadius.circular(40.r),
                ),
              ),
              child: SvgPicture.asset(
                AppIcons.arrowrights,
                height: 16.h,
                color: isStarfield
                    ? const Color(0xFFFEFEFE)
                    : (isLight ? Colors.black : Colors.white),
              ),
            ),
          ),
          UIHelper.horizontalSpace(16.w),

          ///================Title, Icon, and Subtitle==========
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        text,
                        style: textStyle ??
                            TextFontStyle.textStyle32w700cwhiteCormorantGaramond.copyWith(
                              fontSize: 24.sp,
                              color: isStarfield
                                  ? const Color(0xFFFEFEFE)
                                  : (isLight ? Colors.black : Colors.white),
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                  UIHelper.verticalSpace(4.h),
                  Text(
                    subtitle!,
                    style: subtitleStyle ??
                        TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                          fontSize: 16.sp,
                          color: isStarfield
                              ?  Color(0xFFFEFEFE).withOpacity(0.7)
                              : (isLight ? Colors.black54 : Colors.white70),
                            fontFamily: controller.getFontFamilyByIndex(
                                controller.selectedLanguageIndex)
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],

            ),
          ),

         SvgPicture.asset(AppIcons.mindshareicon,  color: isLight ? AppColors.c000000 : AppColors.cFFFFFF)

          ///================Optional Icon==========

        ],
      ),
    );
  });
  }}