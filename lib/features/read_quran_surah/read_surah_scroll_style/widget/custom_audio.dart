import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_scroll_style/widget/custom_advanced_settings.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_scroll_style/widget/custom_qari.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_word_for_word/widget/custom_button_cancel.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';
import 'custom_ayat_number.dart';

class CustomPlay extends StatefulWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onScrollTap;

  const CustomPlay({
    super.key,
    required this.title,
    required this.subtitle,
    this.onScrollTap,
  });

  @override
  State<CustomPlay> createState() => _CustomPlayState();
}

class _CustomPlayState extends State<CustomPlay> {
  final List<String> options = [
    'None',
    '1 time',
    '2 times',
    '5 times',
    '10 times',
    '30 times',
    'Infinity',
  ];

  String selectedOption = 'None';

  void _showBottomSheet(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    showModalBottomSheet(
      backgroundColor: isLight ? AppColors.cF9F6F0: AppColors.bottomshetColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: 483.h,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 24.w),
                  child: Column(
                    children: [
                      Text(
                        'Audio',
                        style: TextStyle(
                          color: isLight ? Colors.black : Colors.white,
                          fontSize: 24,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                          height: 1.64,
                        ),
                      ),
                      UIHelper.verticalSpace(24.h),

                      CustomAyatNumber(),

                      UIHelper.verticalSpace(16.h),
                      Divider(color: isLight ? Colors.black54 : AppColors.c1C2A37, thickness: 1),
                      UIHelper.verticalSpace(16.h),

                      ///==================CustomQari Section  ===================
                      CustomQari(),

                      UIHelper.verticalSpace(16.h),
                      Divider(color: isLight ? Colors.black54 : AppColors.c1C2A37, thickness: 1),
                      UIHelper.verticalSpace(16.h),

                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.repeatIcon, height: 16.sp, color: isLight ? Colors.black : null),
                          SizedBox(width: 8),
                          Text(
                            'Repeat Verse',
                            style: TextStyle(
                              color: isLight ? Colors.black : Colors.white,
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          Text(
                            selectedOption,
                            style: TextStyle(
                              color: isLight ? Colors.black : Colors.white,
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w400,
                              height: 1.64,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          PopupMenuButton<String>(
                            onSelected: (String value) {
                              setModalState(() {
                                selectedOption = value;
                              });
                            },
                            icon: SvgPicture.asset(
                              AppIcons.arrwdropIcon,
                              height: 24.h,
                              color: isLight ? Colors.black : null,
                            ),
                            color: isLight ? Colors.white : Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                            itemBuilder: (BuildContext context) {
                              return options.map((String value) {
                                return PopupMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(color: isLight ? Colors.black : Colors.black, fontSize: 14.sp),
                                  ),
                                );
                              }).toList();
                            },
                          ),
                        ],
                      ),

                      UIHelper.verticalSpace(16.h),
                      Divider(color: isLight ? Colors.black54 : AppColors.c1C2A37, thickness: 1),
                      UIHelper.verticalSpace(16.h),

                      CustomAdvancedSettings(),

                      UIHelper.verticalSpace(16.h),
                      Divider(color: isLight ? Colors.black54 : AppColors.c1C2A37, thickness: 1),
                      UIHelper.verticalSpace(30.h),

                      CustomButtonCancel(
                        onFirstTap: () {
                          NavigationService.goBack;
                        },
                        onSecondTap: () {
                          NavigationService.goBack;
                        },
                        title: 'Cancel',
                        subtitle: 'Play',
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Center(
      child: Container(
        decoration: BoxDecoration(

          color: isLight ? const Color(0xCC061420) : const Color(0xCC061420),
          borderRadius: BorderRadius.circular(80.r),
          boxShadow: [
            BoxShadow(
              color: isLight ? Colors.black26 : const Color(0x51000000),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 8.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              GestureDetector(
                onTap: widget.onScrollTap,
                child: Column(
                  children: [
                    SvgPicture.asset(AppIcons.scrollICon, height: 24.h, color: isLight ? Colors.white : Colors.white),
                    UIHelper.verticalSpace(2.h),
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: isLight ? Colors.white : Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ],
                ),
              ),


              UIHelper.horizontalSpace(24.w),
              GestureDetector(
                onTap: () => _showBottomSheet(context),
                child: Column(
                  children: [
                    AbsorbPointer(
                      child: SvgPicture.asset(AppIcons.playaudioIcon, height: 24.h, color: isLight ? Colors.white : Colors.white),
                    ),
                    UIHelper.verticalSpace(2.h),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        color: isLight ? Colors.white : Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}