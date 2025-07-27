// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:omermjamal/assets_helper/app_colors.dart';
// import 'package:omermjamal/assets_helper/app_fonts.dart';
// import 'package:omermjamal/assets_helper/app_image.dart';
// import 'package:omermjamal/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
// import 'package:omermjamal/helpers/all_routes.dart';
// import 'package:omermjamal/helpers/navigation_service.dart';
// import 'package:omermjamal/helpers/ui_helpers.dart';
// import 'package:omermjamal/helpers/ui_dark_mode_helper.dart';
//
// class AlphabetScreen extends StatefulWidget {
//   const AlphabetScreen({super.key});
//
//   @override
//   State<AlphabetScreen> createState() => _AlphabetScreenState();
// }
//
// class _AlphabetScreenState extends State<AlphabetScreen> {
//
//
//   final List<String> image = [
//     'assets/images/bookImage.png',
//     'assets/images/bookImage.png',
//     'assets/images/bookImage.png',
//     'assets/images/bookImage.png',
//     'assets/images/bookImage.png',
//     'assets/images/bookImage.png',
//   ];
//
//   final List<String> title = [
//     'Letter',
//     '2-Letter',
//     '3-Letter',
//     'Tanween',
//     'Abbreviated Elongations',
//     'Sukun',
//   ];
//
//   List<double> progressList = List.generate(6, (index) => 0.02);
//   List<bool> isIncreasingList = List.generate(6, (index) => true);
//
//   void toggleProgress(int index) {
//     setState(() {
//       if (isIncreasingList[index]) {
//         progressList[index] += 0.05;
//         if (progressList[index] >= 1.0) {
//           progressList[index] = 1.0;
//           isIncreasingList[index] = false;
//         }
//       } else {
//         progressList[index] -= 0.05;
//         if (progressList[index] <= 0.0) {
//           progressList[index] = 0.0;
//           isIncreasingList[index] = true;
//         }
//       }
//     });
//   }
//
//
//   final int trackedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//
//     final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
//     final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
//     final isLight = currentTheme == UiDarkModeHelper.lightTheme;
//
//
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//
//
//
//         // decoration: BoxDecoration(
//         //   image: isStarfield
//         //       ? DecorationImage(
//         //     image: AssetImage(AppImages.learntajweedbacroundImage),
//         //     fit: BoxFit.cover,
//         //   )
//         //       : isLight
//         //       ? DecorationImage(
//         //     image: AssetImage(AppImages.defoldImage),
//         //     fit: BoxFit.cover,
//         //   )
//         //       : DecorationImage(
//         //     image: AssetImage(AppImages.learntajweedbacroundImage),
//         //     fit: BoxFit.cover,
//         //   ),
//         //   gradient: isStarfield || isLight
//         //       ? null
//         //       : UiDarkModeHelper.getCurrentGradient(context),
//         // ),
//
//
//
//
//
//
//
//
//
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomAppbarWidget(
//                   showIcon: false,
//                   text: '',
//                   onTap: () {
//                     NavigationService.goBack();
//                   },
//                 ),
//                 UIHelper.verticalSpace(13.h),
//
//                 Text(
//                     'Alphabet',
//                     style:  TextFontStyle.textStyle20w600cFEFEFERaleway.copyWith(
//                       fontSize: 32.sp,fontWeight: FontWeight.w700,
//                       color: isStarfield
//                           ? const Color(0xFFFEFEFE)
//                           : (UiDarkModeHelper.isDarkMode(context)
//                           ? AppColors.cFEFEFE
//                           :  AppColors.c484848),
//
//                     )
//                 ),
//                 UIHelper.verticalSpace(8.h),
//
//                 Text(
//                     '9 Chapters',
//                     style:  TextFontStyle.textStyle20w600cFEFEFERaleway.copyWith(
//                       fontSize: 16.sp,fontWeight: FontWeight.w400,
//                       color: isStarfield
//                           ? const Color(0xFFFEFEFE)
//                           : (UiDarkModeHelper.isDarkMode(context)
//                           ? AppColors.cFEFEFE
//                           :  AppColors.c484848),
//
//                     )
//                 ),
//                 UIHelper.verticalSpace(8.h),
//
//
//
//                 ///======================== Progress =============================///
//
//                 SizedBox(
//                   width: 225.h,
//                   child: GestureDetector(
//                     onTap: () => toggleProgress(trackedIndex),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(40.r),
//                       child: LinearProgressIndicator(
//                           value: progressList[trackedIndex],
//                           minHeight: 6.h,
//                           valueColor: AlwaysStoppedAnimation<Color>(
//
//                               isLight
//                                   ? AppColors.cA1D1FF
//                                   : AppColors.cA1D1FF
//
//                           ),
//                           backgroundColor:   isLight
//                               ?  Color(0xFF5185B5)
//                               : Color(0xFF5185B5)
//                       ),
//                     ),
//                   ),
//                 ),
//                 ///====================== Done =============================///
//                 UIHelper.verticalSpace(24.h),
//
//                 //======================== ListView ===========================///
//
//
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: (){
//                       NavigationService.navigateTo(Routes.letterScreen);
//                     },
//                     child: ListView.builder(
//                       itemCount: image.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Padding(
//                           padding: EdgeInsets.symmetric(vertical: 8.h),
//                           child:
//
//                           Container(
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//
//                               color: isLight ? AppColors.cF9F6F0 : AppColors.c3D668C.withOpacity(0.55),
//                               borderRadius: BorderRadius.circular(8.r),
//
//
//                               border: Border.all(
//                                 color: isLight ? Colors.transparent : AppColors.c72BBFF,
//                                 width: 1,
//                               ),
//
//
//                             ),
//                             child: Padding(
//                               padding:
//                               EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     width: 54.w,
//                                     height: 54.h,
//                                     child: Image.asset(
//                                       image[index],
//                                       fit: BoxFit.contain,
//                                       errorBuilder: (_, __, ___) => const Icon(Icons.error),
//                                     ),
//                                   ),
//                                   UIHelper.horizontalSpace(16.w),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           title[index],
//
//                                           style: TextFontStyle
//                                               .textStyle12w500FEFEFERaleway
//                                               .copyWith(
//                                             fontSize: 16.sp,
//                                             fontWeight: FontWeight.w600,
//
//                                             color: isStarfield
//                                                 ? const Color(0xFFF9F6F0)
//                                                 : (UiDarkModeHelper.isDarkMode(context)
//                                                 ? AppColors.cFFFFFF
//                                                 :  AppColors.c484848),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
