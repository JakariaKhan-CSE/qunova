import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qunova/core/constants/app_color.dart';

import '../widgets/logo.dart';
import '../widgets/modal_container.dart';

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
          Logo(),
          _topCircle().animate().slide(
            begin: Offset(5, -8.2),
            end: Offset.zero,
            duration: 3200.ms,
            curve: Curves.easeInOutCubicEmphasized,
          ),
          _bottomCircle().animate().slide(
            begin: Offset(-5.0, 5.0),
            end: Offset.zero,
            duration: 3200.ms,
            curve: Curves.easeInOutCubicEmphasized,
          ),

          ModalConatiner(showBottomContainer: _showBottomContainer),
        ],
      ),
    );
  }

  Widget _bottomCircle() {
    return Positioned(
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
    );
  }

  Widget _topCircle() {
    return Positioned(
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
    );
  }
}
