import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class CustomMine extends StatefulWidget {
  const CustomMine({super.key});

  @override
  State<CustomMine> createState() => _CustomMineState();
}
class _CustomMineState extends State<CustomMine> {

  List<bool> isLikedList = List.generate(4, (index) => false);

  final List<String> roshan = [
    'Khushbu Rahman Khushi',
    'Hafsa',
    'Ahona Tasnim',
    'Swoyaib'
  ];

  final List<String> title = [
    '15 hours ago',
    '10 hours ago',
    '5 hours ago',
    '2 hours ago',
  ];

  final List<String> subtitle = [
    'It is seen by many as a very spiritual exercise that helps people connect with the almighty. In addition to its religiou',
    'Participating in communal prayers fosters a sense of unity among believers and enriches the spiritual experience.',
    'Engaging in acts of charity is highly encouraged and seen as a vital part of a Muslim',
    'Participating in communal prayers fosters a sense of unity among believers and enriches the spiritual experience.',
  ];

  final List<String> heart = ['8', '10', '12', '9'];
  final List<String> message = ['8', '12', '15', '20'];
  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return  ListView.builder(
      itemCount: roshan.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(

              color: isLight ? AppColors.cF9F6F0 : Color(0xB2061420),

              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppImages.roshan, height: 39.h, width: 39.h),
                UIHelper.horizontalSpace(8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        roshan[index],
                        style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: isStarfield
                              ? const Color(0xFFF9F6F0)
                              : (UiDarkModeHelper.isDarkMode(context)
                              ? AppColors.cFEFEFE
                              : AppColors.c484848),
                        ),
                      ),
                      Text(
                        title[index],
                        style: TextFontStyle.textStyle16w400c969696Raleway.copyWith(fontSize: 12.sp,
                          color: isStarfield
                              ? const Color(0xFFF9F6F0)
                              : (UiDarkModeHelper.isDarkMode(context)
                              ? AppColors.c969696
                              : AppColors.c969696),
                        ),
                      ),
                      UIHelper.verticalSpace(12.h),
                      Text(
                        subtitle[index],
                        style: TextFontStyle.titleStyle12w400c757575Raleway.copyWith(
                          color: isStarfield
                              ? const Color(0xFFF9F6F0)
                              : (UiDarkModeHelper.isDarkMode(context)
                              ? AppColors.cF9F6F0
                              : AppColors.c060606),
                        ),
                      ),
                      UIHelper.verticalSpace(12.h),

//------------------------ Hart Icon -----------------------------//

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isLikedList[index]) {
                                  isLikedList[index] = false;
                                } else {
                                  for (int i = 0; i < isLikedList.length; i++) {
                                    isLikedList[i] = false;
                                  }
                                  isLikedList[index] = true;
                                }
                              });
                            },
                            child: SvgPicture.asset(
                              AppIcons.heartIcon,
                              height: 16.h,
                              color: isLikedList[index] ? Colors.red : AppColors.c969696,
                            ),
                          ),


                          UIHelper.horizontalSpace(8.w),
                          Text(
                            heart[index],
                            style: TextFontStyle.textStyle16w400c969696Raleway.copyWith(fontSize: 10.sp),
                          ),
                          UIHelper.horizontalSpace(40.w),
                          SvgPicture.asset(AppIcons.message, height: 16.h),
                          UIHelper.horizontalSpace(8.w),
                          Text(
                            message[index],
                            style: TextFontStyle.textStyle16w400c969696Raleway.copyWith(fontSize: 10.sp),
                          ),
                          UIHelper.horizontalSpace(40.w),
                          SvgPicture.asset(AppIcons.SharemineIcon, height: 16.h),
                          UIHelper.horizontalSpace(8.w),
                          Text(
                            'Share',
                            style: TextStyle(
                              color: const Color(0xFF969696),
                              fontSize: 10,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w400,
                              height: 1.64,
                            ),
                          )
                        ],
                      ),

                      //------------------------  Done --------------------------------//
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
