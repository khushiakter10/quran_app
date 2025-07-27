import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_text_formfield.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';


class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final TextEditingController _commentController = TextEditingController();
  int? visibleCommentIndex;

  // Dummy data for 3 posts
  final List<bool> isLikedList = [false, false, false];
  final List<int> likeCounts = [900, 650, 1200];

  void toggleLike(int index) {
    setState(() {
      isLikedList[index] = !isLikedList[index];
      likeCounts[index] += isLikedList[index] ? 1 : -1;
    });
  }

  void toggleCommentView(int index) {
    setState(() {
      visibleCommentIndex = visibleCommentIndex == index ? null : index;
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
          gradient: isStarfield
              ? null
              : UiDarkModeHelper.getCurrentGradient(context),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                child: CustomAppbarWidget(
                  showIcon: false,
                  text: 'News',
                  onTap: () => NavigationService.goBack(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    final isCommentVisible = visibleCommentIndex == index;

                    return Padding(
                      padding:  EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        decoration: ShapeDecoration(
                          color: isLight ? AppColors.cF9F6F0 : Color(0xB2061420),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('15 hours ago',
                                  style: TextFontStyle
                                      .titleStyle12w400cB1AFAARaleway.copyWith(
                                      color: isStarfield
                                          ? AppColors.cB1AFAA
                                          : (UiDarkModeHelper.isDarkMode(context)
                                          ? AppColors.cB1AFAA
                                          :  AppColors.c969696)
                                  )),
                              UIHelper.verticalSpace(16.h),
                              Text(
                                'How namaz teaches discipline and helps you lead a balanced life',
                                style: TextFontStyle
                                    .textStyle20w600cFEFEFERaleway
                                    .copyWith(fontSize: 20.sp,
                                    color: isStarfield
                                        ? AppColors.cFEFEFE
                                        : (UiDarkModeHelper.isDarkMode(context)
                                        ?  AppColors.cFEFEFE
                                        :  AppColors.c060606)

                                ),
                              ),
                              UIHelper.verticalSpace(8.h),
                              Text(
                                'It is seen by many as a very spiritual exercise that helps people connect with the almighty...',
                                style: TextFontStyle
                                    .titleStyle12w400cB1AFAARaleway.copyWith(
                                    color: isStarfield
                                        ? AppColors.cB1AFAA
                                        : (UiDarkModeHelper.isDarkMode(context)
                                        ?  AppColors.cB1AFAA
                                        :  AppColors.c969696)
                                ),
                                maxLines: 2,
                              ),
                              UIHelper.verticalSpace(16.h),
                              Image.asset(AppImages.newsImages),
                              UIHelper.verticalSpace(16.h),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => toggleLike(index),
                                    child: Icon(
                                      Icons.thumb_up,
                                      color: isLikedList[index]
                                          ? Colors.blue
                                          : Colors.grey,
                                      size: 18.h,
                                    ),
                                  ),
                                  UIHelper.horizontalSpace(4.w),
                                  Text('${likeCounts[index]} Like',
                                      style: TextFontStyle
                                          .titleStyle12w400cB1AFAARaleway
                                          .copyWith(fontSize: 10.sp,
                                          color: isStarfield
                                              ? AppColors.cB1AFAA
                                              : (UiDarkModeHelper.isDarkMode(context)
                                              ?  AppColors.cB1AFAA
                                              :  AppColors.c484848)
                                      ),

                                  ),
                                   Spacer(),
                                  GestureDetector(
                                    onTap: () => toggleCommentView(index),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(AppIcons.commentIcon,
                                            height: 18.h),
                                        UIHelper.horizontalSpace(2.w),
                                        Text('23 Comment',
                                            style: TextFontStyle
                                                .titleStyle12w400cB1AFAARaleway
                                                .copyWith(fontSize: 10.sp,
                                                color: isStarfield
                                                    ? AppColors.cB1AFAA
                                                    : (UiDarkModeHelper.isDarkMode(context)
                                                    ?  AppColors.cB1AFAA
                                                    :  AppColors.c484848)
                                            ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset(AppIcons.sentIcon,
                                      height: 18.h),
                                  UIHelper.horizontalSpace(2.w),
                                  Text('Share',
                                      style: TextFontStyle
                                          .titleStyle12w400cB1AFAARaleway
                                          .copyWith(fontSize: 10.sp,
                                          color: isStarfield
                                              ? AppColors.cB1AFAA
                                              : (UiDarkModeHelper.isDarkMode(context)
                                              ?  AppColors.cB1AFAA
                                              :  AppColors.c484848))),
                                ],
                              ),
                              if (isCommentVisible) ...[
                                UIHelper.verticalSpace(24.h),
                                Container(
                                  decoration: BoxDecoration(
                                    color: isLight ? AppColors.cF0EEE7 : Color(0xB205111A),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 10.w),

                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Jesmin Khan',
                                              style: TextFontStyle
                                                  .titleStyle12w400cF9F6F0Raleway.copyWith(
                                                  color: isStarfield
                                                      ? AppColors.cF9F6F0
                                                      : (UiDarkModeHelper.isDarkMode(context)
                                                      ?  AppColors.cF9F6F0
                                                      :  AppColors.c484848))),

                                          UIHelper.horizontalSpace(6.w),
                                          Text('3h',
                                              style: TextFontStyle
                                                  .textStyle14w400c666666Raleway
                                                  .copyWith(fontSize: 10.sp,
                                                  color: isStarfield
                                                      ? AppColors.c666666
                                                      : (UiDarkModeHelper.isDarkMode(context)
                                                      ?  AppColors.c666666
                                                      :  AppColors.c484848
                                                  ))),

                                        ],
                                      ),
                                      UIHelper.verticalSpace(4.h),
                                      Text(
                                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                        style: TextFontStyle
                                            .textStyle14w400c666666Raleway
                                            .copyWith(fontSize: 12.sp,
                                          color: isStarfield
                                              ? AppColors.c666666
                                              : (UiDarkModeHelper.isDarkMode(context)
                                              ?  AppColors.c666666
                                              :  AppColors.c484848),
                                        ),
                                      ),
                                      UIHelper.verticalSpace(8.h),
                                      Row(
                                        children: [
                                          Text("Like",
                                              style: TextFontStyle
                                                  .textStyle16w500B8B8B8Raleway
                                                  .copyWith(
                                                  fontSize: 10.sp,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                color: isStarfield
                                                    ? AppColors.cB8B8B8
                                                    : (UiDarkModeHelper.isDarkMode(context)
                                                    ?  AppColors.cB8B8B8
                                                    :  AppColors.c484848),
                                              )),
                                          UIHelper.horizontalSpace(16.w),
                                          Text("Reply",
                                              style: TextFontStyle
                                                  .textStyle16w500B8B8B8Raleway
                                                  .copyWith(
                                                  fontSize: 10.sp,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                color: isStarfield
                                                    ? AppColors.cB8B8B8
                                                    : (UiDarkModeHelper.isDarkMode(context)
                                                    ?  AppColors.cB8B8B8
                                                    :  AppColors.c484848),
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                UIHelper.verticalSpace(16.h),
                                CustomTextFormfield(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      if (_commentController
                                          .text.isNotEmpty) {
                                        print(
                                            "Comment: ${_commentController.text}");
                                        _commentController.clear();
                                      }
                                    },
                                    child: Transform.scale(
                                      scale: 0.45,
                                      child: SvgPicture.asset(
                                        AppIcons.sentIcon,
                                      ),
                                    ),
                                  ),
                                 fillColor: isLight ? AppColors.cE3E0DA :  AppColors.c1A2B3B,

                                  borderColor: isLight ? Colors.transparent : AppColors.c3F678C,

                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 12.h),
                                  controller: _commentController,
                                  borderRadius: 8.r,
                                  hintText: 'Write your comment...',
                                  hintStyle: TextFontStyle
                                      .titleStyle12w400cB1AFAARaleway,
                                  textStyle:  TextStyle(
                                    color: isLight ? AppColors.c484848 :AppColors.cFFFFFF,

                                  ),
                                ),
                              ],
                            ],
                          ),
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
    );
  }
}
