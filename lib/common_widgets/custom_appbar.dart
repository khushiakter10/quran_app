

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.subTitle,
    required this.title,
    this.onCallBack,
    this.leadingVisible = true ,
    this.actions,
    this.centerTitle = true,
    this.backgroundColor,
    this.bottom,
    this.elevation = 4.0,
    this.shadowColor,
  });

  final String title;
  final VoidCallback? onCallBack;
  final bool leadingVisible;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final double elevation;
  final Color? shadowColor;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.cwhite,
            boxShadow: [
              BoxShadow(
                color: shadowColor ?? Colors.black.withOpacity(0.04),
                blurRadius: 6,
                spreadRadius: 1,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: leadingVisible,
            leading: leadingVisible == false
                ? null
                : Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: InkWell(
                      onTap: onCallBack ?? () => Get.back(),
                      child: const Icon(Icons.arrow_back_outlined),
                    ),
                  ),
            backgroundColor: Colors.transparent,
            titleSpacing: 2.w,
            centerTitle: centerTitle,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style:
                      TextFontStyle.textStyle20w600c000A15ColorJosefinSans,
                ),
                UIHelper.verticalSpace(4.h),
                Text(
                  subTitle ?? '',
                  style: TextFontStyle
                      .textStyle14w500SecondaryColorJosefinSans
                      .copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor2,
                  ),
                ),
              ],
            ),
            actions: actions,
            bottom: bottom,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        bottom == null
            ? kToolbarHeight
            : kToolbarHeight + bottom!.preferredSize.height,
      );
}
