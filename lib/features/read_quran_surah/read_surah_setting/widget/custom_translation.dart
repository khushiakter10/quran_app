import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/helpers/ui_helpers.dart';

class CustomTranslation extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isLight;
  final bool isStarfield;

  const CustomTranslation({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    required this.isLight,
    required this.isStarfield,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: isStarfield
                ? const Color(0xFFFEFEFE)
                : (isLight ? Colors.black : Colors.white),
          ),
        ),
        UIHelper.verticalSpace(8.h),
        Container(
          height: 48.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            border: Border.all(
              color: isLight ? AppColors.cE8E8E8 : Colors.transparent,
            ),
            color: isStarfield
                ? Colors.black.withOpacity(0.3)
                : (isLight ? Colors.white : Colors.black.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OFF',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: value
                        ? (isLight ? AppColors.c969696 : AppColors.c969696)
                        : Colors.red,
                  ),
                ),
                UIHelper.horizontalSpace(12),
                Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    value: value,
                    activeColor: Colors.white,
                    activeTrackColor: AppColors.c72BBFF,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey.shade400,
                    onChanged: onChanged,
                  ),
                ),
                UIHelper.horizontalSpace(12),
                Text(
                  'ON',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: value
                        ? (isLight ? Colors.black : AppColors.cFFFFFF)
                        : (isLight ? Colors.grey : AppColors.c969696),
                  ),
                ),
              ],
            ),
          ),
        ),
        UIHelper.verticalSpace(16.h),
      ],
    );
  }
}
