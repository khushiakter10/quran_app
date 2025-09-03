import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/assets_helper/app_icons.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/features/mind_map/mind_map_share/widget/custom_mind_share.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';



class MindMapShareScreen extends StatefulWidget {
  const MindMapShareScreen({super.key});

  @override
  State<MindMapShareScreen> createState() => _MindMapShareScreenState();
}

class _MindMapShareScreenState extends State<MindMapShareScreen> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: isStarfield
              ? DecorationImage(
            image: AssetImage(AppImages.personalizationbacroundImage),
            fit: BoxFit.cover,
          )
              : null,
          gradient: isStarfield
              ? null
              : UiDarkModeHelper.getCurrentGradient(context),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CustoMindShare(
                  icon: SvgPicture.asset(AppIcons.likeIcon),
                  text: 'Al-Fatihah',
                  subtitle: 'الفاتحة',
                  showIcon: false,
                  onTap: () => Navigator.of(context).pop(),
                ),


               UIHelper.verticalSpace(12.h),

                Image.asset(AppImages.surahImage)




              ],
            ),
          ),
        ),
      ),
    );
  }
}
