import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/common_widgets/custom_text_formfield.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  final TextEditingController emailAddressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }



  @override
  void dispose() {
    emailAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Back Button
                GestureDetector(
                  onTap: () {
                    NavigationService.goBack();
                  },
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

                /// Title
                Text(
                  'Forgot Password',
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

                /// Subtitle
                Text(
                  "Don't worry! We'll provide you with the\ninstructions to reset your password.",
                  style: TextFontStyle.textStyle14w400c666666Raleway,
                ),
                UIHelper.verticalSpace(32.h),

                /// Email Input Field
                CustomTextFormfield(
                  borderRadius: 8.r,
                  labelText: 'Email address',
                  labelTextStyle: TextFontStyle.textStyle16w400c969696Raleway.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                  controller: emailAddressController,
                  validator: _validateEmail,
                  borderColor: AppColors.cE8E8E8,
                  fillColor: AppColors.cFFFFFF,
                ),
                UIHelper.verticalSpace(150.h),

                /// Send Button
                CustomPersonalizationButton(
                  text: 'Send',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      NavigationService.navigateTo(Routes.forgotOtpVerificationScreen);
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
