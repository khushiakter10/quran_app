// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:omermjamal/assets_helper/app_colors.dart';
// import 'package:omermjamal/assets_helper/app_fonts.dart';
// import 'package:omermjamal/assets_helper/app_icons.dart';
// import 'package:omermjamal/assets_helper/app_image.dart';
// import 'package:omermjamal/features/home_screen/widget/custom_all_feature.dart';
// import 'package:omermjamal/features/home_screen/widget/custom_ashar_widget.dart';
// import 'package:omermjamal/features/home_screen/widget/custom_daily_goal.dart';
// import 'package:omermjamal/helpers/all_routes.dart';
// import 'package:omermjamal/helpers/navigation_service.dart';
// import 'package:omermjamal/helpers/ui_helpers.dart';
// import 'package:omermjamal/helpers/ui_dark_mode_helper.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
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
//
//     final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
//     final isLight = currentTheme == UiDarkModeHelper.lightTheme;
//     final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
//
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         child: Stack(
//           children: [
//             if (isLight) ...[
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 right: 0,
//                 height: 140.h,
//                 child: Image.asset(
//                   AppImages.homebluimage,
//                   fit: BoxFit.fitWidth,
//                   alignment: Alignment.topCenter,
//                 ),
//               ),
//               Positioned.fill(
//                 top: 130.h,
//                 child: Container(
//                   color: AppColors.cFEFEFE,
//                 ),
//               ),
//             ] else if (currentTheme == UiDarkModeHelper.darkTheme) ...[
//
//               Container(
//                 color: AppColors.c1C3042,
//               ),
//             ] else ...[
//
//               Positioned.fill(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(AppImages.homebacroundimage),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//
//             SafeArea(
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                     ///===============Appbar Section================
//                     Row(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Assalamualaikum, Sayeada',
//                               style: TextFontStyle.textStyle20w600cFEFEFERaleway
//                                   .copyWith(
//                                 color: isStarfield
//                                     ?  Color(0xFFFEFEFE)
//                                     : (isLight ? Colors.black : Colors.white),
//                               ),
//                             ),
//                             UIHelper.verticalSpace(4.h),
//                             Row(
//                               children: [
//                                 SvgPicture.asset(AppIcons.locationicon,
//                                     height: 16.h),
//                                 UIHelper.horizontalSpace(4.w),
//                                 Text(
//                                   'Malibagh, Dhaka',
//                                   style: TextFontStyle.textStyle12w500FEFEFERaleway
//                                       .copyWith(
//                                     color: isStarfield
//                                         ? const Color(0xFFFEFEFE)
//                                         : (isLight ? Colors.black : Colors.white),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Spacer(),
//                         GestureDetector(
//                           onTap: (){NavigationService.navigateTo(Routes.notificationReminderSettingsScreen);},
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: AppColors.cFFFFFF,
//                               borderRadius: BorderRadius.circular(30.r),
//                             ),
//                             padding:
//                             EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
//                             child: Stack(
//                               clipBehavior: Clip.none,
//                               children: [
//                                 SvgPicture.asset(
//                                   AppIcons.notification,
//                                   height: 24.h,
//                                 ),
//                                 Positioned(
//                                   top: 2,
//                                   right: 1,
//                                   child: Container(
//                                     width: 8.w,
//                                     height: 8.h,
//                                     decoration: BoxDecoration(
//                                       color: AppColors.cFF0303,
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: AppColors.cFFFFFF,
//                                         width: 1.w,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     UIHelper.verticalSpace(24.h),
//                     ///=============Azan Section=====
//                     CustomAsharWidget(text: 'Ashar 15:09 WIB'),
//                     UIHelper.verticalSpace(24.h),
//                     ///==================All Feature Section=================
//                     ///
//                     Text(
//                       'All Feature',
//                       style: TextStyle(
//                         color: isStarfield
//                             ? const Color(0xFFFEFEFE)
//                             : (isLight ? Colors.black : Colors.white),
//                         fontSize: 18,
//                         fontFamily: 'Raleway',
//                         fontWeight: FontWeight.w600,
//                         height: 1.11,
//                         letterSpacing: 0.18,
//                       ),
//                     ),
//                     UIHelper.verticalSpace(16.h),
//
//
//
//
//
//
//                     CustomAllFeature(title: 'Read\nQuran', subtitlr: 'Quran\nAcademy',),
//
//
//
//
//
//
//
//
//
//                     UIHelper.verticalSpace(24.h),
//                     Text(
//                       'Your Daily Goal',
//                       style: TextStyle(
//                         color: isStarfield
//                             ? const Color(0xFFFEFEFE)
//                             : (isLight ? Colors.black : Colors.white),
//                         fontSize: 18.sp,
//                         fontFamily: 'Raleway',
//                         fontWeight: FontWeight.w600,
//                         height: 1.11.h,
//                         letterSpacing: 0.18,
//                       ),
//                     ),
//                     UIHelper.verticalSpace(16.h),
//
//                     CustomDailyGoal(title: 'Al-Baqara'),
//
//
//
//
//                     UIHelper.verticalSpace(24.h),
//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(AppImages.koranbacrounImage),
//                           fit: BoxFit.cover,
//                         ),
//                         borderRadius: BorderRadius.circular(8.r),
//                       ),
//                       child: Padding(
//                         padding:
//                         EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//                         child: SingleChildScrollView(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Ayat of the day',
//                                 style: TextStyle(
//                                   color: isLight ? Colors.black : Colors.black,
//                                   fontSize: 18,
//                                   fontFamily: 'Raleway',
//                                   fontWeight: FontWeight.w600,
//                                   height: 1.11,
//                                   letterSpacing: 0.18,
//                                 ),
//                               ),
//                               UIHelper.verticalSpace(16.h),
//                               Text(
//                                 'اللَّهُ نُورُ السَّمَاوَاتِ وَالْأَرْضِ',
//                                 style: TextFontStyle.textStyle12w400c484848Raleway
//                                     .copyWith(fontSize: 14.sp),
//                               ),
//                               UIHelper.verticalSpace(4.h),
//                               Text(
//                                 'Allah is the Light of the\n heavens and the earth.',
//                                 style: TextFontStyle.textStyle12w400c484848Raleway,
//                               ),
//                               UIHelper.verticalSpace(4.h),
//                               Text(
//                                 '[Surah An-Nur 24:35]',
//                                 style: TextFontStyle.textStyle18w600c000000Raleway
//                                     .copyWith(fontSize: 10.sp),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     UIHelper.verticalSpace(24.h),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'News',
//                           style: TextStyle(
//                             color: isStarfield
//                                 ? const Color(0xFFFEFEFE)
//                                 : (isLight ? Colors.black : Colors.white),
//                             fontSize: 18,
//                             fontFamily: 'Raleway',
//                             fontWeight: FontWeight.w600,
//                             height: 1.11,
//                             letterSpacing: 0.18,
//                           ),
//                         ),
//                         Text(
//                           'See All',
//                           style: TextStyle(
//                             color: const Color(0xFF72BBFF),
//                             fontSize: 12,
//                             fontFamily: 'Raleway',
//                             fontWeight: FontWeight.w400,
//                             height: 1.67,
//                             letterSpacing: 0.12,
//                           ),
//                         ),
//                       ],
//                     ),
//                     UIHelper.verticalSpace(16.h),
//                     Container(
//                       height: 218.h,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(AppImages.newsImage),
//                           fit: BoxFit.cover,
//                         ),
//                         borderRadius: BorderRadius.circular(8.r),
//                         border: Border.all(color: AppColors.c3F678C, width: 1),
//                       ),
//                       child: Padding(
//                         padding:
//                         EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'How namaz teaches discipline and helps you lead a balanced life',
//                               style: TextStyle(
//                                 color: isStarfield
//                                     ? const Color(0xFFFEFEFE)
//                                     : (isLight ? Colors.white : Colors.white),
//                                 fontSize: 24,
//                                 fontFamily: 'Cormorant Garamond',
//                                 fontWeight: FontWeight.w600,
//                                 height: 1.09,
//                                 letterSpacing: -0.48,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'It is seen by many as a very spiritual exercise that helps people connect with the almighty. In addition to its religiou',
//                               style: TextStyle(
//                                 color: const Color(0xFFB1AFAA),
//                                 fontSize: 12,
//                                 fontFamily: 'Raleway',
//                                 fontWeight: FontWeight.w400,
//                                 height: 1.50,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }





















//
//
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:omermjamal/assets_helper/app_colors.dart';
// import 'package:omermjamal/assets_helper/app_fonts.dart';
// import 'package:omermjamal/assets_helper/app_icons.dart';
// import 'package:omermjamal/assets_helper/app_image.dart';
// import 'package:omermjamal/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
// import 'package:omermjamal/helpers/navigation_service.dart';
// import 'package:omermjamal/helpers/ui_dark_mode_helper.dart';
// import 'package:omermjamal/helpers/ui_helpers.dart';
//
// class AudioQuranScreen extends StatefulWidget {
//   const AudioQuranScreen({super.key});
//
//   @override
//   State<AudioQuranScreen> createState() => _AudioQuranScreenState();
// }
//
// class _AudioQuranScreenState extends State<AudioQuranScreen> {
//   final List<String> number = ['1', '2', '3', '4', '5', '6', '7', '8'];
//
//   final List<String> title = [
//     'The Opening',
//     'The Cow',
//     'The Family of Imran',
//     'The Women',
//     'The Table Spread',
//     'The Cattle',
//     'The Heights',
//     'The Spoils of War',
//   ];
//
//   final List<String> subtitle = [
//     'Al-Fatihah',
//     'Al-Baqarah',
//     'Ali Imraan',
//     'An-Nisa',
//     'Al Maa ida',
//     'Al-An am',
//     'Al-A raf',
//     'Al-Anfal',
//   ];
//
//   final List<String> pausedIcons = List.filled(8, 'assets/icons/puasedIcon.svg');
//   final List<String> playIcons = List.filled(8, 'assets/icons/playicon.svg');
//
//   // changed this from final to mutable list for state updates
//   late List<bool> isPlayingList;
//
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   double _sliderValue = 0.0;
//
//   final Duration _startPosition = Duration(seconds: 30);
//   final Duration _endPosition = Duration(seconds: 90);
//
//   Duration _currentPosition = Duration(seconds: 30);
//   bool _isPlaying = false;
//
//   int? _currentPlayingIndex; // to keep track which item is playing
//
//   @override
//   void initState() {
//     super.initState();
//
//     isPlayingList = List.generate(8, (index) => false);
//
//     _audioPlayer.onPlayerComplete.listen((event) {
//       _stopPlayback();
//     });
//
//     _audioPlayer.onPositionChanged.listen((Duration position) {
//       if (_isPlaying) {
//         if (position >= _startPosition && position <= _endPosition) {
//           setState(() {
//             _currentPosition = position;
//             _sliderValue = (position.inMilliseconds - _startPosition.inMilliseconds) /
//                 (_endPosition.inMilliseconds - _startPosition.inMilliseconds);
//           });
//         } else if (position >= _endPosition) {
//           _stopPlayback();
//         }
//       }
//     });
//   }
//
//   Future<void> _startPlayback(int index) async {
//     await _audioPlayer.play(AssetSource('audio/quran_al_fatihah.mp3'));
//     await _audioPlayer.seek(_currentPosition);
//     setState(() {
//       _isPlaying = true;
//       _currentPlayingIndex = index;
//       for (int i = 0; i < isPlayingList.length; i++) {
//         isPlayingList[i] = (i == index);
//       }
//     });
//   }
//
//   Future<void> _stopPlayback() async {
//     await _audioPlayer.pause();
//     setState(() {
//       _isPlaying = false;
//       _currentPlayingIndex = null;
//       for (int i = 0; i < isPlayingList.length; i++) {
//         isPlayingList[i] = false;
//       }
//     });
//   }
//
//   void _togglePlayPause([int? index]) {
//     // If index is given, user tapped a list item, else FAB tapped
//     if (index != null) {
//       if (_isPlaying && _currentPlayingIndex == index) {
//         _stopPlayback();
//       } else {
//         _startPlayback(index);
//       }
//     } else {
//       // FAB tapped
//       if (_isPlaying) {
//         _stopPlayback();
//       } else {
//         // if no surah selected yet, play the first one by default
//         int playIndex = _currentPlayingIndex ?? 0;
//         _startPlayback(playIndex);
//       }
//     }
//   }
//
//   String _formatDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     return '$minutes:$seconds';
//   }
//
//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
//     final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
//     final isLight = currentTheme == UiDarkModeHelper.lightTheme;
//
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           image: isStarfield
//               ? DecorationImage(
//             image: AssetImage(AppImages.personalizationbacroundImage),
//             fit: BoxFit.cover,
//           )
//               : null,
//           gradient: isStarfield ? null : UiDarkModeHelper.getCurrentGradient(context),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomAppbarWidget(
//                   showIcon: false,
//                   text: 'Audio Quran',
//                   onTap: () {
//                     NavigationService.goBack();
//                   },
//                 ),
//                 UIHelper.verticalSpace(24.h),
//
//                 /// Main scroll area
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         /// List of Surahs
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 12.w),
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount: number.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               return Column(
//                                 children: [
//                                   Row(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       /// Number
//                                       Text(
//                                         number[index],
//                                         style: TextFontStyle.textStyle12w500FEFEFERaleway.copyWith(
//                                           fontSize: 16.sp,
//                                           color: isStarfield
//                                               ? const Color(0xFFF9F6F0)
//                                               : (UiDarkModeHelper.isDarkMode(context)
//                                               ? AppColors.cFFFFFF
//                                               : AppColors.c000000),
//                                         ),
//                                       ),
//                                       UIHelper.horizontalSpace(16.w),
//
//                                       /// Title & Subtitle
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               title[index],
//                                               style: TextFontStyle.titleStyle16w500cF9F6F0Raleway.copyWith(
//                                                 fontWeight: FontWeight.w600,
//                                                 color: isStarfield
//                                                     ? const Color(0xFFF9F6F0)
//                                                     : (UiDarkModeHelper.isDarkMode(context)
//                                                     ? AppColors.cFFFFFF
//                                                     : AppColors.c000000),
//                                               ),
//                                             ),
//                                             Text(
//                                               subtitle[index],
//                                               style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
//                                                 fontSize: 14.sp,
//                                                 color: isStarfield
//                                                     ? const Color(0xFFF9F6F0)
//                                                     : (UiDarkModeHelper.isDarkMode(context)
//                                                     ? AppColors.cFFFFFF
//                                                     : AppColors.c000000),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//
//                                       /// Play / Pause Icon
//                                       GestureDetector(
//                                         onTap: () {
//                                           _togglePlayPause(index);
//                                         },
//                                         child: SvgPicture.asset(
//                                           isPlayingList[index]
//                                               ? playIcons[index]
//                                               : pausedIcons[index],
//                                           width: 24.w,
//                                           height: 24.h,
//                                           color: isStarfield
//                                               ? const Color(0xFFF9F6F0)
//                                               : (UiDarkModeHelper.isDarkMode(context)
//                                               ? AppColors.cFFFFFF
//                                               : AppColors.c000000),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   UIHelper.verticalSpace(16.h),
//
//                                   /// Divider
//                                   if (index < number.length - 1) ...[
//                                     Divider(
//                                       color: isLight ? AppColors.cE8E8E8 : AppColors.c3F678C,
//                                       thickness: 1,
//                                     ),
//                                     UIHelper.verticalSpace(16.h),
//                                   ],
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: Container(
//         width: double.infinity,
//         height: 133.h,
//         decoration: BoxDecoration(
//           color: AppColors.c304F6B,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               _currentPlayingIndex != null ? subtitle[_currentPlayingIndex!] : 'Al-Fatihah',
//               style: const TextStyle(
//                 color: Color(0xFFF9F6F0),
//                 fontSize: 20,
//                 fontFamily: 'Raleway',
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             UIHelper.verticalSpace(12.h),
//             Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     _togglePlayPause();
//                   },
//                   child: SvgPicture.asset(
//                     _isPlaying ? AppIcons.playicons : AppIcons.puasedIcon,
//                     height: 40.h,
//                   ),
//                 ),
//                 SizedBox(width: 12.w),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SliderTheme(
//                         data: SliderTheme.of(context).copyWith(
//                           trackHeight: 5,
//                           thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
//                           overlayShape: SliderComponentShape.noOverlay,
//                           activeTrackColor: AppColors.c72BBFF,
//                           inactiveTrackColor: AppColors.c3F678C,
//                           thumbColor: AppColors.cFFFFFF,
//                         ),
//                         child: Slider(
//                           value: _sliderValue,
//                           min: 0.0,
//                           max: 1.0,
//                           onChanged: (double value) {
//                             setState(() {
//                               _sliderValue = value;
//                             });
//                           },
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: const [
//                           Text(
//                             '1:46',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           Text(
//                             '3:40',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
