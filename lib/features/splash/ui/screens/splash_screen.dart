import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:qunova/core/constants/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showBottomContainer = false;
  @override
  void initState() {
    Future.delayed(
      3800.ms,() {
        if(mounted){
          setState(() {
            _showBottomContainer = true;
          });
        }
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assests/images/Logo.png',
              height: 170,
              width: 170,
            ).animate(
              onPlay: (controller) => controller.repeat(reverse: true),
            ).scale(
              begin: Offset(0.7, 0.7),
              end: Offset(1.2 , 1.2),
              duration: 2200.ms,
              curve: Curves.easeInOutSine,
            ),
          ),
          Positioned(
            top: -65,
            right: -60,
            child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle
              ),
            ),
          ).animate().slide(
            begin: Offset(5, -8.2),
            end: Offset.zero,
            duration: 3200.ms,
            curve: Curves.easeInOutCubicEmphasized
          ),
          Positioned(
            bottom: -140,
            left: -140,
            child: Container(
              height: 360,
              width: 360,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle
              ),
            ),
          ).animate().slide(
              begin: Offset(-5.0, 5.0),
              end: Offset.zero,
              duration: 3200.ms,
              curve: Curves.easeInOutCubicEmphasized
          )
        ],
      ),
    );
  }
}
