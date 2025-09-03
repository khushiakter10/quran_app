import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';
import '../../read_surah_word_for_word/widget/custom_button_cancel.dart';

class CustomAdvancedSettings extends StatefulWidget {
  const CustomAdvancedSettings({super.key});

  @override
  State<CustomAdvancedSettings> createState() => _CustomAdvancedSettingsState();
}

class _CustomAdvancedSettingsState extends State<CustomAdvancedSettings> {
  String selectedOption = 'None';

  final List<String> options = [
    'None',
    '0.5 sec',
    '1 sec',
    '2 sec',
    '5 sec',
    '10 sec',
    '30 sec',
    'Ayat length',
  ];

  Color _trackColor(bool isOn) {
    return isOn ? Colors.blue : Colors.grey;
  }

  void _showBottomSheet() {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    showModalBottomSheet(
      backgroundColor: isLight ? AppColors.cFFFFFF : AppColors.bottomshetColor,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      builder: (BuildContext context) {
        bool isPlaybackSpeedOn = false;
        bool isStopAfterRangeOn = false;
        bool isStreamWithoutDownloadOn = false;
        bool isScrollWhilePlayingOn = false;
        bool isWordByAudioHigh = false;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: 532.h,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding:
                  EdgeInsets.symmetric(vertical: 25.h, horizontal: 24.w),
                  child: Column(
                    children: [
                      Text(
                        'Advanced Settings',
                        style: TextStyle(
                          color:
                          isLight ? Colors.black : const Color(0xFFF9F6F0),
                          fontSize: 24,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.clock,
                              height: 16.sp,
                              color: isLight ? Colors.black : null),
                          SizedBox(width: 8),
                          Text(
                            'Delay between verse',
                            style: TextStyle(
                              color: isLight
                                  ? Colors.black
                                  : const Color(0xFFF9F6F0),
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          Text(
                            selectedOption,
                            style: TextStyle(
                              color: isLight
                                  ? Colors.black
                                  : const Color(0xFFF9F6F0),
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w400,
                              height: 1.64,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          PopupMenuButton<String>(
                            onSelected: (String value) {
                              setModalState(() {
                                selectedOption = value;
                              });
                            },
                            icon: SvgPicture.asset(
                              AppIcons.arrwdropIcon,
                              height: 24.h,
                              color: isLight ? Colors.black : null,
                            ),
                            color: isLight ? Colors.white : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r)),
                            itemBuilder: (BuildContext context) {
                              return options.map((String value) {
                                return PopupMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        color: isLight
                                            ? Colors.black
                                            : Colors.black,
                                        fontSize: 14.sp),
                                  ),
                                );
                              }).toList();
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Divider(
                          color: isLight ? Colors.black54 : AppColors.c1C2A37,
                          thickness: 1),
                      SizedBox(height: 16.h),
                      _buildSwitchRow(
                        icon: AppIcons.playCircle,
                        label: 'Playback speed',
                        value: isPlaybackSpeedOn,
                        onChanged: (val) =>
                            setModalState(() => isPlaybackSpeedOn = val),
                        isLight: isLight,
                      ),
                      _buildSwitchRow(
                        icon: AppIcons.afterRange,
                        label: 'Stop after range',
                        value: isStopAfterRangeOn,
                        onChanged: (val) =>
                            setModalState(() => isStopAfterRangeOn = val),
                        isLight: isLight,
                      ),
                      _buildSwitchRow(
                        icon: AppIcons.webIcon,
                        label: 'Stream without downloading',
                        value: isStreamWithoutDownloadOn,
                        onChanged: (val) => setModalState(
                                () => isStreamWithoutDownloadOn = val),
                        isLight: isLight,
                      ),
                      _buildSwitchRow(
                        icon: AppIcons.scrollgryIcon,
                        label: 'Scroll while playing',
                        value: isScrollWhilePlayingOn,
                        onChanged: (val) =>
                            setModalState(() => isScrollWhilePlayingOn = val),
                        isLight: isLight,
                      ),
                      _buildSwitchRow(
                        icon: AppIcons.notecopyIcon,
                        label: 'Word by word audio highlighting',
                        value: isWordByAudioHigh,
                        onChanged: (val) =>
                            setModalState(() => isWordByAudioHigh = val),
                        isLight: isLight,
                      ),
                      CustomButtonCancel(
                        onFirstTap: () {
                          NavigationService.goBack;
                        },
                        onSecondTap: () {
                          NavigationService.goBack;
                        },
                        title: 'Cancel',
                        subtitle: 'Save',
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSwitchRow({
    required String icon,
    required String label,
    required bool value,
    required Function(bool) onChanged,
    required bool isLight,
  }) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(icon,
                height: 16.h, color: isLight ? Colors.black : null),
            SizedBox(width: 4.w),
            Text(
              label,
              style: TextFontStyle.textStyle18w500cF9F6F0Raleway.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: isLight ? Colors.black : const Color(0xFFF9F6F0),
              ),
            ),
            Spacer(),
            Transform.scale(
              scale: 0.9,
              child: Switch(
                value: value,
                activeColor: Colors.white,
                activeTrackColor: isLight ? Colors.blue : _trackColor(value),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: isLight ? Colors.grey : _trackColor(value),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Divider(color: isLight ? Colors.grey : AppColors.c1C2A37, thickness: 1),
        SizedBox(height: 16.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Row(
      children: [
        SvgPicture.asset(AppIcons.advernceSetting,
            height: 16.h, color: isLight ? Colors.black : null),
        UIHelper.horizontalSpace(6.w),
        Text(
          'Advanced Settings',
          style: TextStyle(
            color: isLight
                ? Colors.black
                : const Color(0xFFF9F6F0),
            fontSize: 14,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w400,
            height: 1.64,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: _showBottomSheet,
          child: SvgPicture.asset(
            AppIcons.arrwIcon,
            height: 16.h,
            color: isLight ? Colors.black : null,
          ),
        ),
      ],
    );
  }
}