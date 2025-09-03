import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_helpers.dart';



class ForgotOtpVerificationScreen extends StatefulWidget {
  const ForgotOtpVerificationScreen({super.key, required this.email});
  final String email;

  @override
  State<ForgotOtpVerificationScreen> createState() =>
      _ForgotOtpVerificationScreenState();
}

class _ForgotOtpVerificationScreenState extends State<ForgotOtpVerificationScreen> {

  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isResendLoading = false;
  int _resendCountdown = 59;

  @override
  void initState() {
    super.initState();
    _startResendCountdown();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _startResendCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_resendCountdown > 0 && mounted) {
        setState(() => _resendCountdown--);
        _startResendCountdown();
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }


  Future<void> _resendOtp() async {
    setState(() {
      _isResendLoading = true;
      _resendCountdown = 59;
    });

    try {
      await Future.delayed(const Duration(seconds: 1));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP resent successfully')),
      );
      _startResendCountdown();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to resend OTP: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() => _isResendLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.cFFFFFF,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child:  SingleChildScrollView(
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
                  Text(
                    'Enter 4-digit code sent to your email id ${widget.email}',
                    style: TextStyle(
                      color: const Color(0xFF666666),
                      fontSize: 14,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      height: 1.64,
                    ),
                  ),
                  UIHelper.verticalSpace(16.h),

                  Text(
                    'Enter 4 Digit Code',
                    style: TextFontStyle.textStyle12w400c000000Raleway.copyWith(fontSize: 16.sp),
                  ),
                  UIHelper.verticalSpace(14.h),


//========================= OTP ==============================///
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 23.h),
                      child: LayoutBuilder(
                        builder: (context, constraints) {

                          double totalWidth = constraints.maxWidth;
                          double fieldWidth = (totalWidth - 30) / 4;
                          return PinCodeTextField(
                            appContext: context,
                            length: 4,
                            controller: _otpController,
                            enablePinAutofill: true,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter OTP';
                              } else if (value.trim().length != 4) {
                                return 'Please enter complete 4-digit OTP';
                              }
                              return null;
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(8.r),
                              fieldHeight: 52.h,
                              fieldWidth:  fieldWidth.clamp(50, 77.5),
                              borderWidth: 1,
                              activeColor: AppColors.cE8E8E8,
                              selectedColor: AppColors.cE8E8E8,
                              inactiveColor: AppColors.cE8E8E8,
                              activeFillColor: AppColors.cFFFFFF,
                              selectedFillColor: AppColors.cFFFFFF,
                              inactiveFillColor: AppColors.cFFFFFF,
                            ),
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            enableActiveFill: true,
                            textStyle: TextFontStyle.textStyle12w400c000000Raleway.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            onChanged: (value) {},
                          );
                        },
                      ),
                    ),
                  ),





                  ///++++++++++++++++++++++++++ Done +++++++++++++++++++++++++++++++++++++///





                  UIHelper.verticalSpace(16.h),

                  Align(
                    alignment: Alignment.center,
                    child: _resendCountdown > 0
                        ? Text(
                      "Resend Code in ${_formatTime(_resendCountdown)}",
                      style: const TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    )
                        : TextButton(
                      onPressed: _isResendLoading ? null : _resendOtp,
                      child: _isResendLoading
                          ? SizedBox(
                        height: 16.h,
                        width: 16.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.primaryColor,
                        ),
                      )
                          : Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Didn’t Receive Code?  ',
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 12,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                            const TextSpan(
                              text: 'Resend Code',
                              style: TextStyle(
                                color: Color(0xFF68AAE8),
                                fontSize: 12,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  UIHelper.verticalSpace(80.h),


                  CustomPersonalizationButton(
                    text: 'Verify',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        NavigationService.navigateTo(Routes.resetPasswordScreen);
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
