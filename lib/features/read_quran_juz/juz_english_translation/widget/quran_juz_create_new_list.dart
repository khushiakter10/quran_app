
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/common_widgets/custom_text_formfield.dart';
import 'package:quran_app/features/read_quran_juz/juz_english_translation/widget/quran_juz_useful.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';



class CreatequranJuzCreateNewList extends StatefulWidget {

  const CreatequranJuzCreateNewList({super.key, });

  @override
  State<CreatequranJuzCreateNewList> createState() => _CreatequranJuzCreateNewListState();
}

class _CreatequranJuzCreateNewListState extends State<CreatequranJuzCreateNewList> {
  final TextEditingController usefulController = TextEditingController();

  @override
  void dispose() {
    usefulController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Row(
      children: [
        GestureDetector(
          onTap: () {


            showModalBottomSheet(
              context: context,
              backgroundColor: isLight ? AppColors.cFFFFFF : AppColors.bottomshetColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              isScrollControlled: true,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 24.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Create New List',
                          textAlign: TextAlign.center,
                          style: TextFontStyle.textStyle16w400c969696Raleway.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: isStarfield ? Color(0xFFF9F6F0) : (isLight ? AppColors.c000000 : AppColors.cFFFFFF),
                          ),
                        ),

                        UIHelper.verticalSpace(54.h),

                        CustomTextFormfield(
                          fillColor: isStarfield
                              ? AppColors.c1E2F3F
                              : (isLight ? AppColors.cE8E8E8 : Colors.black.withOpacity(0.3)),
                          borderColor: isStarfield
                              ? Color(0xFF3F678C)
                              : (isLight ? Colors.transparent : AppColors.c3F678C),
                          borderRadius: 8.r,
                          contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
                          controller: usefulController,
                          hintText: 'Useful',
                          textStyle: TextFontStyle.textStyle18w500cF9F6F0Raleway.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: isStarfield ? Color(0xFFF9F6F0) : (isLight ? AppColors.c000000 : AppColors.cFFFFFF),
                          ),
                          hintStyle: TextFontStyle.textStyle14w400cB1AFAARaleway,
                        ),

                        UIHelper.verticalSpace(80.h),

                        QuranJuzUseful(),
                      ],
                    ),
                  ),
                );
              },
            );

          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color:  Color(0xFF72BBFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.r),
              ),
            ),
            child: SvgPicture.asset(AppIcons.addblakIcon, height: 24.h,
              color: isLight
                  ? AppColors.cFFFFFF
                  :  AppColors.c000000,


            ),
          ),
        ),
        UIHelper.horizontalSpace(8.w),

        Text(
            'Create new list',
            style:  TextFontStyle.textStyle16w400c969696Raleway.copyWith(fontWeight: FontWeight.w500,fontSize: 18.sp,

              color: isLight
                  ? AppColors.c000000
                  : AppColors.c969696,

            ))
      ],
    );
  }
}



