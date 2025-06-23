import 'package:flutter/material.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:flutter_website/core/fonts/app_text.dart';

class MainAppButton extends StatelessWidget {
  const MainAppButton(
      {super.key,
      required this.onPressed,
      this.textColor,
      this.fontSize,
      required this.text,
      this.buttonColor,
      this.borderColor});
  final Function()? onPressed;
  final Color? textColor;
  final Color? buttonColor;
  final Color? borderColor;
  final double? fontSize;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      highlightElevation: 0,
      splashColor: Colors.transparent,
      onPressed: onPressed,
      color: buttonColor ?? AppColors.primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(
            color: borderColor ?? AppColors.primaryColor,
          )),
      height: 56,
      elevation: 0,
      minWidth: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTexts.small.copyWith(
          color: textColor ?? Colors.white,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
