// import 'dart:ui' as ui;
// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
//
// import 'package:omermjamal/assets_helper/app_colors.dart';
// import 'package:omermjamal/assets_helper/app_icons.dart';
// import 'package:omermjamal/assets_helper/app_image.dart';
// import 'package:omermjamal/features/vocabulary/learn/widget/learn_custom.dart';
// import 'package:omermjamal/helpers/all_routes.dart';
// import 'package:omermjamal/helpers/navigation_service.dart';
// import 'package:omermjamal/helpers/ui_dark_mode_helper.dart';
// import 'package:omermjamal/helpers/ui_helpers.dart';
//
// class WriteScreen extends StatefulWidget {
//   const WriteScreen({super.key});
//
//   @override
//   State<WriteScreen> createState() => _WriteScreenState();
// }
//
// class _WriteScreenState extends State<WriteScreen> with TickerProviderStateMixin {
//   final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
//   final TextEditingController fonSizeController = TextEditingController();
//   final FlutterTts flutterTts = FlutterTts();
//
//   bool showSyllable = true;
//   double _sliderValue = 0.3;
//   int? currentlyPlayingIndex;
//
//   final List<String> speakWords = ['ب'];
//
//   @override
//   void initState() {
//     super.initState();
//     flutterTts.setCompletionHandler(() {
//       setState(() {
//         currentlyPlayingIndex = null;
//       });
//     });
//
//     flutterTts.setCancelHandler(() {
//       setState(() {
//         currentlyPlayingIndex = null;
//       });
//     });
//   }
//
//   Future<void> _speak(int index) async {
//     if (currentlyPlayingIndex == index) {
//       await flutterTts.stop();
//       setState(() => currentlyPlayingIndex = null);
//     } else {
//       await flutterTts.stop();
//       setState(() => currentlyPlayingIndex = index);
//       await flutterTts.setLanguage("ar-SA");
//       await flutterTts.setPitch(1.0);
//       await flutterTts.setSpeechRate(0.5);
//       await flutterTts.speak(speakWords[index]);
//     }
//   }
//
//   void _onFinish() async {
//     final image = await _signaturePadKey.currentState?.toImage();
//     final bytes = await image?.toByteData(format: ui.ImageByteFormat.png);
//     if (bytes != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Drawing finished, image size: ${bytes.lengthInBytes} bytes')),
//       );
//     }
//   }
//
//   void _clearSignature() {
//     _signaturePadKey.currentState?.clear();
//   }
//
//   @override
//   void dispose() {
//     fonSizeController.dispose();
//     flutterTts.stop();
//     super.dispose();
//   }
//
//   void goToStep(int index) {}
//
//   @override
//   Widget build(BuildContext context) {
//     final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
//     final isLight = currentTheme == UiDarkModeHelper.lightTheme;
//
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(AppImages.personalizationbacroundImage),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
//             child: Column(
//               children: [
//                 LearnCustom(
//                   isDarkText: isLight,
//                   currentStep: 0,
//                   onTap: () => NavigationService.goBack(),
//                   onSkip: () => NavigationService.navigateTo(Routes.selectColorThemBackgroundScreen),
//                   onStepTap: goToStep,
//                 ),
//                 UIHelper.verticalSpace(20.h),
//                 Text(
//                   'Write',
//                   style: TextStyle(
//                     color: const Color(0xFFFEFEFE),
//                     fontSize: 32,
//                     fontFamily: 'Cormorant Garamond',
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 UIHelper.verticalSpace(10.h),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.all(24.w),
//                       decoration: BoxDecoration(
//                         color: AppColors.cE9DEC8,
//                         borderRadius: BorderRadius.circular(24.r),
//                       ),
//                       child: Column(
//                         children: [
//                           Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               if (showSyllable)
//                                 IgnorePointer(
//                                   child: CustomPaint(
//                                     painter: _StrokeTextPainter(
//                                       text: speakWords[0],
//                                       color: const Color(0xFF484848),
//                                       fontSize: 128.sp,
//                                     ),
//                                     size: Size(double.infinity, 150.h),
//                                   ),
//                                 ),
//                               SizedBox(
//                                 height: 150.h,
//                                 child: SfSignaturePad(
//                                   key: _signaturePadKey,
//                                   backgroundColor: Colors.transparent,
//                                   strokeColor: Colors.red,
//                                   minimumStrokeWidth: 2,
//                                   maximumStrokeWidth: 4,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           UIHelper.verticalSpace(40.h),
//
//
//
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//
//                               _circleIconButton(
//                                 onTap: () => _speak(0),
//                                 iconPath: currentlyPlayingIndex == 0
//                                     ? AppIcons.pauseIcon
//                                     : AppIcons.playicon,
//                               ),
//
//
//                               _circleIconButton(
//                                 onTap: () => setState(() => showSyllable = !showSyllable),
//                                 iconWidget: Icon(
//                                   showSyllable ? Icons.visibility_off : Icons.visibility,
//                                   color: Colors.black,
//                                   size: 24.h,
//                                 ),
//                               ),
//
//                               _circleIconButton(
//                                 onTap: _clearSignature,
//                                 iconPath: AppIcons.finishIcon,
//                               ),
//
//                             ],
//                           ),
//                         ],
//                       ),
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
//
//   Widget _circleIconButton({
//     required VoidCallback onTap,
//     String? iconPath,
//     Widget? iconWidget,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: AppColors.cFFFFFF,
//           borderRadius: BorderRadius.circular(40.r),
//         ),
//         padding: EdgeInsets.all(10),
//         child: iconWidget ??
//             SvgPicture.asset(
//               iconPath!,
//               height: 24.h,
//             ),
//       ),
//     );
//   }
// }
//
// // Custom painter to draw the syllable as stroke
// class _StrokeTextPainter extends CustomPainter {
//   final String text;
//   final double fontSize;
//   final Color color;
//
//   _StrokeTextPainter({required this.text, required this.fontSize, required this.color});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final textStyle = TextStyle(
//       fontSize: fontSize,
//       fontWeight: FontWeight.w400,
//       fontFamily: 'Amiri Quran',
//       foreground: Paint()
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 2
//         ..color = color,
//     );
//
//     final textSpan = TextSpan(text: text, style: textStyle);
//     final tp = TextPainter(text: textSpan, textAlign: TextAlign.center, textDirection: TextDirection.rtl);
//     tp.layout();
//     tp.paint(canvas, Offset((size.width - tp.width) / 2, (size.height - tp.height) / 2));
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
