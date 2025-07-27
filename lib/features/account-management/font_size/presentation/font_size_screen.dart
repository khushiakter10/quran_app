
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class FontSizeScreen extends StatefulWidget {
  FontSizeScreen({super.key});

  @override
  State<FontSizeScreen> createState() => _FontSizeScreenState();
}

class _FontSizeScreenState extends State<FontSizeScreen> {
  final List<String> title = [
    'Quranic Script',
    'Translation',
    'Transliteration',
  ];

  final List<String> subtitle = [
    'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
    'In the Name of Allah—the Most Compassionate, Most Merciful.',
    'Bismi Allahi alrrahmani alrraheemi',
  ];

  List<double> _sliderValues = [0.5, 0.5, 0.5];


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await UiDarkModeHelper.initTheme(context);
      setState(() {});
    });
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
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
                child: Column(
                  children: [

                    CustomAppbarWidget(
                      showIcon: false,
                      text: 'Font Size',
                      onTap: () {
                        NavigationService.goBack();
                      },
                    ),


                    UIHelper.verticalSpace(41.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: title.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 16.h),
                            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                            decoration: ShapeDecoration(
                              color: isLight ? Colors.white : const Color(0x66061420),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: isLight ? Colors.grey : const Color(0xFF304F6B),
                                ),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title[index],
                                  style: TextStyle(
                                    color: isLight ? Colors.black : const Color(0xFFF9F6F0),
                                    fontSize: 18.sp,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w600,
                                    height: 1.64,
                                  ),
                                ),
                                UIHelper.verticalSpace(12.h),
                                Text(
                                  subtitle[index],
                                  style: TextStyle(
                                    color: isLight ? Colors.black : const Color(0xFFB8B8B8),
                                    fontSize: 16 + (_sliderValues[index] * 14),
                                    fontFamily: index == 0 ? 'Amiri Quran' : 'Raleway',
                                    fontWeight: FontWeight.w500,
                                    height: 1.64,
                                  ),
                                ),
                                UIHelper.verticalSpace(12.h),
                                Row(
                                  children: [
                                    Text(
                                      'T',
                                      style: TextStyle(
                                        color: isLight ? Colors.black : const Color(0xFFB8B8B8),
                                        fontSize: 10,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w500,
                                        height: 1.64,
                                      ),
                                    ),
                                    UIHelper.horizontalSpace(8.w),
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
                                          value: _sliderValues[index],
                                          min: 0.0,
                                          max: 1.0,
                                          onChanged: (val) {
                                            setState(() {
                                              _sliderValues[index] = val;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    UIHelper.horizontalSpace(8.w),
                                    Text(
                                      'T',
                                      style: TextStyle(
                                        color: isLight ? Colors.black : const Color(0xFFB8B8B8),
                                        fontSize: 18,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w500,
                                        height: 1.64,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    UIHelper.verticalSpace(24),

                    CustomPersonalizationButton(
                      text: 'Save',
                      onPressed: () {
                        NavigationService.navigateTo(Routes.settingsScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

  }

  void goToStep(int index) {
    // Navigation logic
  }
}
