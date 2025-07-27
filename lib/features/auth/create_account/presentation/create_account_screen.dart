
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/common_widgets/custom_text_field_auth.dart';
import 'package:quran_app/features/personalization_flow/sign_up_preferred_language/presentation/preferred_language_screen.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _isChecked = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  GestureDetector(
                    onTap: (){
                      NavigationService.goBack;
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

                  /// Header Text
                  Text(
                    'Create an Account',
                    style: TextFontStyle.textStyle22w600primaryColor2Raleway.copyWith(fontSize: 24.sp),
                  ),
                  UIHelper.verticalSpace(16.h),
                  Text(
                    'Please enter your details to create an account.',
                    style: TextFontStyle.textStyle14w400c666666Raleway,
                  ),
                  UIHelper.verticalSpace(32.h),

  //----------------------- Name ----------------------//
                  CustomTextFieldAuth(
                    borderRadius: 8.r,
                    controller: nameController,
                    hintText: "Your Name",
                    hintStyle: TextFontStyle.textStyle14w500c000000Raleway,
                    labelText: 'Name',
                    labelTextStyle: TextFontStyle.textStyle14w400c666666Raleway.copyWith(fontSize: 12.sp),
                  //  disabledColor: AppColors.cE8E8E8,
                    fillColor: Colors.transparent,
                    borderColor:  AppColors.cE8E8E8,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
   //---------------------- Done ---------------------//

                  UIHelper.verticalSpace(16.h),

 //---------------------------- Email-----------------------//
                  CustomTextFieldAuth(
                    borderRadius: 8.r,
                    controller: emailController,
                    hintText: "Enter Email",
                    hintStyle: TextFontStyle.textStyle14w500c000000Raleway,
                    labelText: 'Email address',
                    labelTextStyle: TextFontStyle.textStyle14w400c666666Raleway.copyWith(fontSize: 12.sp),
                    disabledColor: AppColors.cE8E8E8,
                    fillColor: Colors.transparent,
                    borderColor:  AppColors.cE8E8E8,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Invalid email format';
                      }
                      return null;
                    },
                  ),
//--------------------- Done ---------------------------//
                  UIHelper.verticalSpace(16.h),

//---------------------- password ---------------------------//
                  CustomTextFieldAuth(
                    borderRadius: 8.r,
                    controller: passwordController,
                    hintText: "Enter password",
                    labelText: 'Password',
                    labelTextStyle: TextFontStyle.textStyle14w400c666666Raleway.copyWith(fontSize: 12.sp),
                    fillColor: Colors.transparent,
                    isPass: true,
                    borderColor:  AppColors.cE8E8E8,
                    disabledColor: AppColors.cE8E8E8,
                    hintStyle: TextFontStyle.textStyle14w500c000000Raleway,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
// -------------------------- done --------------------------//
                  UIHelper.verticalSpace(16.h),

 //-------------------------- Confirm Password -----------------------//
                  CustomTextFieldAuth(
                    borderRadius: 8.r,
                    controller: confirmPasswordController,
                    disabledColor: AppColors.cE8E8E8,
                    labelText: 'Confirm Password',
                    labelTextStyle: TextFontStyle.textStyle14w400c666666Raleway.copyWith(fontSize: 12.sp),
                    fillColor: Colors.transparent,
                    isPass: true,
                    borderColor:  AppColors.cE8E8E8,


                    hintStyle: TextFontStyle.textStyle14w500c000000Raleway,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm password is required';
                      } else if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
   //---------------------- Done -------------------------//
                  UIHelper.verticalSpace(24),

                  Row(
                    children: [
                      Checkbox(
                        activeColor:AppColors.cC3E1FD,
                        checkColor: AppColors.c72BBFF,
                        side: BorderSide(color: AppColors.cE8E8E8,width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        value: _isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _isChecked = newValue ?? false;
                          });
                        },
                      ),
                      UIHelper.horizontalSpace(8.w),

                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'I Agree with ',
                                style: TextStyle(
                                  color: const Color(0xFF969696),
                                  fontSize: 14,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w400,
                                  height: 1.64,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms of Service',
                               style: TextFontStyle.textStyle18w500primaryColor2Raleway.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400)
                              ),
                              TextSpan(
                                text: ' and ',
                                style: TextStyle(
                                  color: const Color(0xFF969696),
                                  fontSize: 14,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w400,
                                  height: 1.64,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Policy ',
                                style: TextFontStyle.textStyle18w500primaryColor2Raleway.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400)
                              ),
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                  UIHelper.verticalSpace(120.h),


                  CustomPersonalizationButton(
                    text: 'Sign Up',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {

                        Get.to(PreferredLanguageScreen());
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
