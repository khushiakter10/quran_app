

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';


class DeleteDialogBox extends StatelessWidget {
  const DeleteDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return AlertDialog(
      backgroundColor:
      isLight ? AppColors.cF9F6F0 : AppColors.c72BBFF.withOpacity(0.95),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      title: Center(child: Image.asset(AppImages.deleteworning, height: 80.h)),
      content: Text(
        'Are you sure you want to delete your account?',
        textAlign: TextAlign.center,
        style: TextFontStyle.textStyle12w400c000000Raleway.copyWith(
          fontSize: 15,
          color: AppColors.c000000,
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: TextFontStyle.textStyle18w600c000000Raleway,
          ),
        ),
        TextButton(
          onPressed: () {
            // TODO: Delete account logic (API call)
            Navigator.of(context).pop();
            NavigationService.navigateTo(Routes.loginScreen);
          },
          child: Text(
            'Yes',
            style: TextFontStyle.textStyle18w600c000000Raleway,
          ),
        ),
      ],
    );
  }
}
