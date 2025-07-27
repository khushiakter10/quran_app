
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class Global extends StatefulWidget {
  const Global({super.key});

  @override
  State<Global> createState() => _GlobalState();
}

final List<String> image = List.generate(
  12,
      (_) => 'assets/images/globalprofile.png',
);

final List<String> title = [
  'Amina',
  'Zara',
  'Mabia',
  'Asma',
  'Sharmin',
  'Samsi',
  'Hafsa',
  'Khusbu',
  'Ahona',
  'Soyaib',
  'mim',
  'fahim',
];

final List<String> subtitle = [
  '50012 Points',
  '50013 Points',
  '50014 Points',
  '50015 Points',
  '50016 Points',
  '48020 Points',
  '51030 Points',
  '49345 Points',
  '45000 Points',
  '57200 Points',
  '53015 Points',
  '50020 Points',
];

class _GlobalState extends State<Global> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isLight ? AppColors.cF9F6F0 : const Color(0xB2061420),
        borderRadius: BorderRadius.circular(11.r),
        border: Border.all(color: Colors.transparent),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 12,
          separatorBuilder: (context, index) => UIHelper.verticalSpace(16.h),
          itemBuilder: (context, index) {
            return Row(
              children: [
                index < 3
                    ? Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.starIcon,
                      height: 35.h,
                      color:  isLight ? AppColors.cE0C789 : AppColors.c33516F,
                    ),
                    Text(
                      '${index + 1}',
                      style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                     fontWeight: FontWeight.w400,
                        color:  isLight ? AppColors.cFFFFFF : AppColors.cFFFFFF,
                      )
                    )
                  ],
                )
                    : Container(
                  height: 34.h,
                  width: 34.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Text(
                    '${index + 1}',
                      style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                        fontWeight: FontWeight.w400,
                        color:  isLight ? AppColors.cFFFFFF : AppColors.cFFFFFF,
                      )
                  ),
                ),
                UIHelper.horizontalSpace(8.w),

                Image.asset(
                  image[index],
                  height: 31.h,
                ),
                UIHelper.horizontalSpace(8.w),

                /// Name
                Text(
                  title[index],
                  style: TextFontStyle.textStyle16w500B8B8B8Raleway.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: isStarfield
                        ?  AppColors.cB8B8B8
                        : (UiDarkModeHelper.isDarkMode(context)
                        ? AppColors.cB8B8B8
                        : AppColors.c484848),
                  )
                ),
                const Spacer(),


                Text(
                  subtitle[index],
                    style: TextFontStyle.textStyle16w500B8B8B8Raleway.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: isStarfield
                          ?  AppColors.cB8B8B8
                          : (UiDarkModeHelper.isDarkMode(context)
                          ? AppColors.cB8B8B8
                          : AppColors.c484848),
                    )
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
