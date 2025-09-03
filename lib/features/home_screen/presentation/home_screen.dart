import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/home_screen/widget/custom_all_feature.dart';
import 'package:quran_app/features/home_screen/widget/custom_ashar_widget.dart';
import 'package:quran_app/features/home_screen/widget/custom_daily_goal.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await UiDarkModeHelper.initTheme(context);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UiDarkModeController>(
        builder: (context, controller, child) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [

            if (isLight) ...[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 140.h,
                child: Image.asset(
                  AppImages.homebluimage,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              Positioned.fill(
                top: 130.h,
                child: Container(
                  color: AppColors.cFEFEFE,
                ),
              ),
            ] else if (currentTheme == UiDarkModeHelper.darkTheme) ...[

              Container(
                color: AppColors.c1C3042,
              ),
            ] else ...[

              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.homebacroundimage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],

            SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ///===============Appbar Section================
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Assalamualaikum, Sayeada',
                              style: TextFontStyle.textStyle20w600cFEFEFERaleway
                                  .copyWith(
                                color: isStarfield
                                    ?  Color(0xFFFEFEFE)
                                    : (isLight ? Colors.black : Colors.white),
                              ),
                            ),
                            UIHelper.verticalSpace(4.h),
                            Row(
                              children: [
                                SvgPicture.asset(AppIcons.locationicon,
                                    height: 16.h),
                                UIHelper.horizontalSpace(4.w),
                                Text(
                                  'Malibagh, Dhaka',
                                  style: TextFontStyle.textStyle12w500FEFEFERaleway
                                      .copyWith(
                                    color: isStarfield
                                        ? const Color(0xFFFEFEFE)
                                        : (isLight ? Colors.black : Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){NavigationService.navigateTo(Routes.notificationReminderSettingsScreen);},
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.cFFFFFF,
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            padding:
                            EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.notification,
                                  height: 24.h,
                                ),
                                Positioned(
                                  top: 2,
                                  right: 1,
                                  child: Container(
                                    width: 8.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.cFF0303,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.cFFFFFF,
                                        width: 1.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(24.h),
                    ///=============Azan Section=====
                    CustomAsharWidget(text: 'Ashar 15:09 WIB'),
                    UIHelper.verticalSpace(24.h),
                    ///==================All Feature Section=================
                    ///
                    Text(
                      'All Feature',
                      style: TextStyle(
                        color: isStarfield
                            ? const Color(0xFFFEFEFE)
                            : (isLight ? Colors.black : Colors.white),
                        fontSize: 18,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                        height: 1.11,
                        letterSpacing: 0.18,
                      ),
                    ),
                    UIHelper.verticalSpace(16.h),


                    CustomAllFeature(),








                    UIHelper.verticalSpace(24.h),
                    Text(
                      'Your Daily Goal',
                      style: TextStyle(
                        color: isStarfield
                            ? const Color(0xFFFEFEFE)
                            : (isLight ? Colors.black : Colors.white),
                        fontSize: 18.sp,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                        height: 1.11.h,
                        letterSpacing: 0.18,
                      ),
                    ),
                    UIHelper.verticalSpace(16.h),

                    CustomDailyGoal(title: 'Al-Baqara'),




                    UIHelper.verticalSpace(24.h),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.koranbacrounImage),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ayat of the day',
                                style: TextStyle(
                                  color: isLight ? Colors.black : Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w600,
                                  height: 1.11,
                                  letterSpacing: 0.18,
                                ),
                              ),
                              UIHelper.verticalSpace(16.h),
                              Text(
                                'اللَّهُ نُورُ السَّمَاوَاتِ وَالْأَرْضِ',
                                style: TextFontStyle.textStyle12w400c484848Raleway
                                    .copyWith(fontSize: 14.sp,
                                  fontFamily: controller.getFontFamilyByIndex(
                                      controller.selectedLanguageIndex),
                                ),
                              ),
                              UIHelper.verticalSpace(4.h),
                              Text(
                                'Allah is the Light of the\n heavens and the earth.',
                                style: TextFontStyle.textStyle12w400c484848Raleway,
                              ),
                              UIHelper.verticalSpace(4.h),
                              Text(
                                '[Surah An-Nur 24:35]',
                                style: TextFontStyle.textStyle18w600c000000Raleway
                                    .copyWith(fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace(24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'News',
                          style: TextStyle(
                            color: isStarfield
                                ? const Color(0xFFFEFEFE)
                                : (isLight ? Colors.black : Colors.white),
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w600,
                            height: 1.11,
                            letterSpacing: 0.18,
                          ),
                        ),

                        GestureDetector(
                          onTap: (){NavigationService.navigateTo(Routes.newsScreen);},
                          child: Text(
                            'See All',
                            style: TextStyle(
                              color:  Color(0xFF72BBFF),
                              fontSize: 12,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w400,
                              height: 1.67,
                              letterSpacing: 0.12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(16.h),
                    Container(
                      height: 218.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.newsImage),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.c3F678C, width: 1),
                      ),
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'How namaz teaches discipline and helps you lead a balanced life',
                              style: TextStyle(
                                color: isStarfield
                                    ? const Color(0xFFFEFEFE)
                                    : (isLight ? Colors.white : Colors.white),
                                fontSize: 24,
                                fontFamily: 'Cormorant Garamond',
                                fontWeight: FontWeight.w600,
                                height: 1.09,
                                letterSpacing: -0.48,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'It is seen by many as a very spiritual exercise that helps people connect with the almighty. In addition to its religiou',
                              style: TextStyle(
                                color: const Color(0xFFB1AFAA),
                                fontSize: 12,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  });
}}




