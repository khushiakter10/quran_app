
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/common_widgets/custom_text_formfield.dart';
import 'package:quran_app/features/auth/sign_up/presentation/signup_screen.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_helpers.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                  Text(
                    "Welcome back, login and start exploring",
                    style: TextFontStyle.textStyle40w600primaryColor2CormorantGaramond.copyWith(fontSize: 32.sp),
                  ),
                  UIHelper.verticalSpace(40.h),

                  // Email
                  CustomTextFormfield(
                    labelText: 'Email address',
                    labelTextStyle: TextFontStyle.textStyle16w400c969696Raleway.copyWith(fontWeight: FontWeight.w400,fontSize: 12.sp),
                    borderRadius: 8.r,
                    hintStyle: TextFontStyle.textStyle14w500c000000Raleway,
                    borderColor:  AppColors.cE8E8E8,
                    controller: emailController,
                    fillColor: Colors.transparent,
                    inputType: TextInputType.emailAddress,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),

                  UIHelper.verticalSpace(24.h),


                  CustomTextFormfield(
                    labelText: 'Password',
                    labelTextStyle: TextFontStyle.textStyle16w400c969696Raleway.copyWith(fontWeight: FontWeight.w400,fontSize: 12.sp),
                    borderRadius: 8.r,
                    borderColor:  AppColors.cE8E8E8,
                    hintText: "*******",
                    fillColor: Colors.transparent,
                    controller: passwordController,
                    isObsecure: !showPassword,
                    isPass: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.c5C5C5C,
                      ),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),

                  UIHelper.verticalSpace(8.h),

                  // Forgot Password
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        NavigationService.navigateTo(Routes.forgetPasswordScreen);
                      },
                      child: Text(
                        "Forget password",
                        style: TextFontStyle.textStyle18w500primaryColor2Raleway.copyWith(
                          fontSize: 14.sp,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.c000000,
                        ),
                      ),
                    ),
                  ),

                  UIHelper.verticalSpace(32.h),


                  CustomPersonalizationButton(
                    text: 'Login',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {


                        NavigationService.navigateTo(Routes.preferredLanguageScreen);

                      }
                    },
                  ),

                  UIHelper.verticalSpace(120.h),

                  // Google Button
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.cE8E8E8, width: 1.w),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.googleIcon, height: 32.h),
                        UIHelper.horizontalSpace(8.w),
                        Text(
                          'Continue with Google',
                          textAlign: TextAlign.center,
                          style: TextFontStyle.textStyle22w600primaryColor2Raleway.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),

                  UIHelper.verticalSpace(16.h),

                  // Sign Up Navigation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: const Color(0xFF969696),
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      UIHelper.horizontalSpace(4.w),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SignUpScreen());
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color:  Color(0xFF72BBFF),
                            fontSize: 14,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
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
