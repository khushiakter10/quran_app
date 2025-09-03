
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

/// Controller for managing profile image
class ProfileImageController extends GetxController {
  Rx<File?> profileImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }
}

/// Main widget
class CustomeEditProfile extends StatelessWidget {
  final String title;

  CustomeEditProfile({super.key, required this.title});

  final ProfileImageController controller = Get.put(ProfileImageController());

  void _showBottomSheet(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    showModalBottomSheet(
      backgroundColor: isLight ? AppColors.cFFFFFF : AppColors.cFFFFFF,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  controller.pickImageFromCamera();
                },
                child: Text(
                  'Take Photo',
                  style: TextFontStyle.textStyle14w400c6B6B6B,
                ),
              ),
              UIHelper.verticalSpace(10.h),
              Divider(color: AppColors.primaryColor),
              UIHelper.verticalSpace(10.h),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  controller.pickImageFromGallery();
                },
                child: Text(
                  'Select from Library',
                  style: TextFontStyle.textStyle14w400c6B6B6B,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;

    return Obx(() {
      return Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: isLight ? AppColors.cF9F6F0 : const Color(0xB2061420),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => _showBottomSheet(context),
                child: Container(
                  width: 80.w,
                  height: 80.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isLight ? AppColors.cFFFFFF : const Color(0xB2061420),
                  ),
                  child: ClipOval(
                    child: controller.profileImage.value != null
                        ? Image.file(
                      controller.profileImage.value!,
                      fit: BoxFit.cover,
                      width: 80.w,
                      height: 80.w,
                    )
                        : Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: SvgPicture.asset(
                        AppIcons.editprofileaddicon,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              UIHelper.verticalSpace(10.h),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle14w400c666666Raleway.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: isStarfield
                      ? AppColors.c999999
                      : (UiDarkModeHelper.isDarkMode(context)
                      ?  AppColors.c484848
                      : AppColors.c484848),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
