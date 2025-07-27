import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class QuranAyatNumber extends StatefulWidget {
  const QuranAyatNumber({super.key});

  @override
  State<QuranAyatNumber> createState() => _QuranAyatNumberState();
}

class _QuranAyatNumberState extends State<QuranAyatNumber> {
  final List<String> surahNumber = [
    '1. Al-Fatihah',
    '2. Al-Baqarah',
    '3. Aal-e-Imran',
    '4. An-Nisa',
    '5. Al-Anam',
  ];

  final List<int> ayat = List.generate(5, (index) => 1 + index);

  String? startSurah;
  int? startAyah;
  String? endSurah;
  int? endAyah;

  bool isSelectingStart = true;

  int selectedIndex = 0;
  final FixedExtentScrollController _surahScrollController = FixedExtentScrollController();

  @override
  void dispose() {
    _surahScrollController.dispose();
    super.dispose();
  }

  void _openBottomSheet({required bool isStart}) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;
    isSelectingStart = isStart;

    showModalBottomSheet(
      enableDrag: false,
      context: context,
      backgroundColor: isLight ? AppColors.cFFFFFF : AppColors.bottomshetColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: 358.h,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 24.w),
                child: Column(
                  children: [
                    Text(
                      isStart ? 'Start Surah' : 'End Surah',
                      textAlign: TextAlign.center,
                      style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: isLight ? AppColors.c000000 : AppColors.cF9F6F0,
                      ),
                    ),
                    UIHelper.verticalSpace(32.h),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 80.h,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: isLight ? AppColors.cE8E8E8 : AppColors.c1E2F3F,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 200.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: ListWheelScrollView.useDelegate(
                                  controller: _surahScrollController,
                                  itemExtent: 40,
                                  diameterRatio: 1.2,
                                  physics: const FixedExtentScrollPhysics(parent: ClampingScrollPhysics()),
                                  onSelectedItemChanged: (index) {
                                    setModalState(() => selectedIndex = index);
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    builder: (context, index) {
                                      if (index < 0 || index >= surahNumber.length) return null;
                                      final isSelected = index == selectedIndex;
                                      return Center(
                                        child: Text(
                                          surahNumber[index],
                                          textAlign: TextAlign.center,
                                          style: isSelected
                                              ? TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                                            fontSize: 14.sp,
                                            color: isLight ? AppColors.c000000 : AppColors.cF9F6F0,
                                          )
                                              : TextFontStyle.textStyle16w500B8B8B8Raleway.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                            color: AppColors.cB8B8B8,
                                          ),
                                        ),
                                      );
                                    },
                                    childCount: surahNumber.length,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "${ayat[selectedIndex]}",
                                    textAlign: TextAlign.center,
                                    style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                                      fontSize: 14.sp,
                                      color: isLight ? AppColors.c000000 : AppColors.cF9F6F0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CustomPersonalizationButton(
                      contentPadding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 12.h),
                      text: 'Done',
                      onPressed: () {
                        setState(() {
                          if (isSelectingStart) {
                            startSurah = surahNumber[selectedIndex];
                            startAyah = ayat[selectedIndex];
                          } else {
                            endSurah = surahNumber[selectedIndex];
                            endAyah = ayat[selectedIndex];
                          }
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Column(
      children: [
        /// START RANGE
        Row(
          children: [
            SvgPicture.asset(AppIcons.startRange, height: 24.h),
            UIHelper.horizontalSpace(4.w),
            Text(
              'Start Range',
              style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                fontSize: 14.sp,
                color: isLight ? AppColors.c000000 : AppColors.cF9F6F0,
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  startSurah != null ? '$startSurah ${startAyah != null ? '1:$startAyah' : ''}' : 'Select...',
                  textAlign: TextAlign.right,
                  style: TextFontStyle.titleStyle12w400c757575Raleway.copyWith(
                    fontSize: 14.sp,
                    color: isLight ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
            UIHelper.horizontalSpace(4.w),
            GestureDetector(
              onTap: () => _openBottomSheet(isStart: true),
              child: SvgPicture.asset(AppIcons.arrwdropIcon, height: 24.h, color: isLight ? Colors.black : null),
            ),
          ],
        ),

        UIHelper.verticalSpace(16.h),
        Divider(color: isLight ? Colors.black54 : AppColors.c1C2A37, thickness: 1),
        UIHelper.verticalSpace(16.h),

        /// END RANGE
        Row(
          children: [
            SvgPicture.asset(AppIcons.startRange, height: 24.h),
            UIHelper.horizontalSpace(4.w),
            Text(
              'End Range',
              style: TextFontStyle.titleStyle12w400c757575Raleway.copyWith(
                fontSize: 14.sp,
                color: isLight ? Colors.black : Colors.white,
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  endSurah != null ? '$endSurah ${endAyah != null ? '1:$endAyah' : ''}' : 'Select...',
                  textAlign: TextAlign.right,
                  style: TextFontStyle.titleStyle12w400c757575Raleway.copyWith(
                    fontSize: 14.sp,
                    color: isLight ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
            UIHelper.horizontalSpace(4.w),

            GestureDetector(
              onTap: () => _openBottomSheet(isStart: false),
              child: SvgPicture.asset(AppIcons.arrwdropIcon, height: 24.h, color: isLight ? Colors.black : null),
            ),
          ],
        ),
      ],
    );
  }
}
