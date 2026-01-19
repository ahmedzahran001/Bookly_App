import 'package:bookly/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(FontAwesomeIcons.solidStar, color: const Color(0xffFFDD4F)),
        SizedBox(width: 8),
        Text('4.8', style: Styles.textStyle16),
        SizedBox(width: 8),
        Text(
          '(245)',
          style: Styles.textStyle14.copyWith(color: Colors.grey[500]),
        ),
      ],
    );
  }
}
