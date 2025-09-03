import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/features/read_quran_juz/juz_english_translation/widget_ply_audio/quran_ayat_number.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_scroll_style/widget/custom_advanced_settings.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_scroll_style/widget/custom_qari.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_word_for_word/widget/custom_button_cancel.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class QuranAudio extends StatefulWidget {
  final String? title;
  final String? subtitle;

  const QuranAudio({
    super.key,
    this.title,
    this.subtitle,
  });

  @override
  State<QuranAudio> createState() => _QuranAudioState();

  /// Call this method externally to show the bottom sheet.
  static void showAudioSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (BuildContext context) {
        return QuranAudio(); // The widget itself will handle state inside
      },
    );
  }
}

class _QuranAudioState extends State<QuranAudio> {
  final List<String> options = [
    'None',
    '1 time',
    '2 times',
    '5 times',
    '10 times',
    '30 times',
    'Infinity',
  ];
  String selectedOption = 'None';

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return StatefulBuilder(
      builder: (context, setModalState) {
        return Container(
          height: 483.h,
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 24.w),
              child: Column(
                children: [
                  Text(
                    widget.title ?? 'Audio',
                    style: TextStyle(
                      color: isLight ? Colors.black : Colors.white,
                      fontSize: 24,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                      height: 1.64,
                    ),
                  ),
                  UIHelper.verticalSpace(24.h),
                  QuranAyatNumber(),
                  UIHelper.verticalSpace(16.h),
                  Divider(color: isLight ? Colors.black54 : AppColors.c1C2A37, thickness: 1),
                  UIHelper.verticalSpace(16.h),
                  CustomQari(),
                  UIHelper.verticalSpace(16.h),
                  Divider(color: isLight ? Colors.black54 : AppColors.c1C2A37, thickness: 1),
                  UIHelper.verticalSpace(16.h),

                  /// Repeat Verse Dropdown
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.repeatIcon, height: 16.sp, color: isLight ? Colors.black : null),
                      SizedBox(width: 8),
                      Text(
                        'Repeat Verse',
                        style: TextStyle(
                          color: isLight ? Colors.black : Colors.white,
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Text(
                        selectedOption,
                        style: TextStyle(
                          color: isLight ? Colors.black : Colors.white,
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
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                        itemBuilder: (BuildContext context) {
                          return options.map((String value) {
                            return PopupMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black, fontSize: 14.sp),
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ],
                  ),

                  UIHelper.verticalSpace(16.h),
                  Divider(color: isLight ? Colors.black54 : AppColors.c1C2A37, thickness: 1),
                  UIHelper.verticalSpace(16.h),

                  CustomAdvancedSettings(),

                  UIHelper.verticalSpace(16.h),
                  Divider(color: isLight ? Colors.black54 : AppColors.c1C2A37, thickness: 1),
                  UIHelper.verticalSpace(30.h),

                  CustomButtonCancel(
                    onFirstTap: () {
                      NavigationService.goBack();
                    },
                    onSecondTap: () {
                      NavigationService.goBack();
                    },
                    title: 'Cancel',
                    subtitle: 'Play',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
