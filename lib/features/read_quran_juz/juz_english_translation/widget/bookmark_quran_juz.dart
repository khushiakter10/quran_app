import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/features/read_quran_juz/juz_english_translation/widget/quran_juz_create_new_list.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_word_for_word/widget/custom_button_cancel.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class BookmarkQuranJuz extends StatefulWidget {
  final String title;
  const BookmarkQuranJuz({super.key, required this.title});

  @override
  State<BookmarkQuranJuz> createState() => _BookmarkQuranJuzState();
}

class _BookmarkQuranJuzState extends State<BookmarkQuranJuz> {
  String? selectedListName; // to track list selection
  String? errorMessage;

  void _onListSelected(String listName) {
    setState(() {
      selectedListName = listName;
      errorMessage = null;
    });
  }

  void _onDonePressed() {
    if (selectedListName == null || selectedListName!.isEmpty) {
      setState(() {
        errorMessage = "Please create a new list or select an existing list.";
      });
    } else {
      NavigationService.goBack();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Container(
      height: 332.h,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UIHelper.verticalSpace(16.h),

            /// Title
            Text(
              widget.title,
              style: TextFontStyle.textStyle18w500cF9F6F0Raleway.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24.w,
                color: isLight ? AppColors.c000000 : AppColors.cF9F6F0,
              ),
            ),

            UIHelper.verticalSpace(24.h),

            /// Create New List with callback
            CreatequranJuzCreateNewList(),


            UIHelper.verticalSpace(16.h),

            Text(
              'Create a new list to save an ayat.',
              style: TextFontStyle.textStyle16w400c969696Raleway.copyWith(
                color: isLight ? AppColors.c484848 : AppColors.c969696,
              ),
            ),

            /// Error Message
            if (errorMessage != null)
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Text(
                  errorMessage!,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.sp,
                  ),
                ),
              ),

            UIHelper.verticalSpace(40.h),

            /// Cancel / Done Buttons
            ///
            ///
            CustomButtonCancel(
              onFirstTap: () {
                NavigationService.goBack();
              },
              onSecondTap: _onDonePressed,
              title: 'Cancel',
              subtitle: 'Done',
            ),
          ],
        ),
      ),
    );
  }
}
