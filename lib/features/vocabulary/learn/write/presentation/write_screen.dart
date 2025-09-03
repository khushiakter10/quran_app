import 'dart:async';
import 'dart:ui' as ui;

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
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';


class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key, });

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> with TickerProviderStateMixin {
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  final TextEditingController fonSizeController = TextEditingController();
  final FlutterTts flutterTts = FlutterTts();

  bool showSyllable = true;
  int? currentlyPlayingIndex;
  bool isFilling = false;
  double _fillProgress = 0.0;
  Timer? _fillTimer;

  final List<String> speakWords = ['ب'];

  @override
  void initState() {
    super.initState();
    flutterTts.setCompletionHandler(() {
      setState(() => currentlyPlayingIndex = null);
    });
    flutterTts.setCancelHandler(() {
      setState(() => currentlyPlayingIndex = null);
    });
  }

  Future<void> _speak(int index) async {
    if (currentlyPlayingIndex == index) {
      await flutterTts.stop();
      setState(() => currentlyPlayingIndex = null);
    } else {
      await flutterTts.stop();
      setState(() => currentlyPlayingIndex = index);
      await flutterTts.setLanguage("ar-SA");
      await flutterTts.setPitch(1.0);
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.speak(speakWords[index]);
    }
  }

  void _onFinish() async {
    final image = await _signaturePadKey.currentState?.toImage();
    final bytes = await image?.toByteData(format: ui.ImageByteFormat.png);
    if (bytes != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Drawing finished, image size: ${bytes.lengthInBytes} bytes')),
      );
    }
  }

  void _clearSignature() {
    _signaturePadKey.currentState?.clear();
  }

  void _playFillAnimation() {
    if (isFilling) return;

    setState(() {
      isFilling = true;
      _fillProgress = 0.0;
    });

    const duration = Duration(milliseconds: 40);
    const step = 0.02;

    _fillTimer?.cancel();
    _fillTimer = Timer.periodic(duration, (timer) {
      setState(() {
        _fillProgress += step;
        if (_fillProgress >= 1.0) {
          _fillProgress = 1.0;
          isFilling = false;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    fonSizeController.dispose();
    flutterTts.stop();
    _fillTimer?.cancel();
    super.dispose();
  }

  void goToStep(int index) {}

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
          gradient: isStarfield
              ? null
              : UiDarkModeHelper.getCurrentGradient(context),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Column(
              children: [

                LearnCustom(
                  isDarkText: isLight,
                  currentStep: 1,
                  onTap: () {
                    NavigationService.goBack;
                  },
                  onSkip: () {
                    NavigationService.navigateTo(Routes.letterScreen);

                  },
                  onStepTap: (index) => goToStep(index),
                ),

                UIHelper.verticalSpace(24.h),
                Text(
                    'Write',
                    textAlign: TextAlign.center,
                    style: TextFontStyle.textStyle20w600cFEFEFERaleway.copyWith(
                      fontSize: 32.sp,fontWeight: FontWeight.w700,
                      color: isStarfield
                          ? AppColors.cFEFEFE
                          : (UiDarkModeHelper.isDarkMode(context)
                          ? AppColors.cFEFEFE
                          : AppColors.c484848),
                    )
                ),

                UIHelper.verticalSpace(24.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        color: AppColors.cE9DEC8,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Column(
                        children: [




                          SizedBox(
                            height: 250.h,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                if (showSyllable)
                                  IgnorePointer(
                                    child: CustomPaint(
                                      painter: isFilling
                                          ? _FillTextAnimationPainter(
                                        text: speakWords[0],
                                        fontSize: 128.sp,
                                        progress: _fillProgress,
                                      )
                                          : _StrokeTextPainter(
                                        text: speakWords[0],
                                        fontSize: 228.sp,
                                        color: const Color(0xFF484848),
                                      ),
                                      size: Size(double.infinity, 150.h),
                                    ),
                                  ),

                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 250.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: 250.h,
                                    child: SfSignaturePad(
                                      key: _signaturePadKey,
                                      backgroundColor: Colors.transparent,
                                      strokeColor: AppColors.c000000,
                                      minimumStrokeWidth: 8,
                                      maximumStrokeWidth: 9,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),







                          UIHelper.verticalSpace(78.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              _circleIconButton(
                                onTap: _playFillAnimation,
                                iconPath: AppIcons.playarbibaIcon,
                              ),
                              _circleIconButton(
                                onTap: () => setState(() => showSyllable = !showSyllable),
                                iconWidget: Icon(
                                  showSyllable ? Icons.visibility_off : Icons.visibility,
                                  color: AppColors.cC7E4FF,
                                  size: 24.h,
                                ),
                              ),
                              _circleIconButton(
                                onTap: _clearSignature,
                                iconPath: AppIcons.finishIcon,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                CustomPersonalizationButton(
                  text: 'Continue',
                  onPressed: () {
                    NavigationService.navigateTo(Routes.letterScreen);
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _circleIconButton({
    required VoidCallback onTap,
    String? iconPath,
    Widget? iconWidget,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(40.r),
        ),
        padding: EdgeInsets.all(10),
        child: iconWidget ?? SvgPicture.asset(iconPath!, height: 24.h),
      ),
    );
  }
}

class _StrokeTextPainter extends CustomPainter {
  final String text;
  final double fontSize;
  final Color color;

  _StrokeTextPainter({required this.text, required this.fontSize, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      fontFamily: 'Amiri Quran',
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = color,
    );
    final textSpan = TextSpan(text: text, style: textStyle);
    final tp = TextPainter(text: textSpan, textAlign: TextAlign.center, textDirection: TextDirection.rtl);
    tp.layout();
    tp.paint(canvas, Offset((size.width - tp.width) / 2, (size.height - tp.height) / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _FillTextAnimationPainter extends CustomPainter {
  final String text;
  final double fontSize;
  final double progress;

  _FillTextAnimationPainter({required this.text, required this.fontSize, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: 'Amiri Quran',
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      textDirection: TextDirection.rtl,
    )..layout(maxWidth: size.width);

    final offset = Offset((size.width - textPainter.width) / 2, (size.height - textPainter.height) / 2);

    canvas.save();
    canvas.clipRect(Rect.fromLTWH(offset.dx, offset.dy, textPainter.width * progress, textPainter.height));
    textPainter.paint(canvas, offset);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _FillTextAnimationPainter oldDelegate) => progress != oldDelegate.progress;
}