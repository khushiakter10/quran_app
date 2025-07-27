import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class CustomContact extends StatelessWidget {
  final String title;


  const CustomContact({
    super.key,
    required this.title,

  });

  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: isLight ? AppColors.cF9F6F0 :   Color(0xB2061420),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(title,
                style: TextFontStyle.titleStyle8w500cF9F6F0NeutrifPro
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600,
                  color: isStarfield
                      ?   AppColors.cF9F6F0
                      : (UiDarkModeHelper.isDarkMode(context)
                      ?  AppColors.cF9F6F0
                      :  AppColors.c484848  ),
                )),

            UIHelper.verticalSpace(4.h),
            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.whatsapp,
                  height: 24.sp,
                ),
                UIHelper.horizontalSpace(4.w),
                Text('+1 234 567 890',
                    style: TextFontStyle.titleStyle16w400c969696NeutrifPro.copyWith(
                      color: isStarfield
                          ?   AppColors.c969696
                          : (UiDarkModeHelper.isDarkMode(context)
                          ?  AppColors.c969696
                          :  AppColors.c969696  ),
                    )

                ),
              ],
            ),
            UIHelper.verticalSpace(4.h),
            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.gmailicons,
                  height: 24.sp,
                ),
                UIHelper.horizontalSpace(4.w),
                Text('emrshop@gmail.com',
                    style: TextFontStyle.titleStyle16w400c969696NeutrifPro.copyWith(
                      color: isStarfield
                          ?   AppColors.c969696
                          : (UiDarkModeHelper.isDarkMode(context)
                          ?  AppColors.c969696
                          :  AppColors.c969696  ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
