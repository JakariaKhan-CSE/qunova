import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_text_style.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
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
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Center(
          child: Text(
            'Add New Contact',
            style: AppTextStyles.textStyle(
              16,
              FontWeight.w500,
              AppColors.background,
            ),
          ),
        ),
      ),
    );
  }
}