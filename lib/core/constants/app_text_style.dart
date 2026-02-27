import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

abstract final class AppTextStyles {
  static TextStyle textStyle(double fontSize, FontWeight fontWeight,Color color ){
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color
    );
  }
}