import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedNoConnection extends StatelessWidget {
  const AnimatedNoConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: animatedLoadingindicator());
  }

  LottieBuilder animatedLoadingindicator() {
    return Lottie.asset(
      // 'assets/animations/no internet.json',
      'assets/animations/NoInternet Connection.json',
      width: 130,
      height: 130,
      repeat: true,
    );
  }
}
