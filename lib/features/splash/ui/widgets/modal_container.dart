import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_color.dart';
class ModalConatiner extends StatelessWidget {
  const ModalConatiner({
    super.key,
    required bool showBottomContainer,
  }) : _showBottomContainer = showBottomContainer;

  final bool _showBottomContainer;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        opacity: _showBottomContainer ? 1.0 : 0.0,
        duration: 500.ms,
        child: _showBottomContainer
            ? Container(
          width: double.infinity,
          height: 320,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 56,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                    color: AppColors.background,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Pellentesque fames lobortis vestibulum nisi nulla egestas nibh tincidunt nunc. ',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.background,
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    // navigate to other page
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Center(
                      child: Text(
                        'Getting Started',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ).animate().slideY(
          begin: 1.2,
          end: 0.0,
          duration: 1400.ms,
          curve: Curves.easeOutCubic,
          delay: 400.ms,
        )
            : const SizedBox.shrink(),
      ),
    );
  }
}