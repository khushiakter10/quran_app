import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/quran_academy/quran_in_english/quran_opening_play/widget/quran_play_appbar.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class AlFatihaScreen extends StatefulWidget {
  const AlFatihaScreen({super.key});

  @override
  State<AlFatihaScreen> createState() => _AlFatihaScreenState();
}

class _AlFatihaScreenState extends State<AlFatihaScreen> {



  final AudioPlayer _audioPlayer = AudioPlayer();
  double _sliderValue = 0.0;

  final Duration _startPosition = Duration(seconds: 30);
  final Duration _endPosition = Duration(seconds: 90);

  Duration _currentPosition = Duration(seconds: 30);
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    _audioPlayer.onPlayerComplete.listen((event) {
      _stopPlayback();
    });

    _audioPlayer.onPositionChanged.listen((Duration position) {
      if (_isPlaying) {
        if (position >= _startPosition && position <= _endPosition) {
          setState(() {
            _currentPosition = position;
            _sliderValue = (position.inMilliseconds - _startPosition.inMilliseconds) /
                (_endPosition.inMilliseconds - _startPosition.inMilliseconds);
          });
        } else if (position >= _endPosition) {
          _stopPlayback();
        }
      }
    });
  }

  Future<void> _startPlayback() async {
    await _audioPlayer.play(AssetSource('audio/quran_al_fatihah.mp3'));
    await _audioPlayer.seek(_currentPosition);
    setState(() {
      _isPlaying = true;
    });
  }

  Future<void> _stopPlayback() async {
    await _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    _isPlaying ? _stopPlayback() : _startPlayback();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
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
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [

                      QuranPlayAppbar(
                        text: 'Al-Fatihah',
                        subtitle: 'الفاتحة',
                        showIcon: false,
                        onTap: () => Navigator.of(context).pop(),
                      ),

                      UIHelper.verticalSpace(24.h),


                      Spacer(),

                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 5,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
                          overlayShape: SliderComponentShape.noOverlay,
                          activeTrackColor: AppColors.c72BBFF,
                          inactiveTrackColor: AppColors.c304F6B,
                          thumbColor: AppColors.cFFFFFF,

                        ),
                        child: Slider(
                          value: _sliderValue,
                          min: 0.0,
                          max: 1.0, onChanged: (double value) {},

                        ),
                      ),
                      UIHelper.verticalSpace(4.h),



                      Row(
                        children: [
                          Text(
                              _formatDuration(_currentPosition),
                              style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                                  fontWeight: FontWeight.w400,fontSize: 14.sp
                              )
                          ),
                          Spacer(),
                          Text(
                              _formatDuration(_endPosition),
                              style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                                fontWeight: FontWeight.w400,fontSize: 14.sp,
                              )
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.transparent,
                            child: SvgPicture.asset(AppIcons.doubleArrow),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: isLight ?  AppColors.cDCD3C0 :  Color(0x26959595),
                            child: SvgPicture.asset(AppIcons.play_back),
                          ),

                          GestureDetector(
                            onTap: _togglePlayPause,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(
                                _isPlaying ? AppIcons.PlyIconssbalck : AppIcons.pausedblackicon,
                                height: 24.h,
                                color: AppColors.c000000,
                              ),
                            ),
                          ),

                          CircleAvatar(
                            radius: 25,
                            backgroundColor: isLight ?  AppColors.cDCD3C0 :  Color(0x26959595),
                            child: SvgPicture.asset(AppIcons.play_right),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.transparent,
                            child: SvgPicture.asset(AppIcons.play_loading),
                          ),
                        ],
                      ),
                      Spacer()

                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }}