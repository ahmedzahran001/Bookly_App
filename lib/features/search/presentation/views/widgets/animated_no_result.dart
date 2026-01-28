
import 'package:flutter/material.dart';

class AnimatedNoResultsWidget extends StatefulWidget {
  const AnimatedNoResultsWidget({super.key});

  @override
  State<AnimatedNoResultsWidget> createState() =>
      _AnimatedNoResultsWidgetState();
}

class _AnimatedNoResultsWidgetState extends State<AnimatedNoResultsWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _bounceAnimation = Tween<double>(
      begin: 0,
      end: 20,
    ).chain(CurveTween(curve: Curves.elasticInOut)).animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _bounceAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, -_bounceAnimation.value),
                child: child,
              );
            },
            child: Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
          ),
          const SizedBox(height: 16),
          Text(
            'No books found',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try searching with a different keyword',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
