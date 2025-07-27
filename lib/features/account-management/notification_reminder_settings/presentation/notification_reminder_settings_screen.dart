import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/features/account-management/notification_reminder_settings/custom_reminde.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class NotificationReminderSettingsScreen extends StatefulWidget {
  const NotificationReminderSettingsScreen({super.key});

  @override
  State<NotificationReminderSettingsScreen> createState() => _NotificationReminderSettingsScreenState();
}

class _NotificationReminderSettingsScreenState extends State<NotificationReminderSettingsScreen> {
  bool isReminderEnabled = false;



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
                  text: 'Notification & Reminder Settings',
                  onTap: () {
                    NavigationService.goBack();
                  },
                ),


                UIHelper.verticalSpace(30.h),




                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isLight ? AppColors.cF9F6F0 :  Color(0xB2061420),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                    child: Row(
                      children: [
                        Text(
                          'Notification',
                          style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp,
                            color: isStarfield
                                ?   AppColors.cF9F6F0
                                : (UiDarkModeHelper.isDarkMode(context)
                                ?  AppColors.cF9F6F0
                                :  AppColors.c484848  ),)
                          ),

                         Spacer(),
                     Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: isReminderEnabled,
                        onChanged: (bool newValue) {
                          setState(() {
                            isReminderEnabled = newValue;
                          });
                        },
                        activeColor: AppColors.cFFFFFF,
                        activeTrackColor: AppColors.c72BBFF,
                        inactiveThumbColor: AppColors.cFFFFFF,
                        inactiveTrackColor: Colors.grey.shade400,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashRadius: 0,
                      ),
                    ),


                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpace(32.h),

                Text(
                  'Preferred Reminder Time',
                  style:  TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(fontSize: 18.sp,
                    color: isStarfield
                        ?   AppColors.cF9F6F0
                        : (UiDarkModeHelper.isDarkMode(context)
                        ?  AppColors.cF9F6F0
                        :  AppColors.c484848  ))),

                UIHelper.verticalSpace(8.h),


            Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                color: isLight ? AppColors.cF9F6F0 :  Color(0xB2061420),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: Column(
                  children: [
                    CustomReminde(text: 'Morning'),
                    UIHelper.verticalSpace(16.h),
                    CustomReminde(text: 'Afternoon'),
                    UIHelper.verticalSpace(16.h),
                    CustomReminde(text: 'Evening'),
                  ],
                ),
              ),
            ),
                UIHelper.verticalSpace(270.h),
                CustomPersonalizationButton(
                  text: 'Save',
                  onPressed: () {NavigationService.goBack;
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


