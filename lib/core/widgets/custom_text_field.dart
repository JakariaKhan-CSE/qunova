import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  const CustomTextField({
    super.key, this.hintText, this.prefixIcon, this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,

        suffixIconConstraints: BoxConstraints(
          maxHeight: 45,
          maxWidth: 45
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xFFCBD5E1)),
        ),
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xFFCBD5E1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xFFCBD5E1)),
        ),

      ),
    );
  }
}