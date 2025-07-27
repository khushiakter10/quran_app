import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class CustomAppbarWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final Widget? icon;
  final bool showIcon;
  final TextStyle? textStyle;

  const CustomAppbarWidget({
    super.key,
    required this.text,
    this.icon,
    this.showIcon = true,
    this.onTap,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Row(
      children: [
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
                  ?  Color(0xFFFEFEFE)
                  : (isLight ? AppColors.c484848 : Colors.white),
            ),
          ),
        ),
        UIHelper.horizontalSpace(30.w),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            style: textStyle ??
                TextFontStyle.textStyle32w700cwhiteCormorantGaramond.copyWith(
                  color: isStarfield
                      ? AppColors.cFEFEFE
                      : (isLight ? AppColors.c484848 : Colors.white),
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),


        if (showIcon) ...[
          UIHelper.horizontalSpace(8.w),
          icon ?? SvgPicture.asset(
            AppIcons.settingICon,

            color: isStarfield
                ?  Color(0xFFFEFEFE)
                : (isLight ? Colors.black : Colors.red),
          ),
        ],
      ],
    );
  }
}