import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/quran_academy/quran_in_english/quran_in_english_list/widget/quran_english_list_card.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';





class QuranInEnglishListScreen extends StatefulWidget {
  const QuranInEnglishListScreen({super.key});

  @override
  State<QuranInEnglishListScreen> createState() => _QuranAcademyScreenState();
}

class _QuranAcademyScreenState extends State<QuranInEnglishListScreen> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: isStarfield
              ? DecorationImage(
            image: AssetImage(AppImages.backroundimage),
            fit: BoxFit.cover,
          )
              : null,
          gradient: isStarfield ? null : UiDarkModeHelper.getCurrentGradient(context),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                ///==================Appbar Section=================
                CustomAppbarWidget(
                  showIcon: false,
                  text: 'Quran in English',
                  onTap: () {
                    NavigationService.goBack();
                  },
                ),

                UIHelper.verticalSpace(24.h),

                ///=============== Scrollable List Section ===============
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isLight
                          ? AppColors.cF9F6F0
                          : Colors.transparent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(12),
                      ///============Card===========
                      child: QuranEnglishListCard(
                      ),
                    ),
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

