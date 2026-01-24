import 'package:bookly/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    required this.rating,
    required this.count,
  });

  final num rating;
  final num count;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: const Color(0xffFFDD4F),
          size: 16,
        ),
        SizedBox(width: 8),
        Text(rating.toString(), style: Styles.textStyle16),
        SizedBox(width: 8),
        Text(
          '($count)',
          style: Styles.textStyle14.copyWith(
            color: Colors.grey[500],
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
