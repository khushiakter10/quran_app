import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/leaderboard/leaderboard/global.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen>
    with TickerProviderStateMixin {


  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbarWidget(
                  showIcon: false,
                  text: 'Leaderboard',
                  onTap: () {
                    NavigationService.goBack();
                  },
                ),


              UIHelper.verticalSpace(24.h),

                Container(
                  width: double.infinity,
                  padding:  EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                    color: isLight ? AppColors.cE8E8E8 :  Color(0xB2061420),
                    borderRadius: BorderRadius.circular(80.r),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    dividerColor: Colors.transparent,
                    labelColor:    isLight ? AppColors.c000000:   AppColors.cF9F6F0 ,
                    unselectedLabelColor:  isLight ? AppColors.c666666:  AppColors.cB8B8B8,

                    indicator: BoxDecoration(
                      color:  isLight ? AppColors.c72BBFF:   AppColors.c283D50 ,
                      borderRadius: BorderRadius.circular(80.r),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle:  TextFontStyle.titleStyle12w400cF9F6F0Raleway
                        .copyWith(fontSize: 16.sp),

                    unselectedLabelStyle:
                    TextFontStyle.textStyle16w500B8B8B8Raleway,
                    tabs: const [
                      Tab(text: 'Global'),
                      Tab(text: 'Country'),
                      Tab(text: 'City'),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(12.h),

                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      Global(),
                      Global(),
                      Global(),
                    ],
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

