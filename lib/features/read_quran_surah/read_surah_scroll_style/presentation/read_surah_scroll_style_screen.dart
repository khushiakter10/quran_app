import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_scroll_style/widget/custom_audio.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class ReadSurahScrollStyleScreen extends StatefulWidget {
  const ReadSurahScrollStyleScreen({super.key});

  @override
  State<ReadSurahScrollStyleScreen> createState() =>
      _ReadSurahScrollStyleScreenState();
}

class _ReadSurahScrollStyleScreenState extends State<ReadSurahScrollStyleScreen>
    with TickerProviderStateMixin {
  final List<String> data = ['1', '2', '3', '4', '5'];
  final List<String> title = [
    '[All] praise is [due] to Allah, Lord of the worlds',
    'The Most Compassionate, the Most Merciful',
    'Master of the Day of Judgment.',
    'It is You we worship and You we ask for help.',
    '[All] praise is [due] to Allah, Lord of the worlds',
  ];

  final List<String> subtitle = [
    'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
    'ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
    'مَٰلِكِ يَوْمِ ٱلدِّينِ',
    'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
    'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
  ];

  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;
  bool isScrolling = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await UiDarkModeHelper.initTheme(context);
      setState(() {});
    });
  }

  void toggleAutoScroll() {
    if (isScrolling) {
      stopAutoScroll();
    } else {
      startAutoScroll();
    }
  }

  void startAutoScroll() {
    const duration = Duration(milliseconds: 100);
    const scrollAmount = 2.0;

    setState(() {
      isScrolling = true;
    });

    _scrollTimer?.cancel();
    _scrollTimer = Timer.periodic(duration, (timer) {
      final currentOffset = _scrollController.offset;
      final newOffset = currentOffset + scrollAmount;

      if (newOffset >= _scrollController.position.maxScrollExtent) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        stopAutoScroll();
      } else {
        _scrollController.jumpTo(newOffset);
      }
    });
  }

  void stopAutoScroll() {
    _scrollTimer?.cancel();
    setState(() {
      isScrolling = false;
    });
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UiDarkModeController>(
        builder: (context, controller, child) {{

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Scaffold(
      body: Stack(
        children: [

          Container(
            width: double.infinity,
            height: double.infinity,

            decoration: BoxDecoration(
              color: isLight ? AppColors.cE9DEC8 : null,
              image: isStarfield
                  ? DecorationImage(
                      image: AssetImage(AppImages.personalizationbacroundImage),
                      fit: BoxFit.cover,
                    )
                  : null,
              gradient: isStarfield
                  ? null
                  : (isLight
                      ? null
                      : UiDarkModeHelper.getCurrentGradient(context)),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelper.verticalSpace(10.h),

                      Container(
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          color: isStarfield
                              ? AppColors.cE9DEC8
                              : (isLight
                                  ? AppColors.cFFFFFF
                                  : AppColors.cE9DEC8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                        ),
                        child: Column(
                          children: [
                            UIHelper.verticalSpace(16.h),

                            ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: data.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      UIHelper.verticalSpace(12.h),


                                      Text(
                                        data[index],
                                        style: TextStyle(
                                          color: isStarfield
                                              ? const Color(0xFF484848)
                                              : (isLight
                                                  ? const Color(0xFF484848)
                                                  : Colors.black),
                                          fontSize: 16,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w400,
                                          height: 1.64,
                                        ),
                                      ),
                                      UIHelper.verticalSpace(8.h),

                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              title[index],
                                              style: TextFontStyle
                                                  .textStyle12w400c484848Raleway
                                                  .copyWith(
                                                fontSize: controller.fontSize + (controller.sliderValues[1] * 14),
                                                color: isStarfield
                                                    ?  Color(0xFF484848)
                                                    : (isLight
                                                        ?  Color(
                                                            0xFF484848)
                                                        : Colors.black),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              subtitle[index],
                                              textAlign: TextAlign.right,
                                              style: TextFontStyle
                                                  .titleStyle24w400c000000Persian
                                                  .copyWith(
                                                fontSize: controller.fontSize + (controller.sliderValues[0] * 14),
                                                color: isStarfield
                                                    ? AppColors.c000000
                                                    : (isLight
                                                        ? const Color(
                                                            0xFF484848)
                                                        : Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      UIHelper.verticalSpace(12.h),

                                      Divider(
                                        color: isLight
                                            ? AppColors.cE8E8E8
                                            : AppColors.cD5CEC1.withOpacity(
                                                0.3),
                                        thickness: 2,
                                      ),
                                      UIHelper.verticalSpace(8.h),
                                    ],
                                  ),
                                );
                              },
                            ),
                            UIHelper.verticalSpace(80.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          ///==============================Setting Icon=========================
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CustomAppbarWidget(
                  onTap:  (){NavigationService.navigateTo(Routes.readQuranSurahScreen);},
                  text: '1. Al-Fatihah',
                  icon: GestureDetector(
                      onTap:  (){NavigationService.navigateTo(Routes.readSurahSettingScreen);},
                      child: SvgPicture.asset(AppIcons.settingICon, height: 24.h)),
                ),
              ),
            ),
          ),


          Positioned(
            bottom: 100.h,
            left: 15.w,
            right: 15.w,
            child: CustomPlay(
              title: isScrolling ? 'Stop Scrolling' : 'Auto Scroll',
              subtitle: 'Play Audio',
              onScrollTap: toggleAutoScroll,
            ),
          ),





        ],
      ),
    );
  }
}
    );}}