import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/quran_academy/quran_academy_screen/widget/quran_academy_card.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';




class QuranAcademyScreen extends StatefulWidget {
  const QuranAcademyScreen({super.key});

  @override
  State<QuranAcademyScreen> createState() => _QuranAcademyScreenState();
}

class _QuranAcademyScreenState extends State<QuranAcademyScreen> {
  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage(AppImages.backroundimage),
                  fit: BoxFit.cover,
                )
              : null,
          gradient:
              isStarfield ? null : UiDarkModeHelper.getCurrentGradient(context),
        ),
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              ///==================Appbar Section=================
              CustomAppbarWidget(
                showIcon: false,
                text: 'Quran Academy',
                onTap: () {
                  NavigationService.goBack;
                },
              ),

              UIHelper.verticalSpace(24.h),
              ///===================Card Section==============
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      GestureDetector(

                        onTap: (){
                          NavigationService.navigateTo(Routes.vocabularyScreen);
                        },
                        child: QuranAcademyCard(
                          title: 'Vocabulary',
                          iconPath: AppIcons.book5,
                          isStarfield: isStarfield,
                          isLight: isLight,
                        ),
                      ),


                      GestureDetector(
                        onTap: (){
                          NavigationService.navigateTo(Routes.learnTajweedScreen);
                        },
                        child: QuranAcademyCard(
                          title: 'Learn Tajweed',
                          iconPath: AppIcons.LearnTajweed,
                          isStarfield: isStarfield,
                          isLight: isLight,
                        ),
                      ),



                    ],
                  ),
                  SizedBox(height: 12.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(Routes.quranInEnglishListScreen);
                        },
                        child: QuranAcademyCard(
                          title: 'Quran in English',
                          iconPath: AppIcons.QuranEnglish,
                          isStarfield: isStarfield,
                          isLight: isLight,
                        ),
                      ),


                      GestureDetector(
                        onTap: (){
                          NavigationService.navigateTo(Routes.mindMapScreen);
                        },
                        child: QuranAcademyCard(
                          title: 'Mind Maps  ',
                          iconPath: AppIcons.MindMaps,
                          isStarfield: isStarfield,
                          isLight: isLight,
                        ),
                      ),
                    ],
                  ),
                ],
              )

            ],
          ),
        )),
      ),
    );
  }


}
