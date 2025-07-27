import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../assets_helper/app_colors.dart';
import '../../../assets_helper/app_fonts.dart';
import '../../../assets_helper/app_image.dart';
import '../../../helpers/ui_helpers.dart';

class OnboardingCard3 extends StatelessWidget {
  const OnboardingCard3({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.cF4ECDC,
      body:   SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpace(70.h),
            Center(
              child: Image.asset(
                AppImages.onboarding03,
                fit: BoxFit.cover,
                height: 300.h,
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(16.sp),
              child: SizedBox(
                width: 370,
                child: Text(
                  'Dive into the Meaning with Tafsir',
                  style: TextFontStyle.textStyle40w600primaryColor2CormorantGaramond,
                ),
              ),
            ),
            UIHelper.verticalSpace(8.h),
            Padding(
              padding:  EdgeInsets.all(16.sp),
              child: Text(
                'Access rich tafsir explanations from trusted scholars to deepen your understanding.',
                style: TextFontStyle.textStyle12w400c484848Raleway
                    .copyWith(

                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp
                ),

              ),
            ),
          ],
        ),
      ),
    );


  }
}
