import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class CustomSurahAndAyat extends StatelessWidget {
  final List<String> surahList;
  final List<String> ayahList;

  final String selectedSurah;
  final String selectedAyah;

  final ValueChanged<String> onSurahChanged;
  final ValueChanged<String> onAyahChanged;

  const CustomSurahAndAyat({
    super.key,
    required this.surahList,
    required this.ayahList,
    required this.selectedSurah,
    required this.selectedAyah,
    required this.onSurahChanged,
    required this.onAyahChanged,
  });

  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;
    return Row(
      children: [


        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Surah', style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                color: isStarfield
                    ?  Color(0xFFFEFEFE)
                    : (isLight ? AppColors.c484848 : AppColors.cFFFFFF),
              )),

              UIHelper.verticalSpace(8.h),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 9.w),
                decoration: BoxDecoration(
                  color: isLight ? AppColors.cF9F6F0 : AppColors.c1E2F3F,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.transparent),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor:   isLight ? AppColors.cF9F6F0 : AppColors.c1E2F3F,
                    value: selectedSurah,
                    icon: SvgPicture.asset(AppIcons.dropdwonIcon, height: 16.h),
                    isExpanded: true,
                    items: surahList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextFontStyle.textStyle16w400c969696Raleway.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      if (newValue != null) {
                        onSurahChanged(newValue);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

        UIHelper.horizontalSpace(18.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('Ayat', style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                color: isStarfield
                    ?  Color(0xFFFEFEFE)
                    : (isLight ? AppColors.c484848 : AppColors.cFFFFFF),
              )),

              UIHelper.verticalSpace(8.h),


              Container(
                padding: EdgeInsets.symmetric(horizontal: 9.w),
                decoration: BoxDecoration(
                  color: isLight ? AppColors.cF9F6F0 : AppColors.c1E2F3F,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.transparent),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor:   isLight ? AppColors.cF9F6F0 : AppColors.c1E2F3F,
                    value: selectedAyah,
                    icon: SvgPicture.asset(AppIcons.dropdwonIcon, height: 16.h),
                    isExpanded: true,
                    items: ayahList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextFontStyle.textStyle16w400c969696Raleway.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      if (newValue != null) {
                        onAyahChanged(newValue);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
















