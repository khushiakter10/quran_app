import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/common_widgets/custom_text_formfield.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateCurrentPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your current password';
    }
    return null;
  }

  String? _validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a new password';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your new password';
    }
    if (value != newPasswordController.text) {
      return 'New password and confirm password do not match';
    }
    return null;
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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
          gradient: isStarfield ? null : UiDarkModeHelper.getCurrentGradient(context),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppbarWidget(
                    showIcon: false,
                    text: 'Change Password',
                    onTap: () {
                      NavigationService.goBack();
                    },
                  ),
                  UIHelper.verticalSpace(30.h),
                  Text(
                    'Your new password must be different from the previously used password.',
                    style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                      color: isStarfield
                          ? AppColors.cF9F6F0
                          : (UiDarkModeHelper.isDarkMode(context)
                          ? AppColors.c484848
                          : AppColors.c484848),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  UIHelper.verticalSpace(16.h),

                  // Current Password
                  CustomTextFormfield(
                    contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    borderRadius: 8.r,
                    labelText: 'Current Password*',
                    labelTextStyle: TextFontStyle.textStyle14w400c666666Raleway.copyWith(
                      fontSize: 16.sp,
                      color: isStarfield
                          ? AppColors.cF9F6F0
                          : AppColors.c666666,
                    ),
                    fillColor: isLight ? AppColors.cF9F6F0 : const Color(0xB2061420),
                    hintText: '********',
                    controller: currentPasswordController,
                    isObsecure: true,
                    isPass: true,
                    validator: _validateCurrentPassword,
                    visibilityIconColor: AppColors.c999999,
                    textStyle: TextStyle(
                      color: isLight ? AppColors.c000000 : AppColors.cFFFFFF,
                    ),
                  ),
                  UIHelper.verticalSpace(8.h),

                  // New Password
                  CustomTextFormfield(
                    contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    borderRadius: 8.r,
                    labelText: 'New Password*',
                    labelTextStyle: TextFontStyle.textStyle14w400c666666Raleway.copyWith(
                      fontSize: 16.sp,
                      color: isStarfield
                          ? AppColors.cF9F6F0
                          : AppColors.c666666,
                    ),
                    fillColor: isLight ? AppColors.cF9F6F0 : const Color(0xB2061420),
                    hintText: '********',
                    controller: newPasswordController,
                    isObsecure: true,
                    isPass: true,
                    validator: _validateNewPassword,
                    visibilityIconColor: AppColors.c999999,
                    textStyle: TextStyle(
                      color: isLight ? AppColors.c000000 : AppColors.cFFFFFF,
                    ),
                  ),
                  UIHelper.verticalSpace(8.h),

                  // Confirm Password
                  CustomTextFormfield(
                    contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    borderRadius: 8.r,
                    labelText: 'Confirm Password*',
                    labelTextStyle: TextFontStyle.textStyle14w400c666666Raleway.copyWith(
                      fontSize: 16.sp,
                      color: isStarfield
                          ? AppColors.cF9F6F0
                          : AppColors.c666666,
                    ),
                    fillColor: isLight ? AppColors.cF9F6F0 : const Color(0xB2061420),
                    hintText: '********',
                    controller: confirmPasswordController,
                    isObsecure: true,
                    isPass: true,
                    validator: _validateConfirmPassword,
                    visibilityIconColor: AppColors.c999999,
                    textStyle: TextStyle(
                      color: isLight ? AppColors.c000000 : AppColors.cFFFFFF,
                    ),
                  ),

                  const Spacer(),

                  // Update Button
                  CustomPersonalizationButton(
                    text: 'Update Password',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Add actual update password logic here if needed
                        NavigationService.navigateTo(Routes.accountManagementScreen);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
