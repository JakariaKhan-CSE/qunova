import 'package:flutter/material.dart';
import 'app_color.dart';

abstract final class AppTextStyles {
  static const brandName = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
    letterSpacing: 0.5,
  );

  static const tagline = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    letterSpacing: 3.0,
  );

  static const welcomeTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const welcomeBody = TextStyle(
    fontSize: 14,
    color: Colors.white70,
    height: 1.6,
  );

  static const buttonLabel = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
}