import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_text_formfield.dart';
import 'package:quran_app/features/learning/learning_two/widget/learning_surah.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_continue-reading.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/read_quran_juz.dart';
import 'package:quran_app/features/read_quran_surah/search_for_word/presentation/search_for_word_screen.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';





class ReadQuranSurahScreen extends StatefulWidget {
  const ReadQuranSurahScreen({super.key});

  @override
  State<ReadQuranSurahScreen> createState() => _ReadQuranSurahScreenState();
}

class _ReadQuranSurahScreenState extends State<ReadQuranSurahScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController searchController = TextEditingController();

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
          gradient:
          isStarfield ? null : UiDarkModeHelper.getCurrentGradient(context),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            // Added SingleChildScrollView
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///=================Appbar Section=============
                  CustomAppbarWidget(
                    showIcon: false,
                    text: 'Read Quran',
                    onTap: () {
                      NavigationService.navigateTo(Routes.bottomNavBar);
                    },
                  ),

                  UIHelper.verticalSpace(24.h),

                  ///=================Search Bar Section========================
                  CustomTextFormfield(
                    borderRadius: 8.r,
                    controller: searchController,
                    hintText: 'Search for a word',
                    hintStyle: TextFontStyle.textStyle14w400cB1AFAARaleway,
                    textStyle: TextStyle(
                      color: isStarfield
                          ? const Color(0xFFFEFEFE)
                          : (isLight ? Colors.black : AppColors.cF9F6F0),
                    ),
                    prefixIcon: GestureDetector(
                      onTap: () {
                        if (searchController.text.trim().isNotEmpty) {
                          debugPrint(
                              "Search icon tapped with value: ${searchController.text}");
                          Get.to(() => SearchForWordScreen());
                        } else {
                          debugPrint(
                              "Search input is empty. Navigation blocked.");
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
                              ? const Color(0xFFFEFEFE)
                              : (isLight
                              ? AppColors.c969696
                              : AppColors.cF9F6F0),
                        ),
                      ),
                    ),
                  ),
                  UIHelper.verticalSpace(16.h),

                  ///===================Reading Section===============
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
                              color: isStarfield
                                  ? Colors.blue
                                  : (isLight ? Colors.black : Colors.blue),
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

                  ///=================Surah & juz Section===============
                  Container(
                    decoration: BoxDecoration(

                      color: isLight
                          ? AppColors.cF9F6F0
                          : Colors.transparent.withOpacity(0.3),

                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 12.w),
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
                                SingleChildScrollView(
                                  child: ReadQuranSurah(),
                                ),
                                SingleChildScrollView(
                                  child: ReadQuranJuz(),
                                ),
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
        ),
      ),
    );
  }
}