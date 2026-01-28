import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedLoadingIndicator extends StatelessWidget {
  const AnimatedLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: animatedLoadingindicator());
  }

  LottieBuilder animatedLoadingindicator() {
    return Lottie.asset(
      'assets/animations/Trail loading.json',
      width: 180,
      height: 180,
      repeat: true,
    );
  }
}
