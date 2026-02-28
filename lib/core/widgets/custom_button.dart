import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_text_style.dart';
class CustomButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final String btnText;
  final FontWeight? fontWeight;
  const CustomButton({
    super.key,
    required this.onTap, this.backgroundColor = AppColors.primary, this.foregroundColor = AppColors.background, required this.btnText, this.borderColor, this.fontWeight,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor??Colors.transparent),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Center(
          child: Text(
            btnText,
            style: AppTextStyles.textStyle(
              18,
              fontWeight ?? FontWeight.w500,
              foregroundColor??AppColors.background,
            ),
          ),
        ),
      ),
    );
  }
}