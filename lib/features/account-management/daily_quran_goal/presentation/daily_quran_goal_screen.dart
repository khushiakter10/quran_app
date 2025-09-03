import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class DailyQuranGoalScreen extends StatefulWidget {
  const DailyQuranGoalScreen({super.key});

  @override
  State<DailyQuranGoalScreen> createState() => _DailyQuranGoalScreenState();
}

class _DailyQuranGoalScreenState extends State<DailyQuranGoalScreen> {
  final List<String> title = [
    '1',
    '5',
    '10',
    '15',
    '30',
    '40',
  ];

  final List<String> subtitle = [
    'Verse per day',
    'Verse per day',
    'Verse per day',
    'Verse per day',
    'Verse per day',
    'Verse per day',
  ];

  int selectedIndex = -1;
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
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbarWidget(
                  showIcon: false,
                  text: 'Daily Quran Goal',
                  onTap: () {
                    NavigationService.goBack();
                  },
                ),
                UIHelper.verticalSpace(30.h),



              GridView.builder(
                shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
              itemCount: title.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
               childAspectRatio: 1.4,
                ),
              itemBuilder: (BuildContext context, int index) {
              final isSelected = selectedIndex == index;

              return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: isLight ? AppColors.cF9F6F0 :  Color(0xB2061420),
                  border: Border.all(
                    color: isSelected ? AppColors.c72BBFF : Colors.transparent,
                    width: 1.w,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title[index],
                        textAlign: TextAlign.center,
                        style: TextFontStyle.titleStyle24w600cF9F6F0CormorantGaramond.copyWith(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w700,

                          color: isStarfield
                              ? AppColors.cF9F6F0
                              : (UiDarkModeHelper.isDarkMode(context)
                              ? AppColors.cF9F6F0
                              : AppColors.c484848),
                        ),
                      ),
                      Text(
                        subtitle[index],
                        textAlign: TextAlign.center,
                        style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,

                          color: isStarfield
                              ? AppColors.cF9F6F0
                              : (UiDarkModeHelper.isDarkMode(context)
                              ? AppColors.cF9F6F0
                              : AppColors.c484848),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
                UIHelper.verticalSpace(250.h),
                CustomPersonalizationButton(
                  text: 'Save',
                  onPressed: () {
                   NavigationService.navigateTo(Routes.accountManagementScreen);
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
