import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/common_widgets/custom_text_formfield.dart';
import 'package:quran_app/features/learning/learning_three/widget/custom_alphabet.dart';
import 'package:quran_app/features/learning/learning_three/widget/custom_continue_english.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class LearningThreeScreen extends StatefulWidget {
  const LearningThreeScreen({super.key});

  @override
  State<LearningThreeScreen> createState() => _LearningThreeScreenState();
}

class _LearningThreeScreenState extends State<LearningThreeScreen>with TickerProviderStateMixin {


  final TextEditingController learnsearchController = TextEditingController();


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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///=================Search Bar Section========================
              CustomTextFormfield(
                fillColor:  isLight ? AppColors.cF9F6F0 :   Color(0x6605131F),
                contentPadding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
                borderRadius: 8.r,
                controller: learnsearchController,
                hintText: 'Search for a word',
                hintStyle: TextFontStyle.textStyle14w400cB1AFAARaleway.copyWith(
                    color: isStarfield
                        ? AppColors.cB1AFAA
                        : (UiDarkModeHelper.isDarkMode(context)
                        ? AppColors.cB1AFAA
                        :  AppColors.c666666)
                ),
                textStyle: TextStyle(
                  color: isStarfield
                      ? const Color(0xFFFEFEFE)
                      : (isLight ? Colors.black : AppColors.cF9F6F0),
                ),
                prefixIcon: GestureDetector(
                  onTap: () {
                    if (learnsearchController.text.trim().isNotEmpty) {
                      debugPrint(
                          "Search icon tapped with value: ${learnsearchController.text}");

                    } else {
                      debugPrint(
                          "Search input is empty. Navigation blocked.");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a search term first'),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 8.w),
                    child: SvgPicture.asset(
                      AppIcons.searchIcon,
                      height: 20.h,
                      color: isStarfield
                          ? AppColors.cB1AFAA
                          : (isLight ? AppColors.c969696 : AppColors.cB1AFAA),
                    ),
                  ),
                ),
              ),


              UIHelper.verticalSpace(16.h),
           //===================== Done =====================//

                //======================== Continue English Recitation=============================//
              CustomContinueEnglish(
                onTap: (){NavigationService.navigateTo(Routes.quranOpeningPlayScreen);},
                title: 'Continue English Recitation',
                icon: GestureDetector(
                  onTap: (){NavigationService.navigateTo(Routes.quranOpeningPlayScreen);},
                  child: SvgPicture.asset(AppIcons.arrwIcon,
                      color: AppColors.c72BBFF, height: 10.sp),
                ),
                subtitle: 'Al-i-imraan', text: 'The Family of Imran',
              ),
              UIHelper.verticalSpace(16.h),

                //==================== Done =========================//




              CustomAlphabet(text: 'Current Vocabulary Learning'),

              UIHelper.verticalSpace(16.h),


              CustomContinueEnglish(
                onTap: (){NavigationService.navigateTo(Routes.learnTajweedLessonScreen);},
                textStyle: TextFontStyle.titleStyle16w400cF9F6F0Persian.copyWith(fontSize: 24.sp),
                title: 'Continue Tajweed Learning',
                icon: GestureDetector(
                  onTap: (){NavigationService.navigateTo(Routes.learnTajweedLessonScreen);},
                  child: SvgPicture.asset(AppIcons.arrwIcon,
                      color: AppColors.c72BBFF, height: 10.sp),
                ),
                subtitle: 'مفردات',
                text: 'Lesson 1',
              ),





              UIHelper.verticalSpace(16.h),





          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              color: isLight ? AppColors.cF9F6F0 :  Color(0x66061420),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: isLight ?  Colors.transparent : AppColors.c3F678C,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Text('Discover Mind Maps',
                          style: TextFontStyle.titleStyle12w400cB1AFAARaleway.copyWith(
                              color: isStarfield
                                  ? AppColors.cB1AFAA
                                  : (UiDarkModeHelper.isDarkMode(context)
                                  ? AppColors.cB1AFAA
                                  :  AppColors.c666666)
                          )),
                      Spacer(),

                      GestureDetector(
                        onTap: (){NavigationService.navigateTo(Routes.mindMapScreen);},
                        child: Text(
                          'See All',
                          style: TextFontStyle.textStyle12w400c72BBFFRaleway
                              .copyWith(fontSize: 10.sp),
                        ),
                      ),
                      UIHelper.horizontalSpace(2.w),
                       GestureDetector(
                           onTap: (){NavigationService.navigateTo(Routes.mindMapScreen);},
                           child: SvgPicture.asset(AppIcons.arrwIcon,color: AppColors.c72BBFF,height: 10.sp))
                    ],
                  ),

                  UIHelper.verticalSpace(8.h),

                   SvgPicture.asset(AppIcons.MindMaps,height: 54.h)


                ],
              ),
            ),
          ),
            ],
          ),
        ));
  }
}





























