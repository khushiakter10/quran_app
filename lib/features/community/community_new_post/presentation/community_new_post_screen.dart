import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_text_formfield.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class CommunityNewPostScreen extends StatefulWidget {
  const CommunityNewPostScreen({super.key});

  @override
  State<CommunityNewPostScreen> createState() => _CommunityNewPostScreenState();
}

class _CommunityNewPostScreenState extends State<CommunityNewPostScreen> {
  final TextEditingController postController = TextEditingController();

  void _handlePost() {
    final text = postController.text.trim();
    if (text.isNotEmpty) {
      debugPrint("User Post: $text");
      // Optional: Clear text
      postController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Post submitted!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please write something before posting.")),
      );
    }
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
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///--============================ New Post ===========================///
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => NavigationService.goBack(),
                      child: Container(
                        padding: EdgeInsets.all(12.sp),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:  BorderSide(width: 1, color: Color(0xFF969696)),
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                        ),
                        child: SvgPicture.asset(AppIcons.arrowRightGryIcon, height: 16.h,
                          color: isLight ? AppColors.c484848 : AppColors.cFEFEFE,
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpace(30.w),

                    Expanded(
                      child: Text(
                        'New Post',
                        style: TextFontStyle.textStyle32w700cwhiteCormorantGaramond.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: isStarfield
                              ?  AppColors.cFEFEFE
                              : (UiDarkModeHelper.isDarkMode(context)
                              ? AppColors.cFEFEFE
                              : AppColors.c484848),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _handlePost,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        decoration: ShapeDecoration(
                          color: Color(0xFF72BBFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Post',
                              textAlign: TextAlign.center,
                              style: TextFontStyle.textStyle14w500c000000Raleway.copyWith(
                                color: isStarfield
                                    ?  AppColors.c000000
                                    : (UiDarkModeHelper.isDarkMode(context)
                                    ? AppColors.c000000
                                    : AppColors.cF9F6F0),
                              ),
                            ),
                            UIHelper.horizontalSpace(4.w),
                            SvgPicture.asset(AppIcons.send,
                              color: isStarfield
                                  ? AppColors.c000000
                                  : (UiDarkModeHelper.isDarkMode(context)
                                  ? AppColors.c000000
                                  : AppColors.cF9F6F0),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                ////================================ Done ===================================///

                UIHelper.verticalSpace(24.h),

                Text(
                  'This is a safe environment. Kindly avoid posting sensitive content.',
                  style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                    color: isStarfield
                        ? AppColors.cF9F6F0
                        : (UiDarkModeHelper.isDarkMode(context)
                        ? AppColors.cF9F6F0
                        : AppColors.c484848),

                  ),
                ),

                UIHelper.verticalSpace(24.h),

                //---------------------- Import Box --------------------------//
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(

                    color: isLight ? AppColors.cF9F6F0 : AppColors.c1C2330.withOpacity(0.80),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormfield(
                        textStyle: TextStyle(color: isLight ? AppColors.c000000 : AppColors.cFEFEFE),
                        controller: postController,
                        hintText: 'Write here......',
                        hintStyle: TextFontStyle.textStyle16w400c969696Raleway.copyWith(fontSize: 12.sp,
                          color: isStarfield
                              ? AppColors.c484848
                              : (UiDarkModeHelper.isDarkMode(context)
                              ? AppColors.c484848
                              : AppColors.c484848),
                        ),
                        maxline: 8,
                        filled: true,
                        fillColor:  isLight ? AppColors.cF9F6F0 :  AppColors.c1C2330.withOpacity(0.10),
                      ),
                      UIHelper.verticalSpace(8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Character limit',
                            style: TextFontStyle.textStyle16w400c969696Raleway.copyWith(fontSize: 12.sp,
                              color: isStarfield
                                  ? AppColors.cF9F6F0
                                  : (UiDarkModeHelper.isDarkMode(context)
                                  ? AppColors.c484848
                                  : AppColors.c484848),

                            ),
                          ),
                          Text(
                            '${postController.text.length}/200',
                            style: TextFontStyle.textStyle16w400c969696Raleway.copyWith(fontSize: 12.sp,
                                color: isStarfield
                                    ? AppColors.cF9F6F0
                                    : (UiDarkModeHelper.isDarkMode(context)
                                    ? AppColors.c484848
                                    : AppColors.c484848)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // -====================== Done -==================================//
              ],
            ),
          ),
        ),
      ),
    );
  }
}