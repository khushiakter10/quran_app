import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/features/vocabulary/learn/widget/learn_custom.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

import '../../../../helpers/navigation_service.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> with TickerProviderStateMixin {
  final TextEditingController fonSizeController = TextEditingController();
  double _sliderValue = 0.0;

  final FlutterTts flutterTts = FlutterTts();
  int? currentlyPlayingIndex;

  Timer? _timer;
  final List<String> speakWords = ['ب'];
  Duration _estimatedDuration = Duration(seconds: 2); // default fallback

  @override
  void initState() {
    super.initState();

    flutterTts.setCompletionHandler(() {
      _stopSliderAnimation();
      setState(() {
        currentlyPlayingIndex = null;
        _sliderValue = 1.0;
      });
    });

    flutterTts.setCancelHandler(() {
      _stopSliderAnimation();
      setState(() {
        currentlyPlayingIndex = null;
      });
    });
  }

  @override
  void dispose() {
    fonSizeController.dispose();
    flutterTts.stop();
    _stopSliderAnimation();
    super.dispose();
  }

  void _stopSliderAnimation() {
    _timer?.cancel();
    _timer = null;
  }

  void _startSliderAnimation(Duration duration) {
    _timer?.cancel();
    _sliderValue = 0.0;

    int totalTicks = duration.inMilliseconds ~/ 100;
    int currentTick = 0;

    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        currentTick++;
        _sliderValue = currentTick / totalTicks;

        if (_sliderValue >= 1.0) {
          _sliderValue = 1.0;
          _stopSliderAnimation();
        }
      });
    });
  }

  Future<void> _speak(int index) async {
    if (currentlyPlayingIndex == index) {
      await flutterTts.stop();
      _stopSliderAnimation();
      setState(() {
        currentlyPlayingIndex = null;
        _sliderValue = 0.0;
      });
    } else {
      await flutterTts.stop();
      _stopSliderAnimation();
      setState(() {
        currentlyPlayingIndex = index;
        _sliderValue = 0.0;
      });

      await flutterTts.setLanguage("ar-SA");
      await flutterTts.setPitch(1.0);
      await flutterTts.setSpeechRate(0.5);

      final text = speakWords[index];
      double baseTimePerChar = 0.06; // seconds per character
      double rate = 0.5;
      double estimatedSeconds = text.length * baseTimePerChar / rate;
      _estimatedDuration = Duration(milliseconds: (estimatedSeconds * 1000).toInt());

      _startSliderAnimation(_estimatedDuration);
      await flutterTts.speak(text);
    }
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
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LearnCustom(
                  isDarkText: isLight,
                  currentStep: 0,
                  onTap: () {
                    NavigationService.goBack();
                  },
                  onSkip: () {
                    NavigationService.navigateTo(Routes.letterScreen);
                  },
                  onStepTap: (index) => {},
                ),
                UIHelper.verticalSpace(24.h),
                Text(
                  'Learn',
                  textAlign: TextAlign.center,
                  style: TextFontStyle.textStyle20w600cFEFEFERaleway.copyWith(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    color: isStarfield
                        ? AppColors.cFEFEFE
                        : (UiDarkModeHelper.isDarkMode(context)
                        ? AppColors.cFEFEFE
                        : AppColors.c484848),
                  ),
                ),
                UIHelper.verticalSpace(24.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.cE9DEC8,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 32.w),
                    child: Column(
                      children: [
                        Text(
                          speakWords[0],
                          textAlign: TextAlign.center,
                          style: TextFontStyle.titleStyle128w400c484848amiriQuran,
                        ),
                        UIHelper.verticalSpace(50.h),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => _speak(0),
                              child: SvgPicture.asset(
                                currentlyPlayingIndex == 0
                                    ? AppIcons.pauseIcon
                                    : AppIcons.playarbibaIcon,
                                height: 32.h,
                              ),
                            ),
                            UIHelper.horizontalSpace(8.w),
                            Expanded(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  trackHeight: 5,
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 5.r + (_sliderValue * 1.r),
                                  ),
                                  overlayShape: SliderComponentShape.noOverlay,
                                  activeTrackColor: AppColors.c72BBFF,
                                  inactiveTrackColor: AppColors.cF1F8FF,
                                  thumbColor: AppColors.cFFFFFF,
                                ),
                                child: Slider(
                                  value: _sliderValue,
                                  min: 0.0,
                                  max: 1.0,
                                  onChanged: (val) {
                                    setState(() {
                                      _sliderValue = val;
                                      fonSizeController.text =
                                          (val * 100).toStringAsFixed(0);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),



                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpace(200.h),
                CustomPersonalizationButton(
                  text: 'Continue',
                  onPressed: () {
                    NavigationService.navigateTo(Routes.writeScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
