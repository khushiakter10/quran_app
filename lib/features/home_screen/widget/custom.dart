// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:omermjamal/assets_helper/app_colors.dart';
// import 'package:omermjamal/assets_helper/app_fonts.dart';
// import 'package:omermjamal/assets_helper/app_image.dart';
// import 'package:omermjamal/helpers/all_routes.dart';
// import 'package:omermjamal/helpers/navigation_service.dart';
// import 'package:omermjamal/helpers/ui_dark_mode_helper.dart';
// import 'package:omermjamal/helpers/ui_dark_mood_controller.dart';
// import 'package:omermjamal/helpers/ui_helpers.dart';
// import 'package:provider/provider.dart';
//
// class CustomAllFeature extends StatelessWidget {
//   final String title;
//   final String subtitlr;
//
//   const CustomAllFeature({
//     super.key,
//     required this.title,
//     required this.subtitlr,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<UiDarkModeController>(
//       builder: (context, controller, child) {
//         final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
//         final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
//         final isLight = currentTheme == UiDarkModeHelper.lightTheme;
//
//
//
//         return Column(
//           children: [
//             Row(
//               children: [
//
//                 GestureDetector(
//                   onTap: () {
//                     NavigationService.navigateTo(Routes.readQuranSurahScreen);
//                   },
//
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: isStarfield
//                           ? const Color(0xFF1E2B3B)
//                           : (isLight ? AppColors.cF9F6F0 : const Color(0x66061420)),
//                       borderRadius: BorderRadius.circular(8.r),
//                       border: Border.all(
//                         color: isStarfield
//                             ? const Color(0xFF3F678C)
//                             : (isLight ? AppColors.cF9F6F0 : const Color(0xFF304F6B)),
//                         width: 1.w,
//                       ),
//                     ),
//
//                     child: Padding(
//                       padding:  EdgeInsets.symmetric(vertical: 24.h,horizontal: 24.w),
//                       child: Column(
//                         children: [
//                           Image.asset(AppImages.koranImage, height: 36.h),
//                           Text(
//                             title,
//                             textAlign: TextAlign.center,
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
//                               fontSize: 14.sp,
//                               color: isStarfield
//                                   ? const Color(0xFFFEFEFE)
//                                   : (isLight ? Colors.black : const Color(0xFFF9F6F0)),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 UIHelper.horizontalSpace(5.w),
//
//
//                 GestureDetector(
//
//                   onTap: () {
//                     NavigationService.navigateTo(Routes.quranAcademyScreen);
//                   },
//
//                   child: Container(
//                     decoration: BoxDecoration(
//
//
//                       color: isStarfield
//                           ? const Color(0xFF1E2B3B)
//                           : (isLight ? AppColors.cF9F6F0 : const Color(0x66061420)),
//                       borderRadius: BorderRadius.circular(8.r),
//                       border: Border.all(
//                         color: isStarfield
//                             ? const Color(0xFF3F678C)
//                             : (isLight ? AppColors.cF9F6F0 : const Color(0xFF304F6B)),
//                         width: 1.w,
//                       ),
//
//                     ),
//
//                     child: Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
//                       child: Column(
//                         children: [
//                           Image.asset(AppImages.koranAcademy, height: 33.h),
//                           UIHelper.verticalSpace(4.h),
//
//                           Text(
//                             subtitlr,
//                             textAlign: TextAlign.center,
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
//                               fontSize: 14.sp,
//                               color: isStarfield
//                                   ? const Color(0xFFFEFEFE)
//                                   : (isLight ? Colors.black : const Color(0xFFF9F6F0)),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//             UIHelper.verticalSpace(5.h),
//
//             Row(
//               children: [
//                 GestureDetector(
//                   onTap: (){NavigationService.navigateTo(Routes.newsScreen);},
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 9.h,horizontal: 16.w ),
//                     decoration: BoxDecoration(
//
//
//                       color: isStarfield
//                           ? const Color(0xFF1E2B3B)
//                           : (isLight ? AppColors.cF9F6F0 : const Color(0x66061420)),
//
//                       borderRadius: BorderRadius.circular(8.r),
//
//                       border: Border.all(
//                         color: isStarfield
//                             ? const Color(0xFF3F678C)
//                             : (isLight ? AppColors.cF9F6F0 : const Color(0xFF304F6B)),
//                         width: 1.w,
//                       ),
//
//                     ),
//
//                     child: Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
//                       child: Column(
//                         children: [
//                           Image.asset(AppImages.news, height: 36.h),
//                           UIHelper.verticalSpace(4.h),
//
//                           Text(
//                             'News',
//                             textAlign: TextAlign.center,
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
//                               fontSize: 14.sp,
//                               color: isStarfield
//                                   ? const Color(0xFFFEFEFE)
//                                   : (isLight ? Colors.black : const Color(0xFFF9F6F0)),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//
//
//
//               ],
//             )
//
//           ],
//         );
//
//
//
//
//
//
//
//
//       },
//     );
//   }
// }
