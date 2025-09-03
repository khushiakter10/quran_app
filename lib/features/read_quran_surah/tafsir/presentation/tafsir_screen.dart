import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/features/read_quran_surah/tafsir/widget/custom_al_fatiha.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class TafsirScreen extends StatefulWidget {
  const TafsirScreen({super.key});

  @override
  State<TafsirScreen> createState() => _TafsirScreenState();
}

class _TafsirScreenState extends State<TafsirScreen> {
  bool isLoved = false;
  final List<Map<String, dynamic>> categories = const [
    {'label': 'Al-Fatihah 1:1'},
    {'label': 'Al-Fatihah 1:2'},
    {'label': 'Al-Fatihah 1:3'},
    {'label': 'Al-Fatihah 1:4'},
  ];
  int selectedIndex = 0;

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
          image: isStarfield
              ? DecorationImage(
            image: AssetImage(AppImages.personalizationbacroundImage),
            fit: BoxFit.cover,
          )
              : null,
          gradient:
          isStarfield ? null : UiDarkModeHelper.getCurrentGradient(context),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                child: CustomAppbarWidget(
                  showIcon: false,
                  text: 'Tafsir',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    UIHelper.verticalSpace(24.h),
                    SizedBox(
                      height: 40.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: CustomAlFatiha(
                                borderRadius: BorderRadius.circular(8.r),
                                label: category['label'],
                                isSelected: index == selectedIndex,
                                isDisabled: false,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    UIHelper.verticalSpace(55.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        Text(
                          'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
                          textAlign: TextAlign.right,
                          style: TextFontStyle.titleStyle14w400cF9F6F0Raleway.copyWith(
                            fontFamily: controller.getFontFamilyByIndex(
                                controller.selectedLanguageIndex),
                            color: isStarfield
                                ? AppColors.cF9F6F0
                                : AppColors.c000000,
                            fontSize: controller.fontSize + (controller.sliderValues[0] * 14),
                          )
                        )


                      ],
                    ),
                    UIHelper.verticalSpace(24.h),
                    Divider(
                      color: isLight ? AppColors.cE8E8E8 : AppColors.c3F678C,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelper.verticalSpace(24.h),
                      Text(
                        'Translate:',
                        style: TextFontStyle.textStyle16w400c969696Raleway.copyWith(
                          color: isStarfield
                              ?  Color(0xFF969696)
                              : (isLight ? AppColors.c969696 : AppColors.c969696),
                        ),
                      ),
                      UIHelper.verticalSpace(8.h),
                      Padding(
                        padding: EdgeInsets.all(6.sp),
                        child: Text(
                          'Praise be to Allah, the Cherisher and Sustainer of the worlds;',
                          style: TextFontStyle.titleStyle16w500cF9F6F0Raleway.copyWith(
                            fontSize: controller.fontSize + (controller.sliderValues[1] * 14),
                            color: isStarfield
                                ?  Color(0xFFF9F6F0)
                                : (isLight ? AppColors.c000000 : AppColors.cF9F6F0),
                          ),
                        ),
                      ),
                      UIHelper.verticalSpace(40.h),
                      Text(
                        'Tafsir - English',
                        style: TextFontStyle.titleStyle16w500cF9F6F0Raleway.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: isStarfield
                              ?  Color(0xFFF9F6F0)
                              : (isLight ? AppColors.c000000 :  AppColors.cF9F6F0 ),
                        ),
                      ),
                      UIHelper.verticalSpace(24.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '1. "In the name of Allah" (بِسْمِ اللَّهِ):\n',
                              style: TextFontStyle.titleStyle16w400cF9F6F0Raleway.copyWith(
                                fontSize: controller.fontSize + (controller.sliderValues[1] * 14),
                                color: isStarfield
                                    ?  Color(0xFFF9F6F0)
                                    : (isLight ? AppColors.c000000 : AppColors.cF9F6F0 ),
                              ),
                            ),
                            TextSpan(
                              text:
                              'This phrase is called the Basmala.\nMuslims begin all important actions (like eating, studying, or entering a place) with this phrase.\nIt reflects seeking blessings, help, and approval from Allah in all deeds.\nThe word Allah is the personal name of God in Islam, encompassing all His attributes.\n',
                              style: TextFontStyle.titleStyle16w400cF9F6F0Raleway.copyWith(
                                fontSize: controller.fontSize + (controller.sliderValues[1] * 14),
                                color: isStarfield
                                    ?  Color(0xFFF9F6F0)
                                    : (isLight ? AppColors.c000000 :  AppColors.cF9F6F0),
                              ),
                            ),
                            TextSpan(
                              text: '2. "The Most Gracious" (الرَّحْمَٰنِ – Ar-Rahman):\n',
                              style: TextFontStyle.titleStyle16w400cF9F6F0Raleway.copyWith(
                                fontSize: controller.fontSize + (controller.sliderValues[1] * 14),
                                color: isStarfield
                                    ? const Color(0xFFF9F6F0)
                                    : (isLight ? AppColors.c000000 :  AppColors.cF9F6F0),
                              ),
                            ),
                            TextSpan(
                              text:
                              'Comes from the root word "rahmah", meaning mercy.\nAr-Rahman refers to Allah’s vast, unlimited mercy that covers all creation, regardless of their faith or actions.\n',
                              style: TextFontStyle.titleStyle16w400cF9F6F0Raleway.copyWith(
                                fontSize: controller.fontSize + (controller.sliderValues[1] * 14),
                                color: isStarfield
                                    ? const Color(0xFFF9F6F0)
                                    : (isLight ? AppColors.c000000 : AppColors.cF9F6F0),
                              ),
                            ),
                            TextSpan(
                              text: '3. "The Most Merciful" (الرَّحِيمِ – Ar-Rahim):\n',
                              style: TextFontStyle.titleStyle16w400cF9F6F0Raleway.copyWith(
                                fontSize: controller.fontSize + (controller.sliderValues[1] * 14),
                                color: isStarfield
                                    ?  Color(0xFFF9F6F0)
                                    : (isLight ? AppColors.c000000 :  AppColors.cF9F6F0),
                              ),
                            ),
                            TextSpan(
                              text:
                              'Also from "rahmah", but more specific and consistent.\nAr-Rahim refers to Allah’s special mercy shown especially to believers, in both this world and the Hereafter.',
                              style: TextFontStyle.titleStyle16w400cF9F6F0Raleway.copyWith(
                                fontSize: controller.fontSize + (controller.sliderValues[1] * 14),
                                color: isStarfield
                                    ?  Color(0xFFF9F6F0)
                                    : (isLight ? AppColors.c000000 :  AppColors.cF9F6F0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  });}
}