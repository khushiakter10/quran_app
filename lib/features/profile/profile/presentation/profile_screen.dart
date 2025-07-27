import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/profile/profile/widget/custom_achievement.dart';
import 'package:quran_app/features/profile/profile/widget/dilog_box.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;
    final isDark = currentTheme == UiDarkModeHelper.darkTheme;


    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [

            if (!isStarfield) ...[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 130.h,
                child: Image.asset(
                  AppImages.profilebacroundimage,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              Positioned.fill(
                top: 130.h,
                child: Container(
                  color: isDark ? AppColors.c1B2E3E : AppColors.cFEFEFE,
                ),
              ),
            ] else ...[
              // Dark mode with background image
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.profilebacroundimage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],


            SingleChildScrollView(
              padding:  EdgeInsets.symmetric(horizontal: 24.w),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 60.r,
                            backgroundImage: AssetImage(AppImages.editprofile),
                          ),

                          Positioned(
                            bottom: -11,
                            right: 5,
                            child: GestureDetector(
                              onTap: (){
                                NavigationService.navigateTo(Routes.editProfileScreen);
                              },
                              child: Container(
                                decoration: ShapeDecoration(
                                  color:  Color(0xFF72BBFF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(AppIcons.editcopy,height: 16.h),
                                      UIHelper.horizontalSpace(8.w),
                                      Text(
                                        'Edit Profile',style: TextFontStyle.textStyle12w500primaryColor2Raleway.copyWith(fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    UIHelper.verticalSpace(10.h),
                    Text(
                        'Khushbu Rahman Khushi',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.titleStyle24w600cF9F6F0CormorantGaramond.copyWith(
                          color: isStarfield
                              ? AppColors.cF9F6F0
                              : (UiDarkModeHelper.isDarkMode(context)
                              ?  AppColors.cFFFFFF
                              : AppColors.c484848),
                        )
                    ),
                    Text(
                        'Member Since: 20 Mar 2024',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(

                          color: isStarfield
                              ? AppColors.cF9F6F0
                              : (UiDarkModeHelper.isDarkMode(context)
                              ?  AppColors.cFFFFFF
                              : AppColors.c484848),
                        )
                    ),
                    UIHelper.verticalSpace(10.h),

                    GestureDetector(
                        onTap: (){
                          NavigationService.navigateTo(Routes.achivementScreen);
                        },
                        child: CustomAchievement(text: 'Achievement', iconPath: AppIcons.achievementIcon, arrowIconPath: AppIcons.arrwIcon)),
                    UIHelper.verticalSpace(7.h),

                    GestureDetector(
                        onTap: (){
                          NavigationService.navigateTo(Routes.leaderboardScreen);
                        },
                        child: CustomAchievement(text: 'Leaderboard', iconPath: AppIcons.addprofileuser, arrowIconPath: AppIcons.arrwIcon)),
                    UIHelper.verticalSpace(6.h),



                    CustomAchievement(text: 'Bookmark', iconPath: AppIcons.profilebookmark, arrowIconPath: AppIcons.arrwIcon),
                    UIHelper.verticalSpace(6.h),

                    GestureDetector(
                        onTap: (){
                          NavigationService.navigateTo(Routes.accountManagementScreen);
                        },
                        child: CustomAchievement(text: 'Account Management', iconPath: AppIcons.profilesetting, arrowIconPath: AppIcons.arrwIcon)),
                    UIHelper.verticalSpace(6.h),



                    GestureDetector(
                      onTap: (){NavigationService.navigateTo(Routes.notificationReminderSettingsScreen);},

                        child: CustomAchievement(text: 'Notification & Reminder Settings', iconPath: AppIcons.notificationremender, arrowIconPath: AppIcons.arrwIcon)),


                    UIHelper.verticalSpace(6.h),

                    GestureDetector(
                        onTap: (){NavigationService.navigateTo(Routes.additionalCustomizationSupportScreen);},
                        child: CustomAchievement(text: 'Additional Customization & Support', iconPath: AppIcons.aditonalIcon, arrowIconPath: AppIcons.arrwIcon)),
                    UIHelper.verticalSpace(6.h),

                    DilogBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
