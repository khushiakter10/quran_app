import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_word_for_word/widget/custom_button_cancel.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class CustomUseful extends StatefulWidget {
  const CustomUseful({super.key});

  @override
  State<CustomUseful> createState() => _CustomUsefulState();
}

class _CustomUsefulState extends State<CustomUseful> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              NavigationService.goBack;
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: isLight ? Color(0xFFE8E8E8) : AppColors.c1E2F3F,
                borderRadius: BorderRadius.circular(80.r),
              ),
              child: Center(
                child: Text(
                  'Cancel',
                  style: TextFontStyle.textStyle16w500c969696NeutrifPro.copyWith(
                      color: isLight
                          ? AppColors.c000000
                          : AppColors.c969696),
                ),
              ),
            ),
          ),
        ),
        UIHelper.horizontalSpace(8.w),
        Expanded(
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor:
                isLight ? AppColors.cFFFFFF : AppColors.bottomshetColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r),
                  ),
                ),
                builder: (context) {
                  String? errorText;

                  return StatefulBuilder(
                    builder: (context, setModalState) {
                      return Container(
                        height: 350.h,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              vertical: 25.h, horizontal: 24.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Bookmark',
                                textAlign: TextAlign.center,
                                style: TextFontStyle
                                    .titleStyle16w500cF9F6F0Raleway
                                    .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.sp,
                                  color: isStarfield
                                      ? Color(0xFFF9F6F0)
                                      : (isLight
                                      ? AppColors.c000000
                                      : AppColors.cFFFFFF),
                                ),
                              ),
                              UIHelper.verticalSpace(24.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      NavigationService.goBack;
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: AppColors.c72BBFF,
                                        borderRadius:
                                        BorderRadius.circular(40.r),
                                      ),
                                      child: SvgPicture.asset(
                                        AppIcons.withaddIcon,
                                        height: 24.h,
                                      ),
                                    ),
                                  ),
                                  UIHelper.horizontalSpace(8.w),
                                  Text(
                                    'Create new list',
                                    style: TextFontStyle
                                        .titleStyle16w500cF9F6F0Raleway
                                        .copyWith(
                                      fontSize: 18.sp,
                                      color: isStarfield
                                          ? Color(0xFFF9F6F0)
                                          : (isLight
                                          ? AppColors.c000000
                                          : AppColors.cFFFFFF),
                                    ),
                                  ),
                                ],
                              ),
                              UIHelper.verticalSpace(16.h),
                              Divider(
                                color: isLight
                                    ? AppColors.cE8E8E8
                                    : AppColors.c3F678C,
                                thickness: 1,
                              ),
                              UIHelper.verticalSpace(16.h),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.bookmarkuseful,
                                    height: 24.h,
                                  ),
                                  UIHelper.horizontalSpace(12.w),
                                  Text(
                                    'Useful',
                                    style: TextFontStyle
                                        .titleStyle16w500cF9F6F0Raleway
                                        .copyWith(
                                      fontSize: 18.sp,
                                      color: isStarfield
                                          ? Color(0xFFF9F6F0)
                                          : (isLight
                                          ? AppColors.c000000
                                          : AppColors.cFFFFFF),
                                    ),
                                  ),
                                  const Spacer(),
                                  Checkbox(
                                    activeColor: AppColors.c72BBFF,
                                    checkColor: Colors.black,
                                    value: isChecked,
                                    onChanged: (value) {
                                      setModalState(() {
                                        isChecked = value!;
                                        errorText = null;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              if (errorText != null)
                                Padding(
                                  padding: EdgeInsets.only(top: 8.h),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      errorText!,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              UIHelper.verticalSpace(16.h),
                              Divider(
                                color: isLight
                                    ? AppColors.cE8E8E8
                                    : AppColors.c3F678C,
                                thickness: 1,
                              ),
                              UIHelper.verticalSpace(16.h),
                              CustomButtonCancel(
                                onFirstTap: () {
                                  NavigationService
                                      .navigateTo(Routes.readSurahWordForWordScreen);
                                },
                                onSecondTap: () {
                                  if (isChecked) {
                                    NavigationService
                                        .navigateTo(Routes.readSurahWordForWordScreen);
                                  } else {
                                    setModalState(() {
                                      errorText = 'Please select any bookmark list';
                                    });
                                  }
                                },
                                title: 'Cancel',
                                subtitle: 'Done',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 11.h),
              decoration: BoxDecoration(
                color: AppColors.c72BBFF,
                borderRadius: BorderRadius.circular(80.r),
              ),
              child: Center(
                child: Text(
                  'Create & Add',
                  style: TextFontStyle.textStyle16w500c000000NeutrifPro.copyWith(
                    color: isLight ? AppColors.c000000 : AppColors.c000000,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
