import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/features/account-management/delete_account/widget/delete_diolog_box.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart' show UiDarkModeHelper;
import 'package:quran_app/helpers/ui_helpers.dart';


class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbarWidget(
                  showIcon: false,
                  text: 'Delete Account',
                  onTap: () {
                    NavigationService.goBack();
                  },
                ),
                UIHelper.verticalSpace(30.h),
                Image.asset(AppImages.deleteImage, height: 100.h),
                UIHelper.verticalSpace(24.h),
                Text(
                  'Are you sure?',
                  style: TextFontStyle.titleStyle16w500cF9F6F0Raleway.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    color: isStarfield
                        ? AppColors.cF9F6F0
                        : AppColors.c484848,
                  ),
                ),
                UIHelper.verticalSpace(8.h),
                Text(
                  'We’re really sorry to see you go. Are you sure you want to delete your account? Once you confirm, your data will be gone.',
                  style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                    fontSize: 14.sp,
                    color: isStarfield
                        ? AppColors.cF9F6F0
                        : AppColors.c484848,
                  ),
                ),
                UIHelper.verticalSpace(350.h),
                CustomPersonalizationButton(
                  text: 'Delete Account',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) =>  DeleteDialogBox(),
                    );
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
