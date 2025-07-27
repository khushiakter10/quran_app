import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/community/community/widget/custom_all.dart';
import 'package:quran_app/features/community/community/widget/custom_mine.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fixed Title
                    Text(
                      'Community',
                      style:
                      TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 32.sp,
                        color: isStarfield
                            ? const Color(0xFFF9F6F0)
                            : (UiDarkModeHelper.isDarkMode(context)
                            ? const Color(0xFFF9F6F0)
                            : AppColors.c484848),
                      ),
                    ),
                    UIHelper.verticalSpace(12.h),

                    // Fixed TabBar
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: isLight
                            ? AppColors.cE8E8E8
                            : const Color(0xB2061420),
                        borderRadius: BorderRadius.circular(80.r),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        padding: EdgeInsets.all(4.sp),
                        dividerColor: Colors.transparent,
                        labelColor: isLight
                            ? AppColors.c000000
                            : AppColors.cF9F6F0,
                        unselectedLabelColor:
                        isLight ? AppColors.c969696 : AppColors.cB8B8B8,
                        indicator: BoxDecoration(
                          color:
                          isLight ? AppColors.c72BBFF : AppColors.c293D50,
                          borderRadius: BorderRadius.circular(80.r),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: TextFontStyle.textStyle14w500c000000Raleway
                            .copyWith(fontSize: 16.sp),
                        unselectedLabelStyle:
                        TextFontStyle.textStyle16w500B8B8B8Raleway,
                        tabs: const [
                          Tab(text: 'All'),
                          Tab(text: 'Mine'),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpace(12.h),

                    // Scrollable Tab Content
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: CustomAll(),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: CustomMine(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Fixed Floating Button
              Positioned(
                right: 24.w,
                bottom: 24.h,
                child: Container(
                  padding: EdgeInsets.all(16.sp),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF72BBFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    shadows: [
                      BoxShadow(
                        color: const Color(0x3D000000),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      NavigationService.navigateTo(
                          Routes.communityNewPostScreen);
                    },
                    child: SvgPicture.asset(AppIcons.flotingIcon, height: 24.h),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
