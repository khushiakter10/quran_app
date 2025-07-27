import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/helpers/ui_helpers.dart';



class OnboardingCard1 extends StatelessWidget {
  const OnboardingCard1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.cF4ECDC,
      body:  SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpace(120.h),
            Center(
              child: Image.asset(
                AppImages.onboarding01,
                fit: BoxFit.cover,
                height: 300.h,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 320,
                child: Text(
                  'Read the Quran Your Way',
                  style: TextFontStyle.textStyle40w600primaryColor2CormorantGaramond,
                ),
              ),
            ),
            UIHelper.verticalSpace(8.h),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'View word-by-word with translation, full verses, or Arabic only — however you feel most connected.',
                style: TextFontStyle.textStyle12w400c484848Raleway
                    .copyWith(

                  fontWeight: FontWeight.w400,
                 fontSize: 16.sp
                ),

              ),
            ),
            UIHelper.verticalSpace(48.h),
          ],
        ),
      ),
    );


  }
}
