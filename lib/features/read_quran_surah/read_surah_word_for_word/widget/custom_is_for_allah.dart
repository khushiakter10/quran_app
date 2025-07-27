import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class CustomIsForAllah extends StatelessWidget {
  const CustomIsForAllah({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UiDarkModeController>(
        builder: (context, controller, child) {
          final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
          final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
          final isLight = currentTheme == UiDarkModeHelper.lightTheme;

          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Text(
                'الْعَالَمِينَ',
                textAlign: TextAlign.right,
                style: TextFontStyle.titleStyle24w400c000000Persian.copyWith(
                  fontSize: controller.fontSize + (controller.sliderValues[0] * 14),
                ),
              ),

              UIHelper.horizontalSpace(18.w),

              Text(
                'رَبِّ',
                textAlign: TextAlign.right,
                style: TextFontStyle.titleStyle24w400c000000Persian.copyWith(
                  fontSize: controller.fontSize + (controller.sliderValues[0] * 14),
                ),
              ),

              UIHelper.horizontalSpace(18.w),

              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor:
                    isLight ? AppColors.cFFFFFF : AppColors.bottomshetColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    builder: (context) {
                      return Container(
                          height: 332.h,
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(vertical: 25.h,
                                horizontal: 24.w),
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                GestureDetector(


                                  onTap: () {
                                    NavigationService.goBack();
                                  },


                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(12.sp),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.c666666),
                                            borderRadius: BorderRadius.circular(
                                                40.r)
                                        ),
                                        child: SvgPicture.asset(
                                          AppIcons.removeIcon,
                                          color: isLight
                                              ? AppColors.c727272
                                              : AppColors.cF9F6F0,
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Text(
                                    'Al-Fatihah 1:1:3',
                                    textAlign: TextAlign.center,
                                    style: TextFontStyle
                                        .titleStyle16w500cF9F6F0Raleway
                                        .copyWith(fontWeight: FontWeight.w600,
                                        fontSize: 24.sp,
                                        color: isStarfield
                                            ? Color(0xFFF9F6F0)
                                            : (isLight
                                            ? AppColors.c000000
                                            : AppColors.cFFFFFF)
                                    )
                                ),
                                UIHelper.verticalSpace(33.h),

                                Text(
                                  'رَبِّ',
                                  textAlign: TextAlign.center,
                                  style: TextFontStyle
                                      .titleStyle24w400c000000Persian.copyWith(
                                    fontSize: controller.fontSize + (controller.sliderValues[0] * 14),
                                  ),
                                ),
                                UIHelper.verticalSpace(10.h),
                                Text(
                                    '(the) Lord',
                                    textAlign: TextAlign.center,
                                    style: TextFontStyle
                                        .textStyle16w500B8B8B8Raleway.copyWith(
                                        fontSize: controller.fontSize + (controller.sliderValues[1] * 14),
                                        fontWeight: FontWeight.w400,
                                        color: isStarfield
                                            ? Color(0xFFB8B8B8)
                                            : (isLight
                                            ? AppColors.c484848
                                            : AppColors.cB8B8B8)
                                    )
                                ),
                                UIHelper.verticalSpace(33.h),


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 18.w, vertical: 12.h),
                                      decoration: BoxDecoration(
                                          color: AppColors.c72BBFF,
                                          borderRadius: BorderRadius.circular(
                                              8.r)
                                      ), child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.playwithICon, height: 24.h,),
                                        UIHelper.horizontalSpace(4.w),


                                        Text(
                                          'Play Audio',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(0xFFFEFEFE),
                                            fontSize: 16,
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.w500,
                                            height: 1.64,
                                          ),
                                        )

                                      ],
                                    ),
                                    ),
                                  ],
                                )

                              ],
                            ),
                          )
                      );
                    },
                  );
                },
                child: Text(
                  'لِلَّهِ',
                  textAlign: TextAlign.right,
                  style: TextFontStyle.titleStyle24w400c000000Persian.copyWith(
                    fontSize: controller.fontSize + (controller.sliderValues[0] * 14),
                  ),
                ),
              )
            ],
          );
        });
  }
}