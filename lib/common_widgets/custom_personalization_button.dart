import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';

class CustomPersonalizationButton extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;


  const CustomPersonalizationButton({
    super.key,
    required this.text,
    this.onPressed,

    this.textStyle, this.contentPadding,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color:  AppColors.c72BBFF,
          borderRadius: BorderRadius.circular(80.r),
        ),
        child: Padding(
          padding: contentPadding??  EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
          child: Center(child: Text(text,style: TextFontStyle.textStyle16w600c060606Raleway)),
        ),
      ),
    );
  }
}









//contentPadding: widget.contentPadding ??