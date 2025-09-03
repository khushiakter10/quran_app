import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';

import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class LetterScreen extends StatefulWidget {
  const LetterScreen({super.key});

  @override
  State<LetterScreen> createState() => _LetterScreenState();
}

class _LetterScreenState extends State<LetterScreen> {
  final List<String> image = [
    'assets/images/booksquare.png',
    'assets/images/booksquare.png',
    'assets/images/booksquare.png',
    'assets/images/booksquare.png',
    'assets/images/booksquare.png',
    'assets/images/booksquare.png',
  ];

  final List<String> title = [
    'Lession 1- ب ت ث',
    'Lession 2- ج ح خ',
    'Lession 3- د ذ ر',
    'Lession 4- ز س ش',
    'Lession 5- ص ض ط',
    'Lession 6- ظ ع غ',
  ];

  List<double> progressList = List.generate(6, (index) => 0.02);
  List<bool> isIncreasingList = List.generate(6, (index) => true);

  void toggleProgress(int index) {
    setState(() {
      if (isIncreasingList[index]) {
        progressList[index] += 0.05;
        if (progressList[index] >= 1.0) {
          progressList[index] = 1.0;
          isIncreasingList[index] = false;
        }
      } else {
        progressList[index] -= 0.05;
        if (progressList[index] <= 0.0) {
          progressList[index] = 0.0;
          isIncreasingList[index] = true;
        }
      }
    });
  }

  final int trackedIndex = 0;

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
            image: AssetImage(AppImages.learntajweedbacroundImage),
            fit: BoxFit.cover,
          )
              : isLight
              ? DecorationImage(
            image: AssetImage(AppImages.lettarlightImage),
            fit: BoxFit.cover,
          )
              : DecorationImage(
            image: AssetImage(AppImages.letterdarkmoode),
            fit: BoxFit.cover,
          ),
          gradient: isStarfield || isLight
              ? null
              : UiDarkModeHelper.getCurrentGradient(context),
        ),



        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbarWidget(
                  showIcon: false,
                  text: '',
                  onTap: () {
                    NavigationService.goBack();
                  },
                ),
                UIHelper.verticalSpace(13.h),

                Text(
                    'Letter',
                    style:  TextFontStyle.textStyle20w600cFEFEFERaleway.copyWith(
                      fontSize: 32.sp,fontWeight: FontWeight.w700,
                      color: isStarfield
                          ? const Color(0xFFFEFEFE)
                          : (UiDarkModeHelper.isDarkMode(context)
                          ? AppColors.cFEFEFE
                          :  AppColors.c484848),

                    )
                ),

                UIHelper.verticalSpace(8.h),

                Text(
                    '9 Chapters',
                    style:  TextFontStyle.textStyle20w600cFEFEFERaleway.copyWith(
                      fontSize: 16.sp,fontWeight: FontWeight.w400,
                      color: isStarfield
                          ? const Color(0xFFFEFEFE)
                          : (UiDarkModeHelper.isDarkMode(context)
                          ? AppColors.cFEFEFE
                          :  AppColors.c484848),

                    )
                ),
                UIHelper.verticalSpace(8.h),

                /// =============== Progress =============== ///
                SizedBox(
                  width: 225.h,
                  child: GestureDetector(
                    onTap: () => toggleProgress(trackedIndex),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.r),
                      child: LinearProgressIndicator(
                          value: progressList[trackedIndex],
                          minHeight: 6.h,
                          valueColor: AlwaysStoppedAnimation<Color>(

                              isLight
                                  ? AppColors.cA1D1FF
                                  : AppColors.cA1D1FF

                          ),
                          backgroundColor:   isLight
                              ?  Color(0xFF5185B5)
                              : Color(0xFF5185B5)
                      ),
                    ),
                  ),
                ),
                /// ============ Done ============ ///
                UIHelper.verticalSpace(24.h),

                /// ============ ListView ============ ///
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      NavigationService.navigateTo(Routes.learnScreen);
                    },
                    child: ListView.builder(
                      itemCount: image.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: isLight ? AppColors.cF9F6F0 : AppColors.c3D668C.withOpacity(0.55),
                              borderRadius: BorderRadius.circular(8.r),

                              border: Border.all(
                                color: isLight ? Colors.transparent : AppColors.c72BBFF,
                                width: 1,
                              ),

                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 54.w,
                                    height: 54.h,
                                    child: Image.asset(
                                      image[index],
                                      fit: BoxFit.contain,
                                      errorBuilder: (_, __, ___) => const Icon(Icons.error),
                                    ),
                                  ),
                                  UIHelper.horizontalSpace(16.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Text(
                                          title[index],

                                          style: TextFontStyle
                                              .textStyle12w500FEFEFERaleway
                                              .copyWith(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,

                                            color: isStarfield
                                                ? const Color(0xFFF9F6F0)
                                                : (UiDarkModeHelper.isDarkMode(context)
                                                ? AppColors.cFFFFFF
                                                :  AppColors.c484848),

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  });
}}
