import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_text_style.dart';
import 'custom_button.dart';
class EmptyState extends StatelessWidget {
  final VoidCallback onTap;
  const EmptyState({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Ee! No Contacts \nfound.',
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle(
              20,
              FontWeight.w500,
              Color(0xFF475569),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomButton(onTap: onTap),
          ),
        ],
      ),
    );
  }
}

