import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/assets_helper/app_image.dart';
import 'package:quran_app/common_widgets/custom_personalization_button.dart';
import 'package:quran_app/common_widgets/custom_text_formfield.dart';
import 'package:quran_app/features/account-management/additional_customization_support/widget/custom_contact.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/widget/custom_appbar.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';
import 'package:quran_app/helpers/ui_helpers.dart';



class AdditionalCustomizationSupportScreen extends StatefulWidget {
  const AdditionalCustomizationSupportScreen({super.key});

  @override
  State<AdditionalCustomizationSupportScreen> createState() => _AdditionalCustomizationSupportScreenState();
}

class _AdditionalCustomizationSupportScreenState extends State<AdditionalCustomizationSupportScreen> {
  final TextEditingController questionHereController = TextEditingController();


  @override
  void dispose() {

    questionHereController.dispose();
    super.dispose();
  }

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
                CustomAppbarWidget(
                  showIcon: false,
                  text: 'Additional Customization & Support',
                  onTap: () {
                    NavigationService.goBack();
                  },
                ),
                UIHelper.verticalSpace(40.h),


              Text(
                'Need Assistance? We re Here to Help!',
              style:  TextFontStyle.titleStyle16w500cF9F6F0Raleway.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,

                color: isStarfield
                    ?   AppColors.cF9F6F0
                    : (UiDarkModeHelper.isDarkMode(context)
                    ?  AppColors.cF9F6F0
                    :  AppColors.c484848  ),
            )
            ),
                UIHelper.verticalSpace(16.h),

                Text(
                  'If you have any questions, issues, or need support, feel free to reach out to us.',
                  style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(fontSize: 14.sp,
                    color: isStarfield
                        ?   AppColors.cF9F6F0
                        : (UiDarkModeHelper.isDarkMode(context)
                        ?  AppColors.cF9F6F0
                        :  AppColors.c484848  ),)
                ),

                UIHelper.verticalSpace(16.h),


                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    color: isLight ? AppColors.cF9F6F0 :Color(0xB2061420),

                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 9.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ask Your Question here:',
                          style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(
                            fontSize: 16.sp,
                            color: isStarfield
                                ?   AppColors.cF9F6F0
                                : (UiDarkModeHelper.isDarkMode(context)
                                ?  AppColors.cF9F6F0
                                :  AppColors.c484848  ),)
                          ),

                        UIHelper.verticalSpace(8.h),
                        CustomTextFormfield(
                          borderRadius: 8.r,
                          textStyle: TextStyle(color: Colors.white),
                          controller: questionHereController,
                          maxline: 4,
                          filled: true,
                        fillColor:  isLight ? AppColors.cE3E0DA :  AppColors.c305170,
                        ),
                        UIHelper.verticalSpace(16.h),

                        CustomPersonalizationButton(
                          text: 'Send',
                          onPressed: () {

                          },
                        ),

                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpace(24.h),
                Text(
                  'Alternatively, you can reach us via WhatsApp:',
                  style: TextFontStyle.titleStyle12w400cF9F6F0Raleway.copyWith(fontSize: 14.sp,
                    color: isStarfield
                        ?   AppColors.cF9F6F0
                        : (UiDarkModeHelper.isDarkMode(context)
                        ?  AppColors.cF9F6F0
                        :  AppColors.c484848  ),),
                ),
                UIHelper.verticalSpace(24.h),
                CustomContact(title: 'Contact Us on '),
                UIHelper.verticalSpace(24.h),

                Text(
                  'We value your feedback and are always here to help you!',
                  style: TextFontStyle.titleStyle12w400c757575Raleway.copyWith(fontSize: 14.sp,
                    color: isStarfield
                        ?   AppColors.cF9F6F0
                        : (UiDarkModeHelper.isDarkMode(context)
                        ?  AppColors.cF9F6F0
                        :  AppColors.c484848  ),)
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}


