import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/audio_quran/widget/custom_audio.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class AudioQuranScreen extends StatefulWidget {
  const AudioQuranScreen({super.key});

  @override
  State<AudioQuranScreen> createState() => _AudioQuranScreenState();
}

class _AudioQuranScreenState extends State<AudioQuranScreen> {
  final List<String> number = ['1', '2', '3', '4', '5', '6', '7', '8'];
  final List<String> title = [
    'Al-Fatihah',   // <-- comma added here
    'Al-Baqarah',
    'Ali Imraan',
    'An Nisaa',
    'Al Maa ida',
    'Al An aam',
    'Al Araaf',
    'Al Anfaal',
  ];
  final List<String> subtitle = [
    '12 min',
    '12 min',
    '12 min',
    '12 min',
    '12 min',
    '12 min',
    '12 min',
    '12 min',
  ];
  final List<String> pausedIcons = List.filled(8, 'assets/icons/puasedIcon.svg');
  final List<String> playIcons = List.filled(8, 'assets/icons/playicon.svg');

  late List<bool> isPlayingList;

  final AudioPlayer _audioPlayer = AudioPlayer();
  double _sliderValue = 0.0;
  final Duration _startPosition = Duration(seconds: 30);
  final Duration _endPosition = Duration(seconds: 90);
  Duration _currentPosition = Duration(seconds: 30);
  bool _isPlaying = false;
  int? _currentPlayingIndex;

  @override
  void initState() {
    super.initState();
    // Ensure all lists have the same length, assert to catch mistakes early
    assert(number.length == title.length &&
        number.length == subtitle.length &&
        number.length == pausedIcons.length &&
        number.length == playIcons.length);

    isPlayingList = List.generate(number.length, (index) => false);
    _audioPlayer.onPlayerComplete.listen((event) => _stopPlayback());
    _audioPlayer.onPositionChanged.listen((Duration position) {
      if (_currentPlayingIndex != null) {
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

  Future<void> _startPlayback(int index) async {
    await _audioPlayer.play(AssetSource('audio/quran_al_fatihah.mp3'));
    await _audioPlayer.seek(_currentPosition);
    setState(() {
      _isPlaying = true;
      _currentPlayingIndex = index;
      for (int i = 0; i < isPlayingList.length; i++) {
        isPlayingList[i] = (i == index);
      }
    });
  }

  Future<void> _stopPlayback() async {
    await _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
      for (int i = 0; i < isPlayingList.length; i++) {
        isPlayingList[i] = false;
      }
    });
  }

  void _closeFloatingPlayer() {
    _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
      _currentPlayingIndex = null;
      isPlayingList = List.filled(isPlayingList.length, false);
    });
  }

  void _togglePlayPause([int? index]) {
    if (index != null) {
      if (_currentPlayingIndex == index) {
        if (_isPlaying) {
          _stopPlayback();
        } else {
          _startPlayback(index);
        }
      } else {
        _startPlayback(index);
      }
    } else {
      if (_currentPlayingIndex != null) {
        if (_isPlaying) {
          _stopPlayback();
        } else {
          _startPlayback(_currentPlayingIndex!);
        }
      }
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
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
                CustomAppbarWidget(
                  showIcon: false,
                  text: 'Audio Quran',
                  onTap: () => NavigationService.goBack(),
                ),
                UIHelper.verticalSpace(24.h),


                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: isLight ? AppColors.cF9F6F0 :  Color(0x6605131F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                          child: Column(
                            children: List.generate(number.length, (index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => SurahDetailScreen(
                                            surahIndex: index,
                                            surahTitle: title[index],
                                            surahSubtitle: subtitle[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          number[index],
                                          style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                                            fontSize: 16.sp,
                                            color: isStarfield
                                                ? AppColors.cF9F6F0
                                                : (UiDarkModeHelper.isDarkMode(context)
                                                ?AppColors.cF9F6F0
                                                : AppColors.c000000),
                                          ),
                                        ),
                                        UIHelper.horizontalSpace(16.w),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              title[index],
                                              style: TextFontStyle.titleStyle16w500cF9F6F0Raleway.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: isStarfield
                                                    ? AppColors.cF9F6F0
                                                    : (UiDarkModeHelper.isDarkMode(context)
                                                    ?AppColors.cF9F6F0
                                                    : AppColors.c000000),
                                              ),
                                            ),
                                            Text(
                                              subtitle[index],
                                              style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                                                fontSize: 14.sp,
                                                color: isStarfield
                                                    ? AppColors.cF9F6F0
                                                    : (UiDarkModeHelper.isDarkMode(context)
                                                    ?AppColors.cF9F6F0
                                                    : AppColors.c000000),
                                              ),
                                            ),
                                          ],
                                        ),
                                         Spacer(),
                                        GestureDetector(
                                          onTap: () => _togglePlayPause(index),
                                          child: SvgPicture.asset(
                                            isPlayingList[index] ? playIcons[index] : pausedIcons[index],
                                            width: 24.w,
                                            height: 24.h,
                                            color: isLight ? AppColors.c72BBFF :  AppColors.c72BBFF,

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  UIHelper.verticalSpace(16.h),
                                  if (index < number.length - 1)
                                    Divider(
                                      color: isLight ? AppColors.cE8E8E8 : AppColors.c3F678C,
                                      thickness: 1,
                                    ),
                                 UIHelper.verticalSpace(16.h),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _currentPlayingIndex != null
          ? Container(
        width: double.infinity,
        height: 133.h,
        decoration: BoxDecoration(
          color: isLight ? AppColors.cF9F6F0 :  AppColors.c304F6B,
          borderRadius: BorderRadius.circular(16),
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title[_currentPlayingIndex!],
                    style: TextFontStyle.textStyle18w500cF9F6F0Raleway.copyWith(
                      fontSize: 20.sp,
                      color: isStarfield
                          ? AppColors.cF9F6F0
                          : (UiDarkModeHelper.isDarkMode(context)
                          ?AppColors.cF9F6F0
                          : AppColors.c000000),
                    )
                  ),
                  GestureDetector(
                    onTap: _closeFloatingPlayer,
                    child: SvgPicture.asset(AppIcons.crosIcon,  color: isLight ? AppColors.c72BBFF :  AppColors.c72BBFF,),
                  ),
                ],
              ),
              UIHelper.verticalSpace(12.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: _togglePlayPause,
                    child: SvgPicture.asset(
                      _isPlaying ? AppIcons.playicons : AppIcons.puasedIcon,
                      height: 40.h,
                    ),
                  ),
                 UIHelper.horizontalSpace(12.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 5,
                            thumbShape:  RoundSliderThumbShape(enabledThumbRadius: 6),
                            overlayShape: SliderComponentShape.noOverlay,
                            activeTrackColor: AppColors.c72BBFF,
                            inactiveTrackColor: AppColors.c3F678C,
                            thumbColor: AppColors.cFFFFFF,
                          ),
                          child: Slider(
                            value: _sliderValue,
                            min: 0.0,
                            max: 1.0,
                            onChanged: (double value) {
                              setState(() {
                                _sliderValue = value;
                              });
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _formatDuration(_currentPosition),
                              style:  TextStyle(color: isLight ? AppColors.c000000 :  AppColors.cFFFFFF),
                            ),
                            Text(
                              _formatDuration(_endPosition),
                              style:  TextStyle(color: isLight ? AppColors.c000000 :  AppColors.cFFFFFF),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
          : null,
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}













