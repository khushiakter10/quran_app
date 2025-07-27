import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/features/learning/learning_one/widget/custom_mind_maps.dart';
import 'package:quran_app/features/learning/learning_one/widget/custom_read_quran.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: Column(
          children: [
            UIHelper.verticalSpace(16.h),


            GestureDetector(
                onTap: (){NavigationService.navigateTo(Routes.  readQuranSurahScreen);},
                child: CustomReadQuran(icon: SvgPicture.asset(AppIcons.koranicon, height: 54.h), text: 'Read the Quran')),



            UIHelper.verticalSpace(8.h),

            GestureDetector(
              onTap: (){NavigationService.navigateTo(Routes.learnTajweedScreen);},
                child: CustomReadQuran(icon: SvgPicture.asset(AppIcons.LearnTajweed, height: 54.h), text: 'Learn Tajweed')),

            UIHelper.verticalSpace(8.h),





            Row(
              children: [

                CustomMindMaps(
                  OnTap: (){NavigationService.navigateTo(Routes.quranInEnglishListScreen);},
                    title: 'Quran in English', icon: SvgPicture.asset(AppIcons.QuranEnglish, height: 54.h,

                )),




                UIHelper.horizontalSpace(8.w),

                CustomMindMaps(
                    OnTap: (){NavigationService.navigateTo(Routes.mindMapScreen);},
                    title: 'Mind Maps', icon: SvgPicture.asset(AppIcons.MindMaps, height: 54.h)),
              ],
            ),



            UIHelper.verticalSpace(8.h),
            GestureDetector(
                onTap: (){NavigationService.navigateTo(Routes.vocabularyScreen);},
                child: CustomReadQuran(icon: SvgPicture.asset(AppIcons.book5, height: 54.h), text: 'Vocabulary')),
            UIHelper.verticalSpace(8.h),


          ],
        ),
      )



    );
  }
}


















