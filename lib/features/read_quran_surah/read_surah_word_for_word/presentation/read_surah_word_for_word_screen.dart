import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_word_for_word/widget/custom_bookmark.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_word_for_word/widget/custom_is_for_allah.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class ReadSurahWordForWordScreen extends StatefulWidget {
  const ReadSurahWordForWordScreen({super.key});

  @override
  State<ReadSurahWordForWordScreen> createState() =>
      _ReadSurahWordForWordScreenState();
}

class _ReadSurahWordForWordScreenState
    extends State<ReadSurahWordForWordScreen> {
  int selectedItemIndex = -1;
  int selectedIconIndex = -1;

  void _handleIconTap(int itemIndex, int iconIndex) {
    setState(() {
      if (selectedItemIndex == itemIndex && selectedIconIndex == iconIndex) {
        selectedItemIndex = -1;
        selectedIconIndex = -1;
      } else {
        selectedItemIndex = itemIndex;
        selectedIconIndex = iconIndex;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<UiDarkModeController>(
        builder: (context, controller, child) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: isLight ? AppColors.cE9DEC8 : AppColors.cFFFFFF,
          image: isStarfield
              ? DecorationImage(
            image: AssetImage(AppImages.personalizationbacroundImage),
            fit: BoxFit.cover,
          )
              : null,
          gradient: isStarfield || isLight
              ? null
              : UiDarkModeHelper.getCurrentGradient(context),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
           //================================ AppBar ======================///







                CustomAppbarWidget(
                  onTap:  (){NavigationService.navigateTo(Routes.readQuranSurahScreen);},
                  text: '1. Al-Fatihah',


                  icon: GestureDetector(
                    onTap: (){
                      NavigationService.navigateTo(Routes.readSurahSettingScreen);
                    },
                    child: SvgPicture.asset(
                      AppIcons.settingICon,
                      height: 24.h,
                      color: isStarfield
                          ? AppColors.cFFFFFF
                          : (isLight ? AppColors.c484848 : AppColors.cF9F6F0),
                    ),
                  ),
                ),





                UIHelper.verticalSpace(17.h),
///=============================== Listview================================///
                ///

                Expanded(
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, itemIndex) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isLight ? AppColors.cFFFFFF : AppColors.cE9DEC8,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => _handleIconTap(itemIndex, 0),
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: selectedItemIndex == itemIndex && selectedIconIndex == 0
                                            ? AppColors.c3F678C
                                            : AppColors.cF4EBDA,
                                        borderRadius: BorderRadius.circular(80.r),
                                      ),
                                      child: SvgPicture.asset(
                                        AppIcons.heartIcon,
                                        height: 16.h,
                                      ),
                                    ),
                                  ),
                                  UIHelper.horizontalSpace(4.w),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        backgroundColor: isLight ? AppColors.cFFFFFF : AppColors.bottomshetColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(32),
                                            topRight: Radius.circular(32),
                                          ),
                                        ),
                                        builder: (context) {
                                          return const CustomBookMarkScreen(title: 'BookMark');
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: selectedItemIndex == itemIndex && selectedIconIndex == 1
                                            ? AppColors.c3F678C
                                            : AppColors.cF4EBDA,
                                        borderRadius: BorderRadius.circular(80.r),
                                      ),
                                      child: SvgPicture.asset(
                                        AppIcons.bookmarkIcon,
                                        height: 16.h,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '1',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF484848),
                                      fontSize: 20,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w400,
                                      height: 1.64,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: selectedItemIndex == itemIndex && selectedIconIndex == 2
                                          ? AppColors.c3F678C
                                          : AppColors.cF4EBDA,
                                      borderRadius: BorderRadius.circular(80.r),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        NavigationService.navigateTo(Routes.tafsirScreen);
                                      },
                                      child: SvgPicture.asset(
                                        AppIcons.academicIcon,
                                        height: 16.h,
                                      ),
                                    ),
                                  ),
                                  UIHelper.horizontalSpace(4.w),
                                  GestureDetector(
                                    onTap: () => _handleIconTap(itemIndex, 3),
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: selectedItemIndex == itemIndex && selectedIconIndex == 3
                                            ? AppColors.c3F678C
                                            : AppColors.cF4EBDA,
                                        borderRadius: BorderRadius.circular(80.r),
                                      ),
                                      child: SvgPicture.asset(
                                        AppIcons.volumeHeight,
                                        height: 16.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              UIHelper.verticalSpace(32.h),


                               CustomIsForAllah(),


                              UIHelper.verticalSpace(4.h),
                              SizedBox(
                                width: double.infinity,
                                child: Wrap(
                                  spacing: 10.w,
                                  alignment: WrapAlignment.end,
                                  children: [
                                    Text(
                                      'of all the worlds',
                                      style: TextFontStyle.textStyle12w400c484848Raleway.copyWith(
                                        fontSize: controller.fontSize + (controller.sliderValues[1] * 14),
                                      ),
                                    ),
                                    Text(
                                      'the Lord',
                                      style: TextFontStyle.textStyle12w400c484848Raleway.copyWith(
                                        fontSize: controller.fontSize + (controller.sliderValues[1] * 14),
                                      ),
                                    ),
                                    Text(
                                      'is for Allah',
                                      style: TextFontStyle.textStyle12w400c484848Raleway.copyWith(
                                        fontSize: controller.fontSize + (controller.sliderValues[1] * 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              UIHelper.verticalSpace(18.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'الْحَمْدُ',
                                    style: TextFontStyle.titleStyle24w400c000000Persian.copyWith(
                                      fontSize: controller.fontSize + (controller.sliderValues[0] * 14),
                                        fontFamily: controller.getFontFamilyByIndex(
                                            controller.selectedLanguageIndex)
                                    )
                                  ),
                                ],
                              ),
                              UIHelper.verticalSpace(4.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children:  [
                                  Text('All praise',style: TextFontStyle.textStyle12w400c484848Raleway.copyWith(
                                    fontSize: controller.fontSize + (controller.sliderValues[1] * 14),
                                  ),),
                                ],
                              ),
                              UIHelper.verticalSpace(24.h),
                              Text(
                                'Translate:',
                                style: TextFontStyle.textStyle16w400c969696Raleway,
                              ),
                              UIHelper.verticalSpace(4.h),
                               Text('[All] praise is [due] to Allah, Lord of the worlds',
                                 style: TextFontStyle.textStyle12w400c484848Raleway.copyWith(
                                   fontSize: controller.fontSize + (controller.sliderValues[1] * 14),
                                 ),),
                              UIHelper.verticalSpace(16.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () => _handleIconTap(itemIndex, 4),
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: selectedItemIndex == itemIndex && selectedIconIndex == 4
                                            ? AppColors.c3F678C
                                            : AppColors.cF4EBDA,
                                      ),
                                      child: SvgPicture.asset(
                                        AppIcons.sharesIcon,
                                        height: 16.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  });
}}
