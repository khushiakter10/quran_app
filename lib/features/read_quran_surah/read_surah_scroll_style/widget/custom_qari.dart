import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class CustomQari extends StatefulWidget {
  const CustomQari({super.key});

  @override
  State<CustomQari> createState() => _CustomQariState();
}

class _CustomQariState extends State<CustomQari> {
  int selectedIndex = -1;

  final List<String> reciterList = [
    'Abdul Basit',
    'Mishary Rashid',
    'Saad Al-Ghamdi',
    'Abdul Rahman Al-Sudais',
    'Yasser Al-Dosari',
    'Abdullah Matrood',
    'Maher Al-Muaiqly',
    'Khalid Al-Jalil',
    'Ali Jaber',
    'Ahmed Al-Ajmi',
    'Hudhaify',
    'Abdul Muhsin al Qasim',
  ];

  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: isLight ? AppColors.cFFFFFF : AppColors.bottomshetColor,
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.r),
              topRight: Radius.circular(32.r),
            ),
          ),
          builder: (BuildContext context) {
            return  Container(
              height: 788.h,
              child:  SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 24.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    CustomAppbarWidget(
                      textStyle: TextFontStyle.textStyle18w500cF9F6F0Raleway.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isLight ? Colors.black : const Color(0xFFF9F6F0),
                      ),
                      showIcon: false,
                      text: 'Select Reciter',
                      onTap: () {
                        NavigationService.goBack;
                      },
                    ),


                    UIHelper.verticalSpace(26.h),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: reciterList.length,
                      separatorBuilder: (context, index) => Column(
                        children: [
                          UIHelper.verticalSpace(16.h),
                          Divider(color: isLight ? Colors.black54 : AppColors.c3F678C, thickness: 1),
                          UIHelper.verticalSpace(16.h),
                        ],
                      ),
                      itemBuilder: (context, index) {
                        bool isSelected = selectedIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [

                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: isSelected
                                    ? BoxDecoration(
                                  border: Border.all(
                                    width: 2.0,
                                    color: isLight ? Colors.black : Colors.blue,
                                  ),
                                  shape: BoxShape.circle,
                                )
                                    : null,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? (isLight ? Colors.black : Colors.blue)
                                        : (isLight ? Colors.grey : Colors.grey),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),


                              UIHelper.horizontalSpace(8.w),
                              Text(
                                reciterList[index],
                                style: TextStyle(
                                  color: isLight ? Colors.black : const Color(0xFFF9F6F0),
                                  fontSize: 14,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w400,
                                  height: 1.64,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset(AppIcons.playCircle, height: 24.h, color: isLight ? Colors.black : null),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );


          },
        );
      },
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.profileUserIcon, height: 24.h, color: isLight ? Colors.black : null),
          UIHelper.horizontalSpace(4.w),
          Text(
            'Qari',
            style: TextFontStyle.titleStyle12w400c757575Raleway.copyWith(
              fontSize: 14.sp,
              color: isLight ? Colors.black : Colors.white,
            ),
          ),
          const Spacer(),
          Text(
            selectedIndex != -1
                ? reciterList[selectedIndex]
                : 'Abdul Muhsin al Qasim',
            textAlign: TextAlign.right,
            style: TextFontStyle.titleStyle12w400c757575Raleway.copyWith(
              fontSize: 14.sp,
              color: isLight ? Colors.black : Colors.white,
            ),
          ),
          UIHelper.horizontalSpace(4.w),
          SvgPicture.asset(AppIcons.arrwIcon, height: 16.h, color: isLight ? Colors.black : null),
        ],
      ),
    );
  }
}