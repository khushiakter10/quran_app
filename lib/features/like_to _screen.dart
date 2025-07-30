// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:omermjamal/assets_helper/app_colors.dart';
// import 'package:omermjamal/assets_helper/app_fonts.dart';
// import 'package:omermjamal/assets_helper/app_image.dart';
// import 'package:omermjamal/common_widgets/custom_personalization_button.dart';
// import 'package:omermjamal/features/personalization_flow/widget_step/custom_stepbar.dart';
// import 'package:omermjamal/helpers/all_routes.dart';
// import 'package:omermjamal/helpers/navigation_service.dart';
// import 'package:omermjamal/helpers/ui_dark_mode_helper.dart';
// import 'package:omermjamal/helpers/ui_helpers.dart';
// import 'package:provider/provider.dart';
// import 'package:omermjamal/helpers/ui_dark_mood_controller.dart';
//
// class LikeToQuranScreen extends StatefulWidget {
//   const LikeToQuranScreen({super.key});
//
//   @override
//   State<LikeToQuranScreen> createState() => _LikeToQuranScreenState();
// }
//
// class _LikeToQuranScreenState extends State<LikeToQuranScreen> {
//   int selectedLanguageIndex = 0;
//
//   final List<String> readingTitles = [
//     'Juz Style',
//     'Scroll Style',
//     'Verse-by-Verse',
//     'Word-for-Word',
//   ];
//
//   final List<String> readingSubtitles = [
//     '(Page-flipping like a book)',
//     '(Scroll down continuously)',
//     '(One verse per screen)',
//     '(Word translation)',
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       await UiDarkModeHelper.initTheme(context);
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     bool isLightMode = UiDarkModeHelper.isLightMode(context);
//     bool isDarkMode = UiDarkModeHelper.isDarkMode(context);
//
//     return Consumer<UiDarkModeController>(
//       builder: (context, controller, child) {
//         final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
//         final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
//         final isLight = currentTheme == UiDarkModeHelper.lightTheme;
//
//         return Scaffold(
//           body: Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               image: isStarfield
//                   ? DecorationImage(
//                 image: AssetImage(AppImages.personalizationbacroundImage),
//                 fit: BoxFit.cover,
//               )
//                   : null,
//               gradient: isStarfield
//                   ? null
//                   : UiDarkModeHelper.getCurrentGradient(context),
//             ),
//             child: SafeArea(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomStepBar(
//                       isDarkText: isLight,
//                       currentStep: 5,
//                       onTap: () {
//                         NavigationService.goBack();
//                       },
//                       onSkip: () {
//                         NavigationService.navigateTo(
//                             Routes.selectColorThemBackgroundScreen);
//                       },
//                       onStepTap: (index) => goToStep(index),
//                     ),
//                     UIHelper.verticalSpace(24.h),
//                     Text(
//                       'How would you like to read the Quran?',
//                       style: TextFontStyle.textStyle18w500cF9F6F0Raleway.copyWith(
//                         fontSize: 24.sp,
//                         fontWeight: FontWeight.w600,
//                         color: isStarfield
//                             ? AppColors.cF9F6F0
//                             : (isDarkMode
//                             ? AppColors.cF9F6F0
//                             : AppColors.c000000),
//                       ),
//                     ),
//                     UIHelper.verticalSpace(32.h),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: readingTitles.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           final bool isSelected =
//                               selectedLanguageIndex == index;
//
//                           Color backgroundColor;
//                           Color borderColor;
//                           Color textColor;
//                           Color subtitleColor;
//                           List<BoxShadow> boxShadow;
//
//                           if (isLightMode) {
//                             backgroundColor = isSelected
//                                 ? Colors.blue.withOpacity(0.1)
//                                 : Colors.white;
//                             borderColor = isSelected
//                                 ? const Color(0xFF72BBFF)
//                                 : Colors.grey.withOpacity(0.2);
//                             textColor =
//                             isSelected ? Colors.blue : Colors.black;
//                             subtitleColor =
//                             isSelected ? Colors.blue : Colors.black54;
//                             boxShadow = isSelected
//                                 ? [
//                               BoxShadow(
//                                 color: Colors.blueAccent.withOpacity(0.2),
//                                 blurRadius: 8,
//                                 offset: const Offset(0, 2),
//                               ),
//                             ]
//                                 : [];
//                           } else if (isDarkMode) {
//                             backgroundColor = isSelected
//                                 ? Colors.black.withOpacity(0.1)
//                                 : const Color(0x66061420);
//                             borderColor = isSelected
//                                 ? const Color(0xFF72BBFF)
//                                 : AppColors.c304F6B;
//                             textColor = isSelected
//                                 ? const Color(0xFF72BBFF)
//                                 : Colors.white;
//                             subtitleColor = isSelected
//                                 ? const Color(0xFF72BBFF)
//                                 : Colors.white70;
//                             boxShadow = [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.2),
//                                 blurRadius: 8,
//                                 offset: const Offset(0, 2),
//                               ),
//                             ];
//                           } else {
//                             backgroundColor = isSelected
//                                 ? Colors.black.withOpacity(0.1)
//                                 : const Color(0x66061420);
//                             borderColor = isSelected
//                                 ? const Color(0xFF72BBFF)
//                                 : AppColors.c304F6B;
//                             textColor = isSelected
//                                 ? const Color(0xFF72BBFF)
//                                 : const Color(0xFFF9F6F0);
//                             subtitleColor = isSelected
//                                 ? const Color(0xFF72BBFF)
//                                 : Colors.white70;
//                             boxShadow = [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.2),
//                                 blurRadius: 8,
//                                 offset: const Offset(0, 2),
//                               ),
//                             ];
//                           }
//
//                           return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 selectedLanguageIndex = index;
//                               });
//                               controller.saveSelectedReadingType(
//                                   readingTitles[index]);
//                             },
//                             child: Container(
//                               width: double.infinity,
//                               margin: EdgeInsets.only(bottom: 12.h),
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 24.w, vertical: 16.h),
//                               decoration: ShapeDecoration(
//                                 shadows: boxShadow,
//                                 color: backgroundColor,
//                                 shape: RoundedRectangleBorder(
//                                   side: BorderSide(
//                                     width: 2,
//                                     color: borderColor,
//                                   ),
//                                   borderRadius: BorderRadius.circular(80.r),
//                                 ),
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     readingTitles[index],
//                                     style: TextFontStyle
//                                         .textStyle18w500cF9F6F0Raleway
//                                         .copyWith(color: textColor),
//                                   ),
//                                   Text(
//                                     readingSubtitles[index],
//                                     style: TextFontStyle
//                                         .textStyle18w500cF9F6F0Raleway
//                                         .copyWith(
//                                         color: subtitleColor,
//                                         fontSize: 16.sp),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     UIHelper.verticalSpace(16.h),
//                     CustomPersonalizationButton(
//                       text: 'Next',
//                       onPressed: () {
//                         final readingType =
//                         readingTitles[selectedLanguageIndex];
//                         controller.saveSelectedReadingType(readingType);
//                         NavigationService
//                             .navigateTo(Routes.selectColorThemBackgroundScreen);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   void goToStep(int index) {}
// }
