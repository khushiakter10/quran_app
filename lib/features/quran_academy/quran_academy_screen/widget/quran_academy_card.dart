import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';

class QuranAcademyCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isStarfield;
  final bool isLight;

  const QuranAcademyCard({
    super.key,
    required this.title,
    required this.iconPath,
    required this.isStarfield,
    required this.isLight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 129.h,
      width: 149.5.w,

      decoration: BoxDecoration(
        color: isLight ? AppColors.cF9F6F0 : AppColors.c3D668C,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isLight ? Colors.transparent : Color(0xFF8EC9FF),
          width: isLight ? 0 : 1,
        ),
      ),



      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath, height: 54.h),
         SizedBox(height: 16.h),
          Text(
            title,
            style: TextFontStyle.textStyle16w600c060606Raleway.copyWith(
              color: isStarfield
                  ? const Color(0xFFFEFEFE)
                  : (isLight ? Colors.black : AppColors.cFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}
