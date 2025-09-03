import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/read_quran_juz/jus_display_setting/presentation/jus_display_setting_screen.dart';
import 'package:quran_app/features/read_quran_juz/juz_english_translation/widget/bookmark_quran_juz.dart';
import 'package:quran_app/features/read_quran_juz/juz_english_translation/widget_ply_audio/quran_audio.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class JuzEnglishTranslationScreen extends StatefulWidget {
  const JuzEnglishTranslationScreen({Key? key}) : super(key: key);

  @override
  State<JuzEnglishTranslationScreen> createState() => _JuzEnglishTranslationScreenState();
}

class _JuzEnglishTranslationScreenState extends State<JuzEnglishTranslationScreen> {
  bool isOn = true;

  final List<String> number = ['1', '2', '3', '4', '5', '6', '7'];

  final List<String> fatihaSurah = [
    'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
    'ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
    'مَٰلِكِ يَوْمِ ٱلدِّينِ',
    'مَٰلِكِ يَوْمِ ٱلدِّينِ',
    'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
    'ٱهْدِنَا ٱلصِّرَٰطَ ٱلْمُسْتَقِيمَ',
    'صِرَٰطَ ٱلَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ ٱلْمَغْضُوبِ عَلَيْهِمْ وَلَا ٱلضَّآلِّينَ',
  ];

  final List<String> title = [
    '[All] praise is [due] to Allah, Lord of the worlds',
    'The Most Compassionate, the Most Merciful',
    'Master of the Day of Judgment',
    'Master of the Day of Judgment',
    'It is You we worship and You we ask for help',
    'Guide us along the Straight Path',
    'The path of those You have blessed—not those You are displeased with or who are astray',
  ];

  int? selectedIndex;
  final ScrollController _scrollController = ScrollController();
  final ScrollController _listViewController = ScrollController();

  bool isAutoScrolling = false;
  Timer? autoScrollTimer;

  void toggleAutoScroll() {
    setState(() {
      isAutoScrolling = !isAutoScrolling;
    });

    if (isAutoScrolling) {
      autoScrollTimer = Timer.periodic(const Duration(milliseconds: 200), (_) {
        if (_listViewController.hasClients) {
          final maxScrollExtent = _listViewController.position.maxScrollExtent;
          final currentOffset = _listViewController.offset;

          if (currentOffset < maxScrollExtent) {
            _listViewController.animateTo(
              currentOffset + 2,
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear,
            );
          } else {
            toggleAutoScroll();
          }
        }
      });
    } else {
      autoScrollTimer?.cancel();
    }
  }

  @override
  void dispose() {
    autoScrollTimer?.cancel();
    _scrollController.dispose();
    _listViewController.dispose();
    super.dispose();
  }

  Widget _buildFABButton(
      String iconPath, String label, VoidCallback onTap, bool isLight) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            iconPath,
            height: 24.h,
            color: isLight ? AppColors.c000000 : AppColors.cFFFFFF,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: isLight ? AppColors.c000000 : AppColors.cFFFFFF,
            fontSize: 12.sp,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
      ],
    );
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
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    CustomAppbarWidget(
                      onTap: (){NavigationService.navigateTo(Routes.readQuranSurahScreen);},
                      text: '1. Al-Fatihah',
                      icon: GestureDetector(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  JusDisplaySettingScreen(initialIsOn: isOn),
                            ),
                          );
                          if (result != null && result is bool) {
                            setState(() {
                              isOn = result;
                            });
                          }
                        },
                        child: SvgPicture.asset(AppIcons.filtersIcon, height: 24.h),
                      ),
                    ),



                    UIHelper.verticalSpace(24.h),
                    Expanded(
                      child: ListView(
                        controller: _scrollController,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: isLight
                                  ? AppColors.cFFFFFF
                                  : AppColors.cE9DEC8,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 24.h),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          SvgPicture.asset(AppIcons.meccanIcon),
                                          UIHelper.verticalSpace(5.h),
                                          Text('Meccan',
                                              style: TextFontStyle
                                                  .textStyle12w400c484848Raleway),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text('Al-Fatihah',
                                              style: TextFontStyle
                                                  .textStyle14w500c000000Raleway
                                                  .copyWith(fontSize: 18.sp)),
                                          UIHelper.verticalSpace(5.h),
                                          Text('The Opening',
                                              style: TextFontStyle
                                                  .textStyle12w400c484848Raleway),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text('07',
                                              style: TextFontStyle
                                                  .textStyle14w500c000000Raleway
                                                  .copyWith(fontSize: 18.sp)),
                                          Text('Ayat',
                                              style: TextFontStyle
                                                  .textStyle12w400c484848Raleway),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                UIHelper.verticalSpace(10.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Divider(
                                      color: isLight
                                          ? AppColors.cB8B8B8
                                          : AppColors.c969696),
                                ),
                                UIHelper.verticalSpace(6.h),
                                Text('Surah: 1, Juz: 1',
                                    style: TextFontStyle
                                        .textStyle12w400c484848Raleway),
                                UIHelper.verticalSpace(24.h),
                                Divider(
                                    color: isLight
                                        ? AppColors.cB8B8B8
                                        : AppColors.c969696),
                                UIHelper.verticalSpace(20.h),
                                SizedBox(
                                  height: 400.h,
                                  child: ListView.separated(
                                    controller: _listViewController,
                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                    itemCount: number.length,
                                    separatorBuilder: (context, index) =>
                                        Padding(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 24.w),
                                          child: Divider(
                                              color: isLight
                                                  ? AppColors.cB8B8B8
                                                  : AppColors.c969696),
                                        ),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24.w, vertical: 8.h),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedIndex = index;
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: selectedIndex ==
                                                          index
                                                          ? Colors.grey
                                                          : (isStarfield
                                                          ? AppColors.cF4EBDA
                                                          : AppColors
                                                          .cF9F6F0),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          80.r),
                                                    ),
                                                    padding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 11.w),
                                                    child: Text(
                                                      number[index],
                                                      style: TextFontStyle
                                                          .textStyle12w400c484848Raleway
                                                          .copyWith(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        color: AppColors.c484848,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            UIHelper.verticalSpace(24.h),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: [
                                                if (isOn)
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      title[index],
                                                      style: TextFontStyle
                                                          .textStyle12w400c484848Raleway
                                                          .copyWith(
                                                        fontSize: controller
                                                            .fontSize +
                                                            (controller.sliderValues[
                                                            1] *
                                                                14),
                                                      ),
                                                    ),
                                                  ),
                                                if (isOn)
                                                  UIHelper.horizontalSpace(16.w),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    fatihaSurah[index],
                                                    textAlign: TextAlign.right,
                                                    style: TextFontStyle
                                                        .titleStyle24w400c000000Persian
                                                        .copyWith(
                                                      fontSize: controller
                                                          .fontSize +
                                                          (controller.sliderValues[
                                                          0] *
                                                              14),
                                                        fontFamily: controller.getFontFamilyByIndex(
                                                            controller.selectedLanguageIndex)
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),




          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            width: double.infinity,
            height: 64.h,
            color: isLight ? AppColors.c304F6B : AppColors.c72BBFF,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFABButton(AppIcons.scrollICon, 'Auto Scroll', toggleAutoScroll, isLight),
                _buildFABButton(AppIcons.bookwithIcon, 'Bookmark', () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: isLight
                        ? AppColors.cFFFFFF
                        : AppColors.bottomshetColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    builder: (context) {
                      return  BookmarkQuranJuz(title: 'BookMark');
                    },
                  );
                }, isLight),





                _buildFABButton(AppIcons.TafsirIcon, 'Tafsir', () {

                  NavigationService.navigateTo(Routes.tafsirScreen);

                }, isLight),


                _buildFABButton(
                  AppIcons.playaudioIcon,
                  'Play Audio',
                      () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: isLight ? AppColors.cF9F6F0 : AppColors.bottomshetColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.r),
                          topRight: Radius.circular(32.r),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return QuranAudio();
                      },
                    );
                  },
                  isLight,
                )

              ],
            ),
          ),
        );
      },
    );
  }
}



