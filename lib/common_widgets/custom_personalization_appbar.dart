


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/features/personalization_flow/sign_up_preferred_language/widget/custom_container_widget.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class CustomPersonalizationAppbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged;

  const CustomPersonalizationAppbar({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Back Button (fixed behavior)
        GestureDetector(
          onTap: () {
            NavigationService.goBack();
          },
          child: Container(
            padding: EdgeInsets.all(12.sp),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: Color(0xFF969696),
                ),
                borderRadius: BorderRadius.circular(40.r),
              ),
            ),
            child: SvgPicture.asset(
              AppIcons.arrowlefticon,
              height: 12.h,
            ),
          ),
        ),

        UIHelper.horizontalSpace(10.w),


        Expanded(
          child: Row(
            children: List.generate(7, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: GestureDetector(
                  onTap: () => onIndexChanged(index),
                  child: CustomContainerWidget(
                    width: 24.w,
                    height: 6.h,
                    color: selectedIndex == index
                        ? AppColors.c72BBFF
                        : AppColors.c586F90,
                  ),
                ),
              );
            }),
          ),
        ),

        UIHelper.horizontalSpace(10.w),

        /// Skip Button (fixed behavior)
        Text(
          'Skip',
          style: TextStyle(
            color: const Color(0xFFF9F6F0),
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 1.64,
          ),
        ),
      ],
    );
  }
}

