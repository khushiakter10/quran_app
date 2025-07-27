import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';


class CustomContainerWidget extends StatelessWidget {
  final Color? color;
  final Color? grayColor;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadiusGeometry;
  const CustomContainerWidget({
    super.key,
    this.color,
    this.grayColor,
    this.borderRadiusGeometry,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 21.w,
      height: height ?? 5.h,
      decoration: BoxDecoration(
          color: color ?? AppColors.c72BBFF,
          borderRadius: borderRadiusGeometry ?? BorderRadius.circular(26.r)),
    );
  }
}


















