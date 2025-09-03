import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class CustomFontSizeCard extends StatelessWidget {
  const CustomFontSizeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isLight,
    required this.fontSize,
    required this.sliderValues,
    this.fontFamily,
    this.sliderIndex,
  });

  final String title;
  final String subtitle;
  final bool isLight;
  final double fontSize;
  final double sliderValues;
  final String? fontFamily;
  final dynamic sliderIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<UiDarkModeController>(
        builder: (context, controller, child) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: ShapeDecoration(
              color: isLight ? AppColors.cFFFFFF :  Color(0x66061420),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: isLight ? AppColors.cE8E8E8 :  Color(0xFF304F6B),
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextFontStyle.textStyle18w500cF9F6F0Raleway.copyWith(
                    color: isLight ? AppColors.c000000 :  AppColors.cF9F6F0,
                    fontWeight: FontWeight.w600,

                  ),
                ),
                UIHelper.verticalSpace(12.h),



                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    subtitle,
                    style: TextFontStyle.textStyle16w500B8B8B8Raleway.copyWith(
                      color: isLight ? Colors.black :  Color(0xFFB8B8B8),
                      fontSize:fontSize ,
                      fontFamily:fontFamily,
                    ),
                    // textDirection: index == 0 ? TextDirection.rtl : TextDirection.ltr,
                  ),
                ),



                UIHelper.verticalSpace(12.h),
                Row(
                  children: [
                    Text(
                      'T',
                      style: TextFontStyle.textStyle16w500B8B8B8Raleway.copyWith(
                        fontSize: 12.sp,
                        color: isLight ? AppColors.c000000 :  AppColors.cB8B8B8,

                      ),
                    ),
                    UIHelper.horizontalSpace(8.w),
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 5.h,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.r),
                          overlayShape: SliderComponentShape.noOverlay,
                          activeTrackColor: AppColors.c72BBFF,
                          inactiveTrackColor: AppColors.cE8E8E8,
                          thumbColor: AppColors.c72BBFF,
                        ),
                        child: Slider(
                          value: sliderValues,
                          min: 0.0,
                          max: 1.0,
                          onChanged: (newValue) => controller.updateSingleSlider(sliderIndex, newValue),
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpace(8.w),
                    Text(
                      'T',
                      style: TextFontStyle.textStyle16w500B8B8B8Raleway.copyWith(
                        color: isLight ? AppColors.c000000 :  AppColors.cB8B8B8,
                        fontSize: 20.sp,

                      ),
                    ),
                  ],
                ),
              ],
            ),);
        } );
  }
}