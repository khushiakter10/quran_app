import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

import '../../../assets_helper/app_icons.dart' show AppIcons;


class CustomAsharWidget extends StatefulWidget {
  final String text;
  const CustomAsharWidget({super.key, required this.text});

  @override
  State<CustomAsharWidget> createState() => _CustomAsharWidgetState();
}

class _CustomAsharWidgetState extends State<CustomAsharWidget> {


  Duration _countdown = Duration.zero;
  late Timer _timer;
  bool _hasPlayedTakbir = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Set a sample prayer time for Ashar (15:09 WIB today)
  late DateTime asharTime;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    asharTime = DateTime(now.year, now.month, now.day, 15, 9, 0);

    if (asharTime.isBefore(now)) {
      // If time already passed, move to next day
      asharTime = asharTime.add(Duration(days: 1));
    }

    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
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
    await _audioPlayer.play(AssetSource('takbir.mp3')); // Ensure you have this file in assets/
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

  @override
  Widget build(BuildContext context) {
    final timeText = _countdown == Duration.zero
        ? "Azan Time!"
        : "${_formatDuration(_countdown)} Menjelang Azan";

    return

      Container(
      decoration: BoxDecoration(
        color: AppColors.cBEE0FF,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.text,
                style: TextFontStyle.textStyle18w600c000000Raleway),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(timeText,
                    style: TextFontStyle.textStyle12w400c000000Raleway),
                UIHelper.horizontalSpace(4.w),
                Container(
                  decoration: ShapeDecoration(
                    color: Color(0xFFF1F8FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.volumIcon, height: 12.h),
                        UIHelper.horizontalSpace(2.w),
                        Text(
                          'Takbir',
                          style: TextStyle(
                            color: const Color(0xFF5185B5),
                            fontSize: 10,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w600,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                 Spacer(),

                  GestureDetector(
                    onTap: (){
                      NavigationService.navigateTo(Routes.giblaScreen);
                    },
                    child: Image.asset(AppImages.kabagharIcon, height: 60.h)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
