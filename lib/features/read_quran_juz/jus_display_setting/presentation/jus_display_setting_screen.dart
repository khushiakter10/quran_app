
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/features/read_quran_juz/jus_display_setting/widget/custom_surah_and_ayat.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class JusDisplaySettingScreen extends StatefulWidget {
  final bool initialIsOn;
  const JusDisplaySettingScreen({super.key, required this.initialIsOn});

  @override
  State<JusDisplaySettingScreen> createState() => _JusDisplaySettingScreenState();
}

class _JusDisplaySettingScreenState extends State<JusDisplaySettingScreen> {


  final List<String> surahList = [
    'Al-Fatihah',
    'Al-Baqarah',
    'Aali-Imran',
    'An-Nisa',
    'Al-Ma’idah',
  ];

  final List<String> ayahList = [
    '01',
    '02',
    '03',
    '04',
    '05',
  ];

  String selectedSurah = 'Al-Fatihah';
  String selectedAyah = '01';

  final TextEditingController fonSizeController = TextEditingController();


  double _sliderValue = 0.3;
  late bool isOn;
  bool isSelected1 = false;
  bool isSelected2 = false;


  bool isVibrationOn = false;

  @override
  void dispose() {
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
  void initState() {
    super.initState();
    isOn = widget.initialIsOn;
  }
  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Scaffold(
      backgroundColor: isLight ? AppColors.cFFFFFF : AppColors.bottomshetColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(child: Text('Display Settings', style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                color: isStarfield
                    ?  Color(0xFFFEFEFE)
                    : (isLight ? AppColors.c484848 : AppColors.cFFFFFF),
              ))),

              UIHelper.verticalSpace(18.h),

  //----------------------- Divider --------------------------//
              Divider(
                  color:
                  isLight ? AppColors.cB8B8B8 : AppColors.c969696

              ),
   //------------------------ Done -----------------------//
              UIHelper.verticalSpace(18.h),


              Text('Font Size', style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                color: isStarfield
                    ?  Color(0xFFFEFEFE)
                    : (isLight ? AppColors.c484848 : AppColors.cFFFFFF),
              )),
              UIHelper.verticalSpace(8.h),
//--------------------------- Slider -----------------------------//
              Container(
                width: double.infinity,
                height: 47.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: isLight ? AppColors.cF9F6F0 : AppColors.c1E2F3F,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 5.h,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.r),
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
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 40.w,
                      alignment: Alignment.center,
                      child: Text(
                        '${(_sliderValue * 100).round()}',
                        style: TextFontStyle.titleStyle12w500cBABABARaleway.copyWith(
                          color: isLight ? AppColors.cBABABA : AppColors.cBABABA,
                        )
                      ),
                    ),
                  ],
                ),
              ),

  //------------------------- Done -------------------------//

              UIHelper.verticalSpace(16.h),

              CustomSurahAndAyat(
                surahList: surahList,
                ayahList: ayahList,
                selectedSurah: selectedSurah,
                selectedAyah: selectedAyah,
                onSurahChanged: (val) {
                  setState(() {
                    selectedSurah = val;
                  });
                },
                onAyahChanged: (val) {
                  setState(() {
                    selectedAyah = val;
                  });
                },
              ),


              UIHelper.verticalSpace(16.h),

//----------------------- Calligraphy -------------------------//
              Text('Calligraphy Background', style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                color: isStarfield
                    ?  Color(0xFFFEFEFE)
                    : (isLight ? AppColors.c484848 : AppColors.cFFFFFF),
              )),
              UIHelper.verticalSpace(8.h),



              Container(
                  width: double.infinity,
                  height: 47.h,
                  decoration: BoxDecoration(
                    color: isLight ? AppColors.cF9F6F0 : AppColors.c1E2F3F,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child:   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
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
                                  width: 0.5,

                                 color: Color(0xFF72BBFF),
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            )
                                : null,
                            child: Container(
                              width: 16,
                              height: 16,

                              decoration: ShapeDecoration(
                                color: isSelected1
                                    ? (isLight ? AppColors.cE9DEC8: AppColors.cE9DEC8 )
                                    :  (isLight ? AppColors.c000000 : AppColors.cFFFFFF),
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
                                  width: 0.5,
                                  color: Color(0xFF72BBFF),
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            )
                                : null,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: ShapeDecoration(
                                color: isSelected2 ? const Color(0xFFE9DEC8) : Colors.white,
                                shape: const OvalBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )

              ),
              UIHelper.verticalSpace(16.h),
 //---------------------- Done -----------------------------//



  //--------------------   Translation ----------------------//

              Text('Translation', style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                color: isStarfield
                    ?  Color(0xFFFEFEFE)
                    : (isLight ? AppColors.c484848 : AppColors.cFFFFFF),
              )),
              UIHelper.verticalSpace(8.h),
              Container(
                width: double.infinity,
                height: 47.h,
                decoration: BoxDecoration(
                  color: isLight ? AppColors.cF9F6F0 : AppColors.c1E2F3F,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'OFF',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isOn ? AppColors.c969696 : Colors.red,
                        ),
                      ),
                      UIHelper.horizontalSpace(12),

                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          value: isOn,
                          activeColor: Colors.white,
                          activeTrackColor: AppColors.c72BBFF,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey.shade400,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashRadius: 0,
                          onChanged: (value) {
                            setState(() {
                              isOn = value;
                            });
                          },
                        ),
                      ),
                      UIHelper.horizontalSpace(12),
                      Text(
                        'ON',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isOn ? AppColors.cFFFFFF : AppColors.c969696,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
//--------------------   Done  ----------------------//


              UIHelper.verticalSpace(16.h),

              Text('Vibration', style: TextFontStyle.textStyle16w600cFFFFFFRaleway.copyWith(
                color: isStarfield
                    ?  Color(0xFFFEFEFE)
                    : (isLight ? AppColors.c484848 : AppColors.cFFFFFF),
              )),
              UIHelper.verticalSpace(8.h),
              Container(
                width: double.infinity,
                height: 47.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: isLight ? AppColors.cF9F6F0 : AppColors.c1E2F3F,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'OFF',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isVibrationOn ? AppColors.c969696 : Colors.red,
                        ),
                      ),
                      UIHelper.horizontalSpace(12),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          value: isVibrationOn,
                          activeColor: Colors.white,
                          activeTrackColor: AppColors.c72BBFF,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey.shade400,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashRadius: 0,
                          onChanged: (value) {
                            setState(() {
                              isVibrationOn = value;
                            });
                          },
                        ),
                      ),
                      UIHelper.horizontalSpace(12),
                      Text(
                        'ON',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isVibrationOn ? AppColors.cFFFFFF : AppColors.c969696,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              UIHelper.verticalSpace(40.h),
              CustomPersonalizationButton(
                text: 'Done',
                onPressed: () {
                  Navigator.pop(context, isOn);
                },
              ),


            ],
          ),
        ),
      ),


    );
  }
}