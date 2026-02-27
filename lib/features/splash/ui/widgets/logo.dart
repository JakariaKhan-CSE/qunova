import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child:
      Image.asset('assests/images/Logo.png', height: 170, width: 170)
          .animate(
        onPlay: (controller) =>
            controller.repeat(reverse: true, count: 2),
      )
          .scale(
        begin: Offset(0.7, 0.7),
        end: Offset(1.2, 1.2),
        duration: 2200.ms,
        curve: Curves.easeInOutSine,
      ),
    );
  }
}