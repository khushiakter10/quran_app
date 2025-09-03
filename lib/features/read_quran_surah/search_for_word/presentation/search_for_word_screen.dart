import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_text_formfield.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_verse_by_verse/presentation/read_surah-verse_by_verse_screen.dart';
import 'package:quran_app/helpers/all_routes.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class SearchForWordScreen extends StatefulWidget {
  const SearchForWordScreen({super.key});

  @override
  State<SearchForWordScreen> createState() => _SearchForWordScreenState();
}

class _SearchForWordScreenState extends State<SearchForWordScreen> {
  final TextEditingController allahController = TextEditingController();

  @override
  void dispose() {
    allahController.dispose();
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
          gradient:
          isStarfield ? null : UiDarkModeHelper.getCurrentGradient(context),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///===================Appbar Section=================
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomAppbarWidget(
                  showIcon: false,
                  text: 'Read Quran',
                  onTap: () {
                    NavigationService.goBack();
                  },
                ),
              ),
              UIHelper.verticalSpace(24.h),

              ///==================Search Section================
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomTextFormfield(
                  fillColor:  isLight ? AppColors.cF9F6F0 :   Color(0x6605131F),
                // Color(0x6605131F),
                  suffixIcon: Transform.scale(
                    scale: 0.55,
                    child: SvgPicture.asset(
                      AppIcons.crosIcon,
                      height: 18.h,
                    ),
                  ),
                  borderRadius: 8.r,
                  controller: allahController,
                  hintText: 'Allah |',
                  hintStyle: TextFontStyle.textStyle14w400cB1AFAARaleway.copyWith(
                      color: isStarfield
                          ? AppColors.cE3E0DA
                          : (UiDarkModeHelper.isDarkMode(context)
                          ? AppColors.cE3E0DA
                          :  AppColors.cB1AFAA)
                  ),
                  textStyle: TextStyle(
                    color: isStarfield
                        ? const Color(0xFFFEFEFE)
                        : (isLight ? Colors.black : AppColors.cF9F6F0),
                  ),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      if (allahController.text.trim().isNotEmpty) {
                        debugPrint(
                            "Search icon tapped with value: ${allahController.text}");
                        Get.to(() =>  ReadSurahVerseByVerseScreen());
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
                            ? const Color(0xFFFEFEFE)
                            : (isLight
                            ? AppColors.c969696
                            : AppColors.cF9F6F0),
                      ),
                    ),
                  ),
                ),
              ),
              UIHelper.verticalSpace(24.h),
//================================= done =========================//


 //=========================== ListView.builder =================================//

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'This word appears 2973 times in the Quran',
                  style: TextFontStyle.titleStyle12w400c757575Raleway.copyWith(
                    color: isLight ? Colors.black : AppColors.cF9F6F0,
                  ),
                ),
              ),
              UIHelper.verticalSpace(8.h),

              ///=================List Section===================
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isLight
                          ? AppColors.cF9F6F0
                          : AppColors.c000000.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: ListView.builder(
                      itemCount: 6,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            NavigationService.navigateTo(
                                Routes.readSurahverseScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.h, horizontal: 12.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Al-Fatihah (The Opener) - 1',
                                  style: TextFontStyle
                                      .titleStyle16w500cF9F6F0Raleway
                                      .copyWith(
                                    color: isLight
                                        ? Colors.black
                                        : AppColors.cF9F6F0,
                                  ),
                                ),
                                UIHelper.verticalSpace(4.h),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'In the name of ',
                                        style: TextFontStyle
                                            .titleStyle12w400c757575Raleway
                                            .copyWith(
                                          color: isLight
                                              ? Colors.black
                                              : AppColors.cF9F6F0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Allah',
                                        style: TextFontStyle
                                            .textStyle12w400c72BBFFRaleway
                                            .copyWith(
                                          color: AppColors.c72BBFF,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                        ', the Entirely Merciful, the Especially Merciful',
                                        style: TextFontStyle
                                            .titleStyle12w400c757575Raleway
                                            .copyWith(
                                          color: isLight
                                              ? Colors.black
                                              : AppColors.cF9F6F0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                UIHelper.verticalSpace(16.h),
                                Divider(
                                  color: isLight
                                      ? AppColors.c72BBFF
                                      : AppColors.c3F678C,
                                  thickness: 1,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
