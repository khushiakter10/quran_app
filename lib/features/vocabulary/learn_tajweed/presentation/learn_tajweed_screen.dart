import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


import '../widget/custom_learn_tajweed.dart';

class LearnTajweedScreen extends StatefulWidget {
  const LearnTajweedScreen({super.key});

  @override
  State<LearnTajweedScreen> createState() => _LearnTajweedScreenState();
}

class _LearnTajweedScreenState extends State<LearnTajweedScreen> {


  final List<String> number = [
    '1', '2', '3', '4', '5', '6', '7', '8'
  ];

  final List<String> title = [
    'مفردات',
    'مرکبات',
    'مقطعات',
    'حرکات',
    'تنوین',
    'حرکات و تنوین',
    'کھڑی زیر، کھڑی زبر، الٹا پیش',
    'مادہ و لین',
  ];

  final List<String> subtitle = [
    'Lesson 1',
    'Lesson 2',
    'Lesson 3',
    'Lesson 4',
    'Lesson 5',
    'Lesson 6',
    'Lesson 7',
    'Lesson 8',
  ];



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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fixed Appbar Section (non-scrollable)
                CustomAppbarWidget(
                  showIcon: false,
                  text: 'Learn Tajweed',
                  onTap: () {
                    NavigationService.goBack();
                  },
                ),
                UIHelper.verticalSpace(24.h),


                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      NavigationService.navigateTo(Routes.learnTajweedLessonScreen);
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: isLight ? AppColors.cF9F6F0 : AppColors.c000000.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                        child: ListView.builder(
                          itemCount: number.length,
                          physics: const AlwaysScrollableScrollPhysics(),

                          itemBuilder: (BuildContext context, int index) {
                            return Custom(title: title[index], data: number[index], subtitle: subtitle[index],);
                          },
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
    );
  }
}


