import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {

  final List<String> image = [
    'assets/images/alpha.png',
    'assets/images/salah.png',
    'assets/images/dua.png',
    'assets/images/sortSura.png',
    'assets/images/namazImage.png',
  ];

  final List<String> title = [
    'Alphabet',
    'Salah',
    'Dua',
    'Short Surah',
    'The 3 Quls',
  ];

  List<double> progressList = List.generate(5, (index) => 0.02);

  void increaseProgress(int index) {
    setState(() {
      progressList[index] += 0.05;
      if (progressList[index] > 1.0) progressList[index] = 1.0;
    });
  }

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

                CustomAppbarWidget(
                  showIcon: false,
                  text: 'Vocabulary',
                  onTap: () {
                    NavigationService.goBack();
                  },
                ),
                UIHelper.verticalSpace(24.h),


                Expanded(
                  child: GestureDetector(

                    onTap: (){
                      NavigationService.navigateTo(Routes.alphabetScreen);
                    },

                    child: ListView.builder(
                      itemCount: image.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child:

                          Container(
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 16.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 54.w,
                                    height: 54.h,
                                    child: Image.asset(
                                      image[index],
                                      fit: BoxFit.contain,
                                      errorBuilder: (_, __, ___) => Icon(Icons.error),
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
                                        UIHelper.verticalSpace(8.h),

                                        GestureDetector(
                                          onTap: () => increaseProgress(index),
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(40.r),
                                            child: LinearProgressIndicator(
                                              value: progressList[index],
                                              minHeight: 6.h,
                                              valueColor:
                                              AlwaysStoppedAnimation<Color>(

                                                isLight
                                                    ? AppColors.cA1D1FF
                                                    : AppColors.cA1D1FF,

                                              ),
                                              backgroundColor:
                                              isLight
                                                  ? AppColors.cD3EAFF
                                                  : AppColors.c3F678C,
                                            ),
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
  }
}
