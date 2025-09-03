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
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class ReadSurahVerseByVerseScreen extends StatefulWidget {
  const ReadSurahVerseByVerseScreen({super.key});

  @override
  State<ReadSurahVerseByVerseScreen> createState() =>
      _ReadSurahVerseByVerseScreenState();
}

class _ReadSurahVerseByVerseScreenState extends State<ReadSurahVerseByVerseScreen> {
  int? selectedIconIndex;
  double progress = 0.02;
  final int totalSteps = 7;

  void increaseProgress() {
    setState(() {
      progress += 0.05;
      if (progress > 1.0) progress = 1.0;
    });
  }

  void decreaseProgress() {
    setState(() {
      progress -= 0.05;
      if (progress < 0.0) progress = 0.0;
    });
  }

  void toggleIconSelection(int index) {
    setState(() {
      selectedIconIndex = selectedIconIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UiDarkModeController>(
      builder: (context, controller, child) {
        int currentStep = (progress * totalSteps).ceil().clamp(1, totalSteps);
        int percent = (progress * 100).round();

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
                    /// 🔒 Fixed App Bar
                    CustomAppbarWidget(
                      onTap: () {
                        NavigationService.navigateTo(Routes.readQuranSurahScreen);
                      },
                      text: '1. Al-Fatihah',
                      icon: GestureDetector(
                        onTap: () {
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

                    /// 🔽 Scrollable Content
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UIHelper.verticalSpace(24.h),
                            GestureDetector(
                              onTap: increaseProgress,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40.r),
                                child: LinearProgressIndicator(
                                  value: progress,
                                  minHeight: 6.h,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    isLight ? AppColors.c72BBFF : AppColors.cA1D1FF,
                                  ),
                                  backgroundColor: AppColors.cE8E8E8,
                                ),
                              ),
                            ),
                            UIHelper.verticalSpace(8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: decreaseProgress,
                                  child: Text(
                                    '${currentStep.toString().padLeft(2, '0')}/$totalSteps',
                                    style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                                      fontSize: 16.sp,
                                      color: isLight ? Colors.black : AppColors.cF9F6F0,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: increaseProgress,
                                  child: Text(
                                    '$percent%',
                                    style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                                      fontSize: 16.sp,
                                      color: isLight ? Colors.black : AppColors.cF9F6F0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(24.h),

                            /// Quran Container
                            Container(
                              height: 291.h,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: isLight
                                      ? AssetImage(AppImages.quranImage2)
                                      : AssetImage(AppImages.allhaImages),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 21.w, vertical: 30.h),
                                child: SingleChildScrollView(
                                  physics: NeverScrollableScrollPhysics(),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () => toggleIconSelection(0),
                                            child: buildSelectableIcon(0, AppIcons.heartIcon),
                                          ),
                                          UIHelper.horizontalSpace(4.w),
                                          GestureDetector(
                                            onTap: () {
                                              toggleIconSelection(1);
                                              showModalBottomSheet(
                                                context: context,
                                                backgroundColor: isLight
                                                    ? AppColors.cFFFFFF
                                                    : AppColors.bottomshetColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(32.r),
                                                    topRight: Radius.circular(32.r),
                                                  ),
                                                ),
                                                builder: (_) => CustomBookMarkScreen(
                                                  title: 'Bookmark',
                                                ),
                                              );
                                            },
                                            child: buildSelectableIcon(1, AppIcons.bookmarkIcon),
                                          ),
                                          UIHelper.horizontalSpace(4.w),
                                          Text(
                                            '1. Al-Fatihah',
                                            style: TextFontStyle
                                                .textStyle18w700c000000Raleway
                                                .copyWith(color: AppColors.c000000),
                                          ),
                                          UIHelper.horizontalSpace(15.w),
                                          GestureDetector(
                                            onTap: () {
                                              toggleIconSelection(2);
                                              NavigationService.navigateTo(Routes.tafsirScreen);
                                            },
                                            child: buildSelectableIcon(2, AppIcons.academicIcon),
                                          ),
                                          UIHelper.horizontalSpace(4.w),
                                          GestureDetector(
                                            onTap: () => toggleIconSelection(3),
                                            child: buildSelectableIcon(3, AppIcons.volumeHeight),
                                          ),
                                        ],
                                      ),
                                      UIHelper.verticalSpace(28.h),
                                      Text(
                                        'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                                        textAlign: TextAlign.center,
                                        style: TextFontStyle
                                            .titleStyle20w400c484848Persian
                                            .copyWith(
                                          fontSize: controller.fontSize +
                                              (controller.sliderValues[0] * 14),

                                          fontFamily: controller.getFontFamilyByIndex(
                                              controller.selectedLanguageIndex)

                                        ),
                                      ),
                                      UIHelper.verticalSpace(20.h),
                                      Text(
                                        'الْحَمْدُ لِلهِ رَبِّ العَالَمِينَ',
                                        textAlign: TextAlign.center,
                                        style: TextFontStyle
                                            .titleStyle28w400c000000MshQuraan1
                                            .copyWith(
                                          fontSize: controller.fontSize +
                                              (controller.sliderValues[0] * 14),
                                            fontFamily: controller.getFontFamilyByIndex(
                                                controller.selectedLanguageIndex)
                                        ),
                                      ),
                                      UIHelper.verticalSpace(26.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () => toggleIconSelection(4),
                                            child: buildSelectableIcon(4, AppIcons.sharesIcon),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            UIHelper.verticalSpace(24.h),
                            Text(
                              'Bismi Allāhi ar-Raḥmāni ar-Raḥīm\nAl-ḥamdu lillāhi Rabbi al-ʿālamīn',
                              style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                                fontWeight: FontWeight.w400,
                                color: isStarfield
                                    ? AppColors.cF9F6F0
                                    : (UiDarkModeHelper.isDarkMode(context)
                                    ? AppColors.cF9F6F0
                                    : AppColors.c484848),
                                fontSize: controller.fontSize +
                                    (controller.sliderValues[2] * 14),
                              ),
                            ),
                            UIHelper.verticalSpace(8.h),
                            Text(
                              'Translate:',
                              style: TextFontStyle.textStyle16w400c969696Raleway.copyWith(
                                color: isStarfield
                                    ? AppColors.c969696
                                    : (UiDarkModeHelper.isDarkMode(context)
                                    ? AppColors.c969696
                                    : AppColors.c000000),
                              ),
                            ),
                            UIHelper.verticalSpace(4.h),
                            Text(
                              'In the Name of Allah—the Most Compassionate, Most Merciful.',
                              style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                                color: isStarfield
                                    ? AppColors.cF9F6F0
                                    : (UiDarkModeHelper.isDarkMode(context)
                                    ? AppColors.cF9F6F0
                                    : AppColors.c484848),
                                fontWeight: FontWeight.w400,
                                fontSize: controller.fontSize +
                                    (controller.sliderValues[1] * 14),
                              ),
                            ),
                            UIHelper.verticalSpace(4.h),
                            Text(
                              '[All] praise is [due] to Allah, Lord of the\n worlds',
                              style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                                color: isStarfield
                                    ? AppColors.cF9F6F0
                                    : (UiDarkModeHelper.isDarkMode(context)
                                    ? AppColors.cF9F6F0
                                    : AppColors.c484848),
                                fontWeight: FontWeight.w400,
                                fontSize: controller.fontSize +
                                    (controller.sliderValues[1] * 14),
                              ),
                            ),
                            UIHelper.verticalSpace(30.h),

                            /// Finish buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: isLight
                                        ? AppColors.cF9F6F0
                                        : AppColors.c17314B,
                                  ),
                                  child: SvgPicture.asset(AppIcons.finishLeft),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    NavigationService.navigateTo(Routes.bottomNavBar);
                                  },
                                  child: Container(
                                    width: 144,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(33),
                                      color: AppColors.c72BBFF,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12.h, horizontal: 8.w),
                                      child: Text(
                                        'Finish',
                                        textAlign: TextAlign.center,
                                        style: TextFontStyle
                                            .textStyle14w500c000000Raleway
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80.r),
                                    color: isLight
                                        ? AppColors.cF9F6F0
                                        : AppColors.c17314B,
                                  ),
                                  child: SvgPicture.asset(AppIcons.finishright),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildSelectableIcon(int index, String iconPath) {
    bool isSelected = selectedIconIndex == index;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        color: isSelected ? AppColors.c72BBFF : AppColors.cF4EBDA,
      ),
      child: SvgPicture.asset(
        iconPath,
        height: 16.h,
        color: isSelected ? Colors.white : AppColors.c484848,
      ),
    );
  }
}
