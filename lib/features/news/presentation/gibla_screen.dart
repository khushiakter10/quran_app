import 'dart:async';
import 'dart:math' as math;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class GiblaScreen extends StatefulWidget {
  const GiblaScreen({super.key});

  @override
  State<GiblaScreen> createState() => _GiblaScreenState();
}

class _GiblaScreenState extends State<GiblaScreen> {
  Duration _countdown = Duration.zero;
  late Timer _timer;
  bool _hasPlayedTakbir = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  late DateTime asharTime;
  double? _lastHeading;
  bool _compassError = false;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    asharTime = DateTime(now.year, now.month, now.day, 15, 9, 0);

    if (asharTime.isBefore(now)) {
      asharTime = asharTime.add(const Duration(days: 1));
    }

    _startCountdown();
  }

  String get timeText => _countdown == Duration.zero
      ? "Azan Time!"
      : "${_formatDuration(_countdown)} Menjelang Azan";

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final now = DateTime.now();
      final difference = asharTime.difference(now);

      if (difference <= Duration.zero && !_hasPlayedTakbir) {
        _playTakbir();
        _hasPlayedTakbir = true;
        _timer.cancel();
      }

      setState(() {
        _countdown = difference.isNegative ? Duration.zero : difference;
      });
    });
  }

  void _playTakbir() async {
    try {
      await _audioPlayer.play(AssetSource('takbir.mp3'));
    } catch (e) {
      debugPrint('Error playing takbir: $e');
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inHours)}:${twoDigits(duration.inMinutes % 60)}:${twoDigits(duration.inSeconds % 60)}";
  }

  @override
  void dispose() {
    _timer.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  Widget _buildCompass() {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          if (!_compassError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Compass not available")),
              );
            });
            _compassError = true;
          }
          return Icon(Icons.error_outline, size: 50, color: Colors.red);
        }

        if (!snapshot.hasData || snapshot.data!.heading == null) {
          return Text("No compass data",
              style: TextFontStyle.textStyle12w400c000000Raleway);
        }

        _lastHeading = snapshot.data!.heading;
        return Transform.rotate(
          angle: (_lastHeading! * (math.pi / 180) * -1),
          child: Image.asset(AppImages.compassImage, width: 200.w),
        );
      },
    );
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
          gradient: isStarfield
              ? null
              : UiDarkModeHelper.getCurrentGradient(context),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: Column(
              children: [
                CustomAppbarWidget(
                  showIcon: false,
                  text: 'Qibla',
                  onTap: () {
                    NavigationService.goBack();
                  },
                ),
                UIHelper.verticalSpace(32.h),


                Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(

                   color: isLight ? AppColors.cF9F6F0 :   Color(0xFFE9DEC8),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Calibrate the phone for the right direction and turn on the location service',
                          textAlign: TextAlign.center,
                          style: TextFontStyle.titleStyle20w400c484848Persian.copyWith(
                            fontSize: 14.sp,
                            color: isStarfield
                                ? AppColors.c484848
                                : (UiDarkModeHelper.isDarkMode(context)
                                ?AppColors.c484848
                                : AppColors.c484848),
                          ),
                        ),
                        UIHelper.verticalSpace(40.h),

                        _buildCompass(),

                        UIHelper.verticalSpace(40.h),
                        Text(
                          'Ashar 15:09 WIB',
                          textAlign: TextAlign.center,
                          style: TextFontStyle.textStyle18w600c000000Raleway.copyWith(
                            color: isStarfield
                                ? AppColors.c484848
                                : (UiDarkModeHelper.isDarkMode(context)
                                ?AppColors.c484848
                                : AppColors.c484848),
                          ),
                        ),
                        UIHelper.verticalSpace(4.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              timeText,
                              style: TextFontStyle.textStyle12w400c000000Raleway.copyWith(
                                color: isStarfield
                                    ? AppColors.c484848
                                    : (UiDarkModeHelper.isDarkMode(context)
                                    ?AppColors.c484848
                                    : AppColors.c484848),
                              ),
                            ),
                            UIHelper.horizontalSpace(4.w),
                            Container(
                              decoration: ShapeDecoration(
                                color: Color(0xFFF1F8FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.r),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.volumebluicon, height: 12.h),
                                    UIHelper.horizontalSpace(2.w),
                                    Text(
                                      'Takbir',
                                      style: TextStyle(
                                        color: Color(0xFF5185B5),
                                        fontSize: 10.sp,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w600,
                                        height: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      UIHelper.verticalSpace(16.h),
                        Text(
                          'Distance from Mecca 517,82 Kilometers',
                          textAlign: TextAlign.center,
                          style:  TextFontStyle.titleStyle20w400c484848Persian.copyWith(
                            fontSize: 14.sp,
                            color: isStarfield
                                ? AppColors.c484848
                                : (UiDarkModeHelper.isDarkMode(context)
                                ?AppColors.c484848
                                : AppColors.c484848),
                          )
                        ),
                        UIHelper.verticalSpace(2.h),
                        Text(
                          'Turn on location to get right direction',
                          textAlign: TextAlign.center,
                          style:  TextFontStyle.titleStyle20w400c484848Persian.copyWith(
                            fontSize: 14.sp,
                            color: isStarfield
                                ? AppColors.c484848
                                : (UiDarkModeHelper.isDarkMode(context)
                                ?AppColors.c484848
                                : AppColors.c484848),
                          )
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
  }
}