import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/achivement/widget/custom_total_point.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class AchivementScreen extends StatefulWidget {
  const AchivementScreen({super.key});

  @override
  State<AchivementScreen> createState() => _AchivementScreenState();
}

class _AchivementScreenState extends State<AchivementScreen> {

  final List<Map<String, dynamic>> levels = [
    {
      "level": "Level 01",
      "highest": 100,
      "current": 10,
      "icon": AppIcons.levelIcons
    },
    {
      "level": "Level 02",
      "highest": 200,
      "current": 40,
      "icon": AppIcons.levelIcons
    },
    {
      "level": "Level 03",
      "highest": 300,
      "current": 90,
      "icon": AppIcons.levelIcons
    },
    {
      "level": "Level 04",
      "highest": 500,
      "current": 250,
      "icon": AppIcons.levelIcons
    },
    {
      "level": "Level 05",
      "highest": 150,
      "current": 75,
      "icon": AppIcons.levelIcons
    },
    {
      "level": "Level 06",
      "highest": 300,
      "current": 300,
      "icon": AppIcons.levelIcons
    },
    {
      "level": "Level 07",
      "highest": 800,
      "current": 400,
      "icon": AppIcons.levelIcons
    },
    {
      "level": "Level 08",
      "highest": 1000,
      "current": 100,
      "icon": AppIcons.levelIcons
    },
    {
      "level": "Level 09",
      "highest": 100,
      "current": 10,
      "icon": AppIcons.levelIcons
    },
  ];




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
          gradient: isStarfield ? null : UiDarkModeHelper.getCurrentGradient(context),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// ========== Fixed Header ==========
                CustomAppbarWidget(
                  showIcon: false,
                  text: 'Achievement',
                  onTap: () {
                    NavigationService.goBack();
                  },
                ),

                UIHelper.verticalSpace(30.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTotalPoint(title: '300', subtitle: 'Total points'),
                    ),
                    UIHelper.horizontalSpace(8.w),
                    Expanded(
                      child: CustomTotalPoint(title: '100', subtitle: 'This week points'),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(30.h),

                /// ========== Scrollable ListView ==========
                Expanded(
                  child: ListView.separated(
                    itemCount: levels.length,
                    separatorBuilder: (_, __) => UIHelper.verticalSpace(16.h),
                    itemBuilder: (context, index) {
                      double progress = (levels[index]["current"] / levels[index]["highest"]).clamp(0.0, 1.0);

                      return Container(
                        decoration: ShapeDecoration(
                          color: isLight ? AppColors.cF9F6F0 : Color(0xB2061420),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                levels[index]["icon"],
                                height: 40.h,
                              ),
                              UIHelper.horizontalSpace(12.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      levels[index]["level"],
                                      style: TextFontStyle.titleStyle16w500cF9F6F0Raleway.copyWith(
                                        fontSize: 18.sp,
                                        color: isStarfield
                                            ? AppColors.cF9F6F0
                                            : AppColors.c484848,
                                      ),
                                    ),
                                    UIHelper.verticalSpace(4.h),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            width: 180.w,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(40.r),
                                              child: LinearProgressIndicator(
                                                value: progress,
                                                minHeight: 6.h,
                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                    AppColors.c72BBFF),
                                                backgroundColor:
                                                isLight ? AppColors.cE8E8E8 : AppColors.c484848,
                                              ),
                                            ),
                                          ),
                                        ),
                                        UIHelper.horizontalSpace(12.w),
                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 11),
                                          decoration: BoxDecoration(
                                            color: isLight ? AppColors.cE8E8E8 : AppColors.c484848,
                                            borderRadius: BorderRadius.circular(40.r),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "${levels[index]["highest"]}",
                                              style: TextFontStyle.titleStyle8w500cF9F6F0NeutrifPro
                                                  .copyWith(

                                                   color: isStarfield
                                                    ? AppColors.cF9F6F0
                                                    : (UiDarkModeHelper.isDarkMode(context)
                                                    ? AppColors.cF9F6F0
                                                    : AppColors.c484848),


                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
