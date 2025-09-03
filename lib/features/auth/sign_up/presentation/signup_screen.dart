import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_helpers.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
       backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child:Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 24.h,
          ),
          child: SingleChildScrollView(
            child: Column(

              children: [
                UIHelper.verticalSpace(50.h),

              Image.asset(AppImages.quranImage,height: 180.h),

                UIHelper.verticalSpace(24.h),
                Text(
                  'Welcome to IQRA',
                  textAlign: TextAlign.center,
                  style: TextFontStyle.textStyle24w700c000000CormorantGaramond
                ),
                UIHelper.verticalSpace(2.h),
                Text(
                  'Create an account to get started your journey.',
                  textAlign: TextAlign.center,
                  style:  TextFontStyle.textStyle14w400c666666Raleway
                ),
                UIHelper.verticalSpace(40.h),

              GestureDetector(
                onTap: (){
                  NavigationService.navigateTo(Routes.createAccountScreen);
                },
                child: Container(
                  width: double.infinity,
                  padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.cE8E8E8,width: 2.w)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.withEmailIcon,height: 32.h),
                      UIHelper.horizontalSpace(8.w),
                      Text(
                        'Continue with Email',
                        textAlign: TextAlign.center,
                        style:TextFontStyle.textStyle24w600primaryColor2Poppins.copyWith(fontSize: 14.sp)
                      )
                    ],
                  ),
                ),
              ),
                UIHelper.verticalSpace(20.h),

                Container(
                  width: double.infinity,
                  padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.cE8E8E8,width: 2.w)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.googleIcon,height: 32.h),
                      UIHelper.horizontalSpace(8.w),
                      Text(
                          'Continue with Google',
                          textAlign: TextAlign.center,
                          style:TextFontStyle.textStyle24w600primaryColor2Poppins.copyWith(fontSize: 14.sp)
                      )
                    ],
                  ),
                ),
                UIHelper.verticalSpace(20.h),


                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextFontStyle.textStyle16w400c969696Raleway.copyWith(fontWeight: FontWeight.w600,fontSize: 14.sp)
                    ),
                    UIHelper.horizontalSpace(4.w),

                    GestureDetector(
                      onTap: (){
                        NavigationService.navigateTo(Routes.loginScreen);
                      },
                      child: Text(
                        'Login',
                        style:  TextFontStyle.textStyle12w400c72BBFFRaleway.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500)
                      ),
                    )
                  ],
                ),
              ],

            ),
          ),
        ),
      ),);
  }
}