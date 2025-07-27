







import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/assets_helper/app_fonts.dart';
import 'package:quran_app/helpers/ui_dark_mode_helper.dart';

class CustomTextFormfield extends StatefulWidget {
  final bool? isRead;
  final TextEditingController? controller;
  final String? hintText;
  final int? maxline;
  final String? labelText;
  final String? leadingIcon;
  final String? trailingIcon;
  final VoidCallback? onTrailingIconPressed;
  final FormFieldValidator<String>? validator;
  final bool readOnly;
  final bool filled;
  final Color? fillColor;
  final Color? disabledColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelTextStyle;
  final double borderRadius;
  final Color? borderColor;
  final EdgeInsetsGeometry? contentPadding;
  final String? helperText;
  final TextStyle? helperStyle;
  final String? counterText;
  final TextStyle? counterStyle;
  final TextStyle? errorStyle;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool isDense;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final Color? visibilityIconColor;

  final TextInputType? inputType;
  final bool isObsecure;
  final bool isPass;

  const CustomTextFormfield({
    super.key,
    this.controller,
    this.hintText,
    this.isRead = false,
    this.labelText,
    this.leadingIcon,
    this.trailingIcon,
    this.onTrailingIconPressed,
    this.validator,
    this.readOnly = false,
    this.filled = true,
    this.fillColor,
    this.disabledColor,
    this.textStyle,
    this.hintStyle,
    this.labelTextStyle,
    this.borderRadius = 19,
    this.borderColor,
    this.contentPadding,
    this.helperText,
    this.helperStyle,
    this.counterText,
    this.counterStyle,
    this.errorStyle,
    this.floatingLabelBehavior,
    this.isDense = false,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.inputType,
    this.isObsecure = false,
    this.isPass = false,
    this.maxline,
    this.visibilityIconColor,
  });

  @override
  State<CustomTextFormfield> createState() => _CustomTextFormfieldState();
}

class _CustomTextFormfieldState extends State<CustomTextFormfield> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isPass ? true : widget.isObsecure;
    super.initState();
  }

  void toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  OutlineInputBorder _outlineInputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius.r),
      borderSide: BorderSide(color: borderColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = UiDarkModeHelper.getCurrentTheme(context);
    final isStarfield = currentTheme == UiDarkModeHelper.starfieldTheme;
    final isLight = currentTheme == UiDarkModeHelper.lightTheme;
    final isDarkMode = currentTheme == UiDarkModeHelper.darkTheme;

    final Color effectiveBorderColor = widget.borderColor ??
        (isLight
            ? AppColors.cF9F6F0
            : (isStarfield
            ? Colors.transparent
            : (isDarkMode
            ? Colors.transparent
            : const Color(0xFF304F6B))));
    final Color effectiveFillColor = widget.fillColor ??
        (isLight ? AppColors.cF9F6F0 : Colors.black.withOpacity(0.3));
    final Color effectiveDisabledColor =
        widget.disabledColor ?? AppColors.cE8E8E8;
    final Color effectiveTextColor = widget.textStyle?.color ??
        (isStarfield
            ? const Color(0xFFFEFEFE)
            : (isLight ? Colors.black : AppColors.cF9F6F0));
    final Color effectiveIconColor = widget.prefixIconColor ??
        widget.suffixIconColor ??
        (isLight ? AppColors.c72BBFF : AppColors.cF9F6F0);
    final Color visibilityIconColor =
        widget.visibilityIconColor ?? Colors.black; // ✅ Default fallback

    return TextFormField(
      readOnly: widget.isRead ?? false,
      maxLines: widget.maxline ?? 1,
      controller: widget.controller,
      onTap: widget.onTap,
      obscureText: widget.isPass ? _obscureText : widget.isObsecure,
      keyboardType: widget.inputType ?? TextInputType.text,
      style: widget.textStyle ??
          TextFontStyle.textStyle12w400c000000Raleway
              .copyWith(color: Colors.black),
      validator: widget.validator,
      enabled: !widget.readOnly,
      decoration: InputDecoration(
        hintText: widget.hintText ?? '',
        hintStyle: widget.hintStyle ??
            TextFontStyle.textStyle12w400c000000Raleway
                .copyWith(color: effectiveTextColor.withOpacity(0.6)),
        labelText: widget.labelText,
        labelStyle: widget.labelTextStyle ??
            TextFontStyle.textStyle12w400c8F8A8ERaleway
                .copyWith(color: effectiveTextColor),
        fillColor: widget.readOnly ? effectiveDisabledColor : effectiveFillColor,
        filled: widget.filled,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
        helperText: widget.helperText,
        helperStyle: widget.helperStyle,
        counterText: widget.counterText,
        counterStyle: widget.counterStyle,
        errorStyle: widget.errorStyle,
        floatingLabelBehavior:
        widget.floatingLabelBehavior ?? FloatingLabelBehavior.auto,
        isDense: widget.isDense,
        border: _outlineInputBorder(effectiveBorderColor),
        focusedBorder: _outlineInputBorder(effectiveBorderColor),
        enabledBorder: _outlineInputBorder(effectiveBorderColor),
        errorBorder: _outlineInputBorder(effectiveBorderColor),
        disabledBorder: _outlineInputBorder(effectiveDisabledColor),

        prefixIcon: widget.leadingIcon != null
            ? Padding(
          padding: EdgeInsets.all(12.h),
          child: SvgPicture.asset(
            widget.leadingIcon!,
            height: 24.h,
            fit: BoxFit.scaleDown,
            color: Colors.black,
          ),
        )
            : widget.prefixIcon,

        suffixIcon: widget.isPass
            ? IconButton(
          onPressed: toggleObscureText,
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: visibilityIconColor, // ✅ Custom visibility icon color
          ),
        )
            : (widget.trailingIcon != null
            ? GestureDetector(
          onTap: widget.onTrailingIconPressed,
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: SvgPicture.asset(
              widget.trailingIcon!,
              height: 24.h,
              fit: BoxFit.scaleDown,
              color: effectiveIconColor,
            ),
          ),
        )
            : widget.suffixIcon),
      ),
    );
  }
}




























