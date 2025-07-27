
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/account-management/account_management/widget/custom_account.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';
class AccountManagementScreen extends StatefulWidget {
  const AccountManagementScreen({super.key});

  @override
  State<AccountManagementScreen> createState() => _AccountManagementScreenState();
}

class _AccountManagementScreenState extends State<AccountManagementScreen> {








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
                  text: 'Account Management',
                  onTap: () {
                    NavigationService.goBack;
                  },
                ),



                UIHelper.verticalSpace(30.h),

                GestureDetector(
                  onTap: (){
                    NavigationService.navigateTo(Routes.dailyQuranGoalScreen);
                  },
                  child: CustomAccount(text: 'Daily Quran Goal',
                    ),
                ),


                UIHelper.verticalSpace(8.h),

                GestureDetector(

                    onTap: (){
                      NavigationService.navigateTo(Routes.settingsScreen);
                    },
                    child: CustomAccount(text: 'Settings',)),

                UIHelper.verticalSpace(8.h),

                GestureDetector(
                    onTap: (){
                      NavigationService.navigateTo(Routes.changePasswordScreen);
                    },
                    child: CustomAccount(text: 'Change Password')),
                UIHelper.verticalSpace(8.h),

                GestureDetector(
                    onTap: (){
                      NavigationService.navigateTo(Routes.deleteAccountScreen);
                    },
                    child: CustomAccount(text: 'Delete Account')),








              ],
            ),
          ),
        ),
      ),
    );
  }
}