
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/common_widgets/custom_text_formfield.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState
    extends State<ResetPasswordScreen> {


  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confrimPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please retype your password';
    }
    if (value != newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }


  @override
  void dispose() {
    newPasswordController.dispose();
    confrimPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 10.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => NavigationService.goBack(),
                  child: Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80.r),
                      border: Border.all(color: AppColors.cE8E8E8),
                    ),
                    child: SvgPicture.asset(AppIcons.arrwrightblack, height: 16.h),
                  ),
                ),
                UIHelper.verticalSpace(16.h),

                Text(
                  'Create New Password',
                  style: TextStyle(
                    color: const Color(0xFF484848),
                    fontSize: 32,
                    fontFamily: 'Cormorant Garamond',
                    fontWeight: FontWeight.w700,
                    height: 1.32,
                    letterSpacing: -0.32,
                  ),
                ),
                UIHelper.verticalSpace(2.h),

                Text(
                  'Please enter and confirm your new password. You\n will need to login after you reset.',
                    style: TextFontStyle.textStyle14w400c666666Raleway
                ),
                UIHelper.verticalSpace(32.h),


                UIHelper.verticalSpace(8.h),

                CustomTextFormfield(
                  borderRadius: 8.r,
                  labelText: 'New Password',
                  labelTextStyle: TextFontStyle.textStyle14w400c666666Raleway.copyWith(fontSize: 12.sp),
                  borderColor: AppColors.cE8E8E8,
                  fillColor: AppColors.cFFFFFF,
                  hintText: '********',
                  hintStyle: TextFontStyle.textStyle14w500c000000Raleway,
                  controller: newPasswordController,
                  isObsecure: true,
                  isPass: true,
                  validator: _validatePassword,
                ),

                UIHelper.verticalSpace(16.h),

                UIHelper.verticalSpace(8.h),
                CustomTextFormfield(
                  borderRadius: 8.r,
                  labelText: 'Confirm Password',
                  labelTextStyle: TextFontStyle.textStyle14w400c666666Raleway.copyWith(fontSize: 12.sp),
                  borderColor: AppColors.cE8E8E8,
                  fillColor: AppColors.cFFFFFF,
                  hintText: '********',
                  controller: confrimPasswordController,
                  isObsecure: true,
                  isPass: true,
                  validator: _validatePassword,
                ),

                UIHelper.verticalSpace(80.h),

                CustomPersonalizationButton(
                  text: 'Reset password',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      NavigationService.navigateTo(Routes.loginScreen);
                    }
                  },
                ),






              ],
            ),
          ),
        ),
      ),

    );
  }
}

