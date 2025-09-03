import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/common_widgets/custom_text_formfield.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_continue-reading.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/read_quran_juz.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

import '../widget/learning_surah.dart';


class LearningTwoScreen extends StatefulWidget {
  const LearningTwoScreen({super.key});

  @override
  State<LearningTwoScreen> createState() => _LearningTwoScreenState();
}

class _LearningTwoScreenState extends State<LearningTwoScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController readsearchController = TextEditingController();

  final List<String> icon = [
    'assets/icons/bookIcon.svg',
    'assets/icons/bookIcon.svg',
  ];

  final List<String> title = [
    'Continue Reading',
    'Continue Reading',
  ];

  final List<String> subtitle = [
    'Al-Fatihah',
    'Al-i-mman',
  ];

  final List<String> text = [
    'Ayat: 7',
    'Ayat: 16',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await UiDarkModeHelper.initTheme(context);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ///================= Static Search Bar ========================
              CustomTextFormfield(
                fillColor:  isLight ? AppColors.cF9F6F0 :   Color(0x6605131F),
                borderRadius: 8.r,
                controller: readsearchController,
                hintText: 'Search for a word',
                hintStyle: TextFontStyle.textStyle14w400cB1AFAARaleway.copyWith(
                    color: isStarfield
                        ? AppColors.cB1AFAA
                        : (UiDarkModeHelper.isDarkMode(context)
                        ? AppColors.cB1AFAA
                        :  AppColors.c666666)
                ),
                textStyle: TextStyle(
                  color: isStarfield
                      ? const Color(0xFFFEFEFE)
                      : (isLight ? Colors.black : AppColors.cF9F6F0),
                ),
                prefixIcon: GestureDetector(
                  onTap: () {
                    if (readsearchController.text.trim().isNotEmpty) {
                      debugPrint("Search icon tapped with value: ${readsearchController.text}");
                      // Get.to(() => SearchForWordScreen());
                    } else {
                      debugPrint("Search input is empty. Navigation blocked.");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a search term first'),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 8.w),
                    child: SvgPicture.asset(
                      AppIcons.searchIcon,
                      height: 20.h,
                      color: isStarfield
                          ? AppColors.cB1AFAA
                          : (isLight ? AppColors.c969696 : AppColors.cB1AFAA),
                    ),
                  ),
                ),
              ),
              UIHelper.verticalSpace(16.h),

              ///================ Scrollable Content =====================
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// Continue Reading Section
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(Routes.readSurahVerseByVerseScreen);
                        },
                        child: SizedBox(
                          width: double.infinity,
                          height: 90.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: icon.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomContinueReading(
                                icon: SvgPicture.asset(
                                  icon[index],
                                  height: 16.h,
                                ),
                                title: title[index],
                                subtitle: subtitle[index],
                                text: text[index],
                              );
                            },
                          ),
                        ),
                      ),
                      UIHelper.verticalSpace(16.h),


                      Container(
                        decoration: BoxDecoration(

                          color: isLight
                              ? AppColors.cF9F6F0
                              : Colors.transparent.withOpacity(0.3),

                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80.r),

                                  color: isLight
                                      ? AppColors.cE8E8E8
                                      : AppColors.c72BBFF.withOpacity(0.3),
                                ),
                                child: TabBar(
                                  controller: _tabController,
                                  padding: EdgeInsets.all(4.sp),
                                  dividerColor: Colors.transparent,
                                  labelColor: isStarfield
                                      ? Colors.black
                                      : (isLight ? Colors.black : Colors.black),
                                  unselectedLabelColor:
                                  isLight ? AppColors.c888888 : Colors.white,
                                  indicator: BoxDecoration(
                                    color: AppColors.c72BBFF,
                                    borderRadius: BorderRadius.circular(80.r),
                                  ),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  labelStyle: TextFontStyle
                                      .textStyle14w500c000000Raleway
                                      .copyWith(fontSize: 16.sp),
                                  unselectedLabelStyle:
                                  TextFontStyle.textStyle16w500B8B8B8Raleway,
                                  tabs: const [
                                    Tab(text: 'Surah'),
                                    Tab(text: 'juz'),
                                  ],
                                ),
                              ),
                              UIHelper.verticalSpace(16.h),

                              SizedBox(
                                height: 372.h,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    SingleChildScrollView(child: ReadQuranSurah()),
                                    SingleChildScrollView(child: ReadQuranJuz()),
                                  ],
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
      ),
    );
  }
}
