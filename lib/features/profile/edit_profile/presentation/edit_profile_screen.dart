import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/common_widgets/custom_text_formfield.dart';
import 'package:quran_app/features/profile/edit_profile/widget/custome_edit_profile.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with TickerProviderStateMixin {

  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();





  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    displayNameController.dispose();
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
          gradient: isStarfield
              ? null
              : UiDarkModeHelper.getCurrentGradient(context),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppbarWidget(
                    showIcon: false,
                    text: 'Edit Profile',
                    onTap: () {
                      NavigationService.goBack();
                    },
                  ),
                  UIHelper.verticalSpace(24.h),



                  CustomeEditProfile(title: 'Upload Profile Picture'),


                  ///============================= frist Name ===============================////
                  UIHelper.verticalSpace(8.w),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormfield(
                          controller: firstNameController,
                          contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                          labelText: 'First Name*',
                          borderRadius: 8.r,

                          labelTextStyle: TextFontStyle.titleStyle14w400c999999Raleway.copyWith(
                            color: isStarfield
                                ? AppColors.c999999
                                : AppColors.c484848,
                          ),
                          borderColor: Colors.transparent,
                          fillColor: isLight
                              ? AppColors.cF9F6F0
                              : const Color(0xB2061420),
                          textStyle: TextStyle(
                            color: isLight ? Colors.black : AppColors.cFFFFFF,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                      ///============================= Last Name ===============================////
                      UIHelper.horizontalSpace(8.w),
                      Expanded(
                        child: CustomTextFormfield(
                          controller: lastNameController,
                          contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                          labelText: 'Last Name*',
                          borderRadius: 8.r,
                          labelTextStyle: TextFontStyle.titleStyle14w400c999999Raleway.copyWith(
                            color: isStarfield
                                ? AppColors.c999999
                                : AppColors.c484848,
                          ),
                          borderColor: Colors.transparent,
                          fillColor: isLight
                              ? AppColors.cF9F6F0
                              : const Color(0xB2061420),
                          textStyle: TextStyle(
                            color: isLight ? Colors.black : AppColors.cFFFFFF,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ///============================= display===============================////
                  UIHelper.verticalSpace(8.w),

                  CustomTextFormfield(
                    controller: displayNameController,

                    contentPadding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
                    labelText: 'Display Name*',
                    borderRadius: 8.r,

                    labelTextStyle: TextFontStyle.titleStyle14w400c999999Raleway.copyWith(
                      color: isStarfield
                          ? AppColors.c999999
                          : AppColors.c484848,
                    ),
                    borderColor:  Colors.transparent,

                    fillColor: isLight
                        ? AppColors.cF9F6F0
                        : const Color(0xB2061420),

                    textStyle: TextStyle(
                      color: isLight ? Colors.black : AppColors.cFFFFFF,
                      fontSize: 10.sp,
                    ),

                  ),

              ///============================= Email===============================////
                  UIHelper.verticalSpace(8.w),
                  CustomTextFormfield(
                    controller: EmailController,
                    contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    labelText: 'Email*',
                    borderRadius: 8.r,
                    labelTextStyle: TextFontStyle.titleStyle14w400c999999Raleway.copyWith(
                      color: isStarfield ? AppColors.c999999 : AppColors.c484848,
                    ),
                    borderColor: Colors.transparent,
                    fillColor: isLight ? AppColors.cF9F6F0 : const Color(0xB2061420),
                    textStyle: TextStyle(
                      color: isLight ? Colors.black : AppColors.cFFFFFF,
                      fontSize: 10.sp,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Regular expression for email validation
                      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null; // Return null if the input is valid
                    },
                  ),

                  UIHelper.verticalSpace(250.w),

                  CustomPersonalizationButton(
                    text: 'Update',
                    onPressed: () {
                      // First validate the form before navigating
                      if (formKey.currentState!.validate()) {
                        NavigationService.navigateTo(Routes.profileScreen);
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


