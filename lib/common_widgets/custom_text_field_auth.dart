

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../assets_helper/app_colors.dart';
import '../assets_helper/app_fonts.dart';

class CustomTextFieldAuth extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
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
  final double borderRadius; // <- only double now
  final Color? borderColor;  // <- simplified
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

  final TextInputType? inputType;
  final bool isObsecure;
  final bool isPass;

  const CustomTextFieldAuth({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.leadingIcon,
    this.trailingIcon,
    this.onTrailingIconPressed,
    this.validator,
    this.readOnly = false,
    this.filled = true,
    this.fillColor = AppColors.primaryColor,
    this.disabledColor,
    this.textStyle,
    this.hintStyle,
    this.labelTextStyle,
    this.borderRadius = 19, // <- default 19
    this.borderColor = Colors.transparent, // <- default transparent
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
  });

  @override
  State<CustomTextFieldAuth> createState() => _CustomTextFieldAuthState();
}

class _CustomTextFieldAuthState extends State<CustomTextFieldAuth> {
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
    final Color effectiveDisabledColor = widget.disabledColor ?? AppColors.cE8E8E8;

    return TextFormField(
      controller: widget.controller,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      obscureText: widget.isPass ? _obscureText : widget.isObsecure,
      keyboardType: widget.inputType ?? TextInputType.text,
      style: widget.textStyle,
      validator: widget.validator,
      enabled: !widget.readOnly,
      decoration: InputDecoration(
        hintText: widget.hintText ?? '',
        hintStyle: widget.hintStyle ?? TextFontStyle.textStyle12w400c000000Raleway,
        labelText: widget.labelText,
        labelStyle: widget.labelTextStyle ?? TextFontStyle.textStyle12w400c8F8A8ERaleway,
        fillColor: widget.readOnly ? effectiveDisabledColor : widget.fillColor,
        filled: widget.filled,
        contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
        helperText: widget.helperText,
        helperStyle: widget.helperStyle,
        counterText: widget.counterText,
        counterStyle: widget.counterStyle,
        errorStyle: widget.errorStyle,
        floatingLabelBehavior: widget.floatingLabelBehavior ?? FloatingLabelBehavior.auto,
        isDense: widget.isDense,

        border: _outlineInputBorder(widget.borderColor!),
        focusedBorder: _outlineInputBorder(widget.borderColor!),
        enabledBorder: _outlineInputBorder(widget.borderColor!),
        errorBorder: _outlineInputBorder(widget.borderColor!),
        disabledBorder: _outlineInputBorder(effectiveDisabledColor),

        prefixIcon: widget.leadingIcon != null
            ? Padding(
          padding: EdgeInsets.all(12.h),
          child: SvgPicture.asset(
            widget.leadingIcon!,
            height: 24.h,
            fit: BoxFit.scaleDown,
          ),
        )
            : widget.prefixIcon,

        suffixIcon: widget.isPass
            ? IconButton(
          onPressed: toggleObscureText,
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.c5C5C5C,
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
            ),
          ),
        )
            : widget.suffixIcon),
      ),
    );
  }
}