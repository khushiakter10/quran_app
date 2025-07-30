// class CustomDailyGoal extends StatelessWidget {
//   final String title;
//
//   CustomDailyGoal({
//     super.key,
//     required this.title,
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
//         return Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: isStarfield
//                 ? const Color(0xFF1E2B3B)
//                 : (isLight ? AppColors.cF9F6F0 : const Color(0x66061420)),
//             borderRadius: BorderRadius.circular(8.r),
//             border: Border.all(
//               color: isStarfield
//                   ? const Color(0xFF3F678C)
//                   : (isLight ? AppColors.cF9F6F0 : const Color(0xFF304F6B)),
//               width: 1.w,
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: TextStyle(
//                         color: isStarfield
//                             ? const Color(0xFFF9F6F0)
//                             : (isLight ? Colors.black : const Color(0xFFF9F6F0)),
//                         fontSize: 14,
//                         fontFamily: 'Raleway',
//                         fontWeight: FontWeight.w500,
//                         height: 1.32,
//                         letterSpacing: -0.28,
//                       ),
//                     ),
//                     UIHelper.horizontalSpace(6.w),
//                     Container(
//                       width: 2.w,
//                       height: 20.h,
//                       color: isStarfield
//                           ? Colors.white
//                           : (isLight ? Colors.grey[300] : Colors.grey[700]),
//                     ),
//                     UIHelper.horizontalSpace(6.w),
//                     Text(
//                       '66/286',
//                       style: TextStyle(
//                         color: isStarfield
//                             ? const Color(0xFFF9F6F0)
//                             : (isLight ? Colors.black : const Color(0xFFF9F6F0)),
//                         fontSize: 14,
//                         fontFamily: 'Raleway',
//                         fontWeight: FontWeight.w500,
//                         height: 1.32,
//                         letterSpacing: -0.28,
//                       ),
//                     ),
//                     const Spacer(),
//                     Text(
//                       '30%',
//                       textAlign: TextAlign.right,
//                       style: TextStyle(
//                         color: isStarfield
//                             ? const Color(0xFFFEFEFE)
//                             : (isLight ? Colors.black : const Color(0xFFF9F6F0)),
//                         fontSize: 14,
//                         fontFamily: 'Raleway',
//                         fontWeight: FontWeight.w600,
//                         height: 1.32,
//                         letterSpacing: -0.28,
//                       ),
//                     ),
//                   ],
//                 ),
//                 UIHelper.verticalSpace(8.h),
//                 LinearProgressIndicator(
//                   value: 0.3,
//                   color: isStarfield
//                       ? AppColors.cA1D1FF
//                       : (isLight ? Colors.blue : AppColors.cA1D1FF),
//                   borderRadius: BorderRadius.circular(40.r),
//                   backgroundColor: isStarfield
//                       ? AppColors.c72BBFF
//                       : (isLight ? Colors.grey[300] : AppColors.c72BBFF),
//                   minHeight: 8.h,
//                 ),
//                 UIHelper.verticalSpace(8.h),
//                 Text(
//                   '1/15 Verses per day',
//                   style: TextStyle(
//                     color: isStarfield
//                         ? const Color(0xFFF9F6F0)
//                         : (isLight ? Colors.black : const Color(0xFFF9F6F0)),
//                     fontSize: 14,
//                     fontFamily: 'Raleway',
//                     fontWeight: FontWeight.w500,
//                     height: 1.32,
//                     letterSpacing: -0.28,
//                   ),
//                 ),
//                 UIHelper.verticalSpace(16.h),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//                   decoration: ShapeDecoration(
//                     color: isStarfield
//                         ? AppColors.c72BBFF
//                         : (isLight ? Colors.blue : AppColors.c72BBFF),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                   ),
//                   child: GestureDetector(
//                     onTap: () {
//                       final selectedType = controller.selectedReadingType;
//                       print(">>>> Selected Reading Type: $selectedType");
//
//                       switch (selectedType) {
//                         case 'Juz Style':
//                           NavigationService.navigateTo(Routes.juzEnglishTranslationScreen);
//                           break;
//                         case 'Scroll Style':
//                           NavigationService.navigateTo(Routes.readSurahScrollStyleScreen);
//                           break;
//                         case 'Verse-by-Verse':
//                           NavigationService.navigateTo(Routes.readSurahVerseByVerseScreen);
//                           break;
//                         case 'Word-for-Word':
//                           NavigationService.navigateTo(Routes.readSurahWordForWordScreen);
//                           break;
//                         default:
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text('Invalid selection'),
//                               behavior: SnackBarBehavior.floating,
//                             ),
//                           );
//                       }
//                     },
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'Continue Reading',
//                           textAlign: TextAlign.center,
//                           style: TextFontStyle.textStyle14w500c000000Raleway.copyWith(
//                             color: isStarfield
//                                 ? Colors.black
//                                 : (isLight ? Colors.white : Colors.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
