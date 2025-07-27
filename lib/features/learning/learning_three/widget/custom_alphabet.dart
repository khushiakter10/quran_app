import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class CustomAlphabet extends StatefulWidget {
  final String text;

   CustomAlphabet({
    super.key, required this.text,
  });

  @override
  State<CustomAlphabet> createState() => _CustomAlphabetState();
}

class _CustomAlphabetState extends State<CustomAlphabet> {
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

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(

          color: isLight ? AppColors.cF9F6F0 :  Color(0x66061420),

          borderRadius: BorderRadius.circular(8.r),
          border: Border.all( color: isLight ?  Colors.transparent : AppColors.c3F678C,width: 1)

      ),
      child: Padding(
        padding: EdgeInsets.symmetric( horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppImages.alpha,height: 54.h),
                UIHelper.horizontalSpace(16.w),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

//========================== Alfabat =======================///
                    Row(
                      children: [
                        Text(
                            widget.text,
                            style: TextFontStyle.titleStyle12w400cB1AFAARaleway.copyWith(
                                color: isStarfield
                                    ? AppColors.cB1AFAA
                                    : (UiDarkModeHelper.isDarkMode(context)
                                    ? AppColors.cB1AFAA
                                    :  AppColors.c666666)
                            )

                        ),
                        UIHelper.horizontalSpace(14.w),
                        
                        GestureDetector(
                          onTap: (){NavigationService.navigateTo(Routes.alphabetScreen);},
                          child: Text(
                            'See All',
                            style: TextFontStyle.textStyle12w400c72BBFFRaleway
                                .copyWith(fontSize: 10.sp),
                          ),
                        ),
                        
                        
                        UIHelper.horizontalSpace(2.w),

                        GestureDetector(
                            onTap: (){NavigationService.navigateTo(Routes.alphabetScreen);},
                            child: SvgPicture.asset(AppIcons.arrwIcon,color: AppColors.c72BBFF,height: 10.sp)),

                      ],
                    ),
                    UIHelper.verticalSpace(8.h),


                    Text('Alphabet',style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                        fontWeight: FontWeight.w600,fontSize: 16.sp,
                        color: isStarfield
                            ? AppColors.cB1AFAA
                            : (UiDarkModeHelper.isDarkMode(context)
                            ? AppColors.cB1AFAA
                            :  AppColors.c666666)
                    )),
                    UIHelper.verticalSpace(8.h),



                    SizedBox(
                      width: 200.h,
                      child: GestureDetector(
                        onTap: () => toggleProgress(trackedIndex),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.r),
                          child: LinearProgressIndicator(
                              value: progressList[trackedIndex],
                              minHeight: 6.h,
                              valueColor: AlwaysStoppedAnimation<Color>(

                                  AppColors.cA1D1FF

                              ),
                              backgroundColor: isLight ? AppColors.c3F678C :  Color(0xFF5185B5)



                          ),
                        ),
                      ),
                    ),






                  ],
                ),
              ],
            ),

          ],
        ),
      ),


    );
  }
}