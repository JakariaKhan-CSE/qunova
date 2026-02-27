import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qunova/core/constants/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showBottomContainer = false;
  bool _startExit = false; // circles exit + logo freeze

  @override
  void initState() {
    super.initState();

    // Step 1: Circles exit & logo freezes — e.g. at 3000ms
    Future.delayed(3000.ms, () {
      if (mounted) {
        setState(() {
          _startExit = true;
        });
      }
    });

    // Step 2: Bottom container appears — e.g. at 3800ms
    Future.delayed(3800.ms, () {
      if (mounted) {
        setState(() {
          _showBottomContainer = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child:
                Image.asset('assests/images/Logo.png', height: 170, width: 170)
                    .animate(
                      onPlay: (controller) =>
                          controller.repeat(reverse: true, count:
                          2),
                    )
                    .scale(
                      begin: Offset(0.7, 0.7),
                      end: Offset(1.2, 1.2),
                      duration: 2200.ms,
                      curve: Curves.easeInOutSine,
                    ),
          ),
          Positioned(
            top: -65,
            right: -60,
            child: AnimatedOpacity(
              opacity: _startExit ? 0.0 : 1.0,
              duration: 1400.ms,
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ).animate().slide(
            begin: Offset(5, -8.2),
            end: Offset.zero,
            duration: 3200.ms,
            curve: Curves.easeInOutCubicEmphasized,
          ),
          Positioned(
            bottom: -140,
            left: -140,
            child: AnimatedOpacity(
              opacity: _startExit ? 0.0 : 1.0,
              duration: 1400.ms,
              child: Container(
                height: 360,
                width: 360,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ).animate().slide(
            begin: Offset(-5.0, 5.0),
            end: Offset.zero,
            duration: 3200.ms,
            curve: Curves.easeInOutCubicEmphasized,
          ),

          Align(
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
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 56),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Welcome',style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 40,
                        color: AppColors.background
                      ),),
                      SizedBox(height: 8,),
                      Text('Lorem ipsum dolor sit amet consectetur. Pellentesque fames lobortis vestibulum nisi nulla egestas nibh tincidunt nunc. ',style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.background
                      ),),
                      SizedBox(height: 30,),
                      GestureDetector(
                        onTap: () {
                          // navigate to other page
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(60)
                          ),
                          child: Center(
                            child: Text('Getting Started',style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.secondary
                            ),),
                          ),
                        ),
                      )
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
          ),
        ],
      ),
    );
  }
}
