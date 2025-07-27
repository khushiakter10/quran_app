import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class CustomContinueEnglish extends StatelessWidget {
  final String title;
  final String subtitle;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onTap;


  final Widget icon;

  const CustomContinueEnglish({
    super.key,
    required this.title,
    required this.icon,
    required this.subtitle,
    required this.text,
    this.textStyle, this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: isLight ? AppColors.cF9F6F0 :  Color(0x66061420),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: isLight ?  Colors.transparent : AppColors.c3F678C,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(AppIcons.grybookIcon, height: 16.h,),
                UIHelper.horizontalSpace(4.w),

                Text(title,
                    style: TextFontStyle.titleStyle12w400cB1AFAARaleway.copyWith(
                        color: isStarfield
                            ? AppColors.cB1AFAA
                            : (UiDarkModeHelper.isDarkMode(context)
                            ? AppColors.cB1AFAA
                            :  AppColors.c666666))

                ),

                Spacer(),

                GestureDetector(
                  onTap: onTap,

                  child: Text(
                    'See All',
                    style: TextFontStyle.textStyle12w400c72BBFFRaleway
                        .copyWith(fontSize: 10.sp),
                  ),
                ),


                UIHelper.horizontalSpace(2.w),
                icon,
              ],
            ),
            UIHelper.verticalSpace(8.h),

            Text(subtitle, style: TextFontStyle.textStyle20w600cFEFEFERaleway.copyWith(
                color: isStarfield
                    ? AppColors.cB1AFAA
                    : (UiDarkModeHelper.isDarkMode(context)
                    ? AppColors.cB1AFAA
                    :  AppColors.c666666))


            ),


            Text(text,
                style: TextFontStyle.textStyle12w500FEFEFERaleway
                    .copyWith(fontWeight: FontWeight.w400,
                    color: isStarfield
                        ? AppColors.cB1AFAA
                        : (UiDarkModeHelper.isDarkMode(context)
                        ? AppColors.cB1AFAA
                        :  AppColors.c666666)))
          ],
        ),
      ),
    );
  }
}
