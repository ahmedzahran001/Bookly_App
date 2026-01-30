import 'package:bookly/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedSearchLoading extends StatelessWidget {
  const AnimatedSearchLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        animatedSearchLoading(),
        // const SizedBox(height: 8),
        Text(
          'Start typing to search for books',
          style: Styles.textStyle18.copyWith(color: Colors.grey[600]),
        ),
      ],
    );
  }
}

LottieBuilder animatedSearchLoading() {
  return Lottie.asset(
    'assets/animations/Sandy Loading.json',
    width: 240,
    height: 240,
    repeat: true,
  );
}
