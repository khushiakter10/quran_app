import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/common_widgets/custom_text_formfield.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_scroll_style/presentation/read_surah_scroll_style_screen.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_setting/widget/custom_translation.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_verse_by_verse/presentation/read_surah-verse_by_verse_screen.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_word_for_word/presentation/read_surah_word_for_word_screen.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';
import '../../../read_quran_juz/juz_english_translation/presentation/juz_english_translation_screen.dart';



class ReadSurahSettingScreen extends StatefulWidget {
  const ReadSurahSettingScreen({super.key});

  @override
  State<ReadSurahSettingScreen> createState() => _ReadSurahSettingScreenState();
}

class _ReadSurahSettingScreenState extends State<ReadSurahSettingScreen> {
  bool isTranslationOn = false;
  bool isReadOnly = false;

  final List<String> surahList = ['Al-Fatihah', 'Al-Baqarah', 'Ali Imraan'];
  final List<String> reciterList = [
    'Abdul-Baasit',
    'Mishary',
    'Saad Al-Ghamdi'
  ];

  final TextEditingController readingTypeController = TextEditingController();
  final TextEditingController surahController = TextEditingController();
  final TextEditingController abdulBaasitController = TextEditingController();
  final TextEditingController fonSizeController = TextEditingController();

  double _sliderValue = 0.3;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isOn = false;
  bool isVibrationOn = false;

  @override
  void dispose() {
    surahController.dispose();
    abdulBaasitController.dispose();
    readingTypeController.dispose();
    fonSizeController.dispose();
    super.dispose();
  }

  void selectFirst() {
    setState(() {
      isSelected1 = true;
      isSelected2 = false;
    });
  }

  void selectSecond() {
    setState(() {
      isSelected1 = false;
      isSelected2 = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    ///====================Helper & Controller Mode Section===========
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: isStarfield
              ? DecorationImage(
                  image: AssetImage(AppImages.personalizationbacroundImage),
                  fit: BoxFit.cover,
                )
              : null,
          gradient:
              isStarfield ? null : UiDarkModeHelper.getCurrentGradient(context),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///==============Appbar title section===============

                CustomAppbarWidget(
                  textStyle:
                      TextFontStyle.textStyle18w500cF9F6F0Raleway.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isStarfield
                        ? AppColors.cFFFFFF
                        : (isLight ? AppColors.c000000 : AppColors.cFFFFFF),
                  ),
                  showIcon: false,
                  text: 'Display Settings',
                  onTap: () {
                    NavigationService.goBack;
                  },
                ),

                UIHelper.verticalSpace(18.h),

                ///==============Divider Section============
                Divider(
                  color: isStarfield
                      ? AppColors.c2C333B
                      : (isLight ? Colors.grey.shade400 : AppColors.c2C333B),
                  thickness: 1,
                ),
                UIHelper.verticalSpace(18.h),

                ///=============Font Size Section===========
                Text(
                  'Font Size',
                  style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                    color: isStarfield
                        ? AppColors.cFFFFFF
                        : (isLight ? AppColors.c000000 : AppColors.cFFFFFF),
                  ),
                ),
                UIHelper.verticalSpace(8.h),

                Container(
                  height: 48.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: isStarfield
                        ? Colors.black.withOpacity(0.3)
                        : (isLight
                            ? Colors.white
                            : Colors.black.withOpacity(0.3)),
                    border: Border.all(
                      color: isLight ? AppColors.cE8E8E8 : Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 5,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 8.r),
                      overlayShape: SliderComponentShape.noOverlay,
                      activeTrackColor: AppColors.c72BBFF,
                      inactiveTrackColor: AppColors.cE8E8E8,
                      thumbColor: AppColors.c72BBFF,
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
                UIHelper.verticalSpace(16.h),

//======================================= Surah ==============================///
                Text(
                  'Surah',
                  style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                    color: isStarfield
                        ? AppColors.cFFFFFF
                        : (isLight ? Colors.black : Colors.white),
                  ),
                ),
                UIHelper.verticalSpace(8.h),


                CustomTextFormfield(
                  isRead: true,
                  controller: surahController,
                  borderRadius: 8.r,
                  fillColor: isStarfield
                      ? Colors.black.withOpacity(0.3)
                      : (isLight ? Colors.white : Colors.black.withOpacity(0.3)),
                  borderColor: isLight ? AppColors.cE8E8E8 : Colors.transparent,
                  hintText: 'Al-Fatihah',
                  hintStyle: TextFontStyle.textStyle16w400c969696Raleway.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: isLight ? AppColors.c000000 : const Color(0xFF969696),
                  ),
                  textStyle: TextStyle(
                    color: surahController.text.trim().isNotEmpty
                        ? (isLight ? AppColors.c000000 : AppColors.c969696)
                        : (isLight ? Colors.black : const Color(0xFF969696)),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),

                  suffixIcon:

                  PopupMenuButton<String>(
                    color: AppColors.cFFFFFF,
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset(AppIcons.dropdwonIcon, height: 16.h),
                    onSelected: (String value) {
                      setState(() {
                        surahController.text = value;
                      });
                    },
                    itemBuilder: (BuildContext context) {
                      return surahList.map((String surah) {
                        return PopupMenuItem<String>(
                          value: surah,
                          child: Text(
                            surah,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: isLight ? AppColors.c969696 : AppColors.c969696,
                            ),
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),


//================= Done =================================//









                //------------------------------- Reciter --------------------------------//
                UIHelper.verticalSpace(16.h),
                Text(
                  'Reciter',
                  style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                    color: isStarfield
                        ? const Color(0xFFFEFEFE)
                        : (isLight ? Colors.black : Colors.white),
                  ),
                ),
                UIHelper.verticalSpace(8.h),
                CustomTextFormfield(
                  controller: abdulBaasitController,
                  isRead: true,
                  borderRadius: 8.r,
                  fillColor: isStarfield
                      ? Colors.black.withOpacity(0.3)
                      : (isLight ? Colors.white : Colors.black.withOpacity(0.3)),
                  borderColor: isStarfield
                      ? Colors.transparent
                      : (isLight ? AppColors.cE8E8E8 : Colors.transparent),
                  hintText: 'Abdul-Baasit',
                  hintStyle: TextFontStyle.textStyle16w400c969696Raleway.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: isLight ? AppColors.c000000 : const Color(0xFF969696),
                  ),
                  textStyle: TextStyle(
                    color: abdulBaasitController.text.trim().isNotEmpty
                        ? (isLight ? AppColors.c000000 : AppColors.c969696)
                        : (isLight ? Colors.black : const Color(0xFF969696)),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),

                  // Dropdown inside suffixIcon, PopupMenuButton দিয়ে
                  suffixIcon: PopupMenuButton<String>(
                    color: AppColors.cFFFFFF,
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset(AppIcons.dropdwonIcon, height: 16.h),
                    onSelected: (value) {
                      setState(() {
                        abdulBaasitController.text = value;
                      });
                    },
                    itemBuilder: (BuildContext context) {
                      return reciterList.map((reciter) {
                        return PopupMenuItem<String>(
                          value: reciter,
                          child: Text(
                            reciter,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: isLight ? AppColors.c969696 : AppColors.c969696,
                            ),
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),

// _______________________________ Done ----------------------------------//

                UIHelper.verticalSpace(16.h),


                Text(
                  'Reading Type',
                  style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                    color: isStarfield
                        ? const Color(0xFFFEFEFE)
                        : (isLight ? Colors.black : Colors.white),
                  ),
                ),
                UIHelper.verticalSpace(8.h),

// ------------------------------------ Reading Type -------------------------//
                CustomTextFormfield(
                  controller: readingTypeController,
                  isRead: true,
                  borderRadius: 8.r,
                  fillColor: isStarfield
                      ? Colors.black.withOpacity(0.3)
                      : (isLight ? AppColors.cFFFFFF : Colors.black.withOpacity(0.3)),
                  borderColor: isStarfield
                      ? Colors.transparent
                      : (isLight ? AppColors.cE8E8E8 : Colors.transparent),
                  hintText: 'Select Reading Type',
                  hintStyle: TextFontStyle.textStyle16w400c969696Raleway.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: isLight ? AppColors.c000000 : AppColors.c969696
                  ),
                  textStyle: TextStyle(
                    color: readingTypeController.text.trim().isNotEmpty
                        ? (isLight ? AppColors.c000000 : AppColors.c969696)
                        : (isLight ? Colors.black : const Color(0xFF969696)),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),

                  // 👉 Dropdown in suffixIcon
                  suffixIcon: Builder(
                    builder: (context) => PopupMenuButton<String>(
                      color: AppColors.cFFFFFF,
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(
                        maxWidth: 200.w,
                      ),
                      icon: SvgPicture.asset(
                        AppIcons.dropdwonIcon,
                        height: 16.h,
                      ),
                      onSelected: (value) {

                        if (['Word by Word', 'Verse by Verse', 'Scroll Style','jus style'].contains(value)) {
                          setState(() {
                            readingTypeController.text = value;
                          });
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          'Word by Word',
                          'Verse by Verse',
                          'Scroll Style',
                          "jus style"
                        ].map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(
                              choice,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: isLight ? AppColors.c969696 : AppColors.c969696,
                              ),
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                ),


//----------------------------- Done -----------------------------//

                UIHelper.verticalSpace(16.h),
                Text(
                  'Calligraphy Background',
                  style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                    color: isStarfield
                        ? AppColors.cFFFFFF
                        : (isLight ? Colors.black : Colors.white),
                  ),
                ),
                UIHelper.verticalSpace(8.h),
                Container(
                  height: 48.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                      color: isStarfield
                          ? Colors.black.withOpacity(0.3)
                          : (isLight
                              ? Colors.white
                              : Colors.black.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: isLight ? AppColors.cE8E8E8 : Colors.transparent,
                      )),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: selectFirst,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: isSelected1
                              ? ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.5, color: Color(0xFF72BBFF)),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                )
                              : null,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: ShapeDecoration(
                              color: isSelected1
                                  ? const Color(0xFFE9DEC8)
                                  : (isLight
                                      ? Colors.grey.shade300
                                      : Colors.white),
                              shape: const OvalBorder(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      GestureDetector(
                        onTap: selectSecond,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: isSelected2
                              ? ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.5, color: Color(0xFF72BBFF)),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                )
                              : null,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: ShapeDecoration(
                              color: isSelected2
                                  ? const Color(0xFFE9DEC8)
                                  : (isLight
                                      ? Colors.grey.shade300
                                      : Colors.white),
                              shape: const OvalBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(16.h),

   //------------------ translation Widget ----------------------------------//

                CustomTranslation(
                  title: 'Translation',
                  subtitle: isTranslationOn ? 'ON' : 'OFF',
                  value: isTranslationOn,
                  isLight: isLight,
                  isStarfield: isStarfield,
                  onChanged: (val) {
                    setState(() {
                      isTranslationOn = val;
                    });
                  },
                ),

                CustomTranslation(
                  title: 'Vibration',
                  subtitle: isVibrationOn ? 'ON' : 'OFF',
                  value: isVibrationOn,
                  isLight: isLight,
                  isStarfield: isStarfield,
                  onChanged: (val) {
                    setState(() {
                      isVibrationOn = val;
                    });
                  },
                ),

//--------------------------- Done ----------------------------------//
                ///============================ Button ============================//
                //








                CustomPersonalizationButton(
                  text: 'Done',
                  onPressed: () {
                    final selectedType = readingTypeController.text.trim();

                    if (selectedType.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Please select a reading type before proceeding'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    } else {
                      switch (selectedType) {
                        case 'Verse by Verse':
                          Get.to(() => ReadSurahVerseByVerseScreen());
                          break;
                        case 'Word by Word':
                         Get.to(() => ReadSurahWordForWordScreen());
                          break;
                        case 'Scroll Style':
                          Get.to(() => ReadSurahScrollStyleScreen());
                          break;
                        case 'jus style':
                          Get.to(() => JuzEnglishTranslationScreen());
                          break;
                        default:
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Invalid selection'),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                      }
                    }
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