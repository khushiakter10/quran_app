import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/vocabulary/learn_tajweed_lesson/widget/lesson_appbar.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class LearnTajweedLessonScreen extends StatefulWidget {
  const LearnTajweedLessonScreen({super.key});

  @override
  State<LearnTajweedLessonScreen> createState() =>
      _LearnTajweedLessonScreenState();
}

class _LearnTajweedLessonScreenState extends State<LearnTajweedLessonScreen> {
  final FlutterTts flutterTts = FlutterTts();

  final List<String> title = [
    'ب',
    'ا',
    'ث',
    'ت',
    'ح',
    'ج',
    'د',
    'خ',
    'ر',
    'ذ',
    'س',
    'ز'

  ];



  final List<String> subtitle = [
    'با',
    'ا',
    'ثا',
    'تا',
    'حا',
    'جا',
    'دا',
    'خا',
    'را',
    'زا',
    'سا',
    'ز',
  ];




  final List<String> speakWords = [
    "باء",
    "ألف",
    "ثاء",
    "تاء",
    "جيم",
    "حاء",
    "خاء",
    "دال",
    "راء",
    "زاي",
    "سين",
    "صاد",
  ];


  final String pausedicon = AppIcons.pausedicon;
  final String playicon = AppIcons.playicon;

  int? currentlyPlayingIndex;

  @override
  void initState() {
    super.initState();

    flutterTts.setCompletionHandler(() {
      setState(() {
        currentlyPlayingIndex = null;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        currentlyPlayingIndex = null;
      });
    });
  }

  Future<void> _speak(int index) async {
    if (currentlyPlayingIndex == index) {

      await flutterTts.stop();
      setState(() {
        currentlyPlayingIndex = null;
      });
    } else {

      await flutterTts.stop();
      setState(() {
        currentlyPlayingIndex = index;
      });
      await flutterTts.setLanguage("ar-SA");
      await flutterTts.setPitch(1.0);
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.speak(speakWords[index]);
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          gradient: isStarfield ? null : UiDarkModeHelper.getCurrentGradient(context),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                LessonAppbar(
                  text: 'مفردات',
                  subtitle: 'Lesson 1',
                  showIcon: false,
                  onTap: () => Navigator.of(context).pop(),
                ),

                UIHelper.verticalSpace(24.h),


                Expanded(
                  child: GridView.builder(
                    itemCount: title.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 159 / 128,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final bool isPlaying = currentlyPlayingIndex == index;

                      return Container(
                        width: 159.w,
                        height: 121.h,
                        decoration: ShapeDecoration(

                          color: isPlaying
                              ? (isLight
                              ? AppColors.cBEE0FF
                              : isStarfield
                              ? AppColors.c72BBFF
                              : AppColors.c72BBFF  )
                              : (isLight
                              ? AppColors.cF9F6F0
                              : isStarfield
                              ? Color(0xB23D668B)
                              : AppColors.c304F6E ),

                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: isPlaying
                                  ? (isLight
                                  ? Colors.transparent
                                  : isStarfield
                                  ? AppColors.cA1D1FF
                                  : Colors.transparent)
                                  : (isLight
                                  ? Colors.transparent
                                  : isStarfield
                                  ? AppColors.c5185B5.withOpacity(0.22)
                                  : AppColors.c3F678C),
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 9.w, top: 6.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  GestureDetector(
                                    onTap: () => _speak(index),
                                    child:SvgPicture.asset(
                                      currentlyPlayingIndex == index ? playicon : pausedicon,
                                      height: 24.h,

                                    ),

                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    title[index],
                                    textAlign: TextAlign.center,
                                    style: TextFontStyle.titleStyle20w400c000000ArabicTypesetting.copyWith(
                                      fontSize: 40.sp,
                                      color: isPlaying
                                          ? (isLight ? Colors.black : Colors.black)
                                          : (isLight
                                          ? Colors.black
                                          : isStarfield
                                          ? Colors.white
                                          : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: isPlaying
                                    ? (isLight
                                    ? AppColors.cA1D1FF
                                    : isStarfield
                                    ? AppColors.c68AAE8
                                    : AppColors.c68AAE8 )
                                    : (isLight
                                    ? AppColors.cE3E0DA
                                    : isStarfield
                                    ? Color(0xB23D668B)
                                    : AppColors.c3D668E),
                                borderRadius:  BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 4.h),
                              child: Center(
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    subtitle[index],
                                    style: TextFontStyle.titleStyle20w400c000000ArabicTypesetting.copyWith(
                                      color: isPlaying
                                          ? (isLight ? Colors.black : Colors.black)
                                          : (isLight
                                          ? Colors.black
                                          : isStarfield
                                          ? Colors.white
                                          : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
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
        ),
      ),
    );
  }
}
