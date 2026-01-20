import 'package:bookly/core/styles.dart';
import 'package:bookly/features/home/data/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/data/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/home/data/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.21),
            child: CustomBookImage(),
          ),
          const SizedBox(height: 32),
          Text(
            'Harry Potter and the \nHalf-Blood Prince',
            style: Styles.textStyle30.copyWith(
              height: 1.2,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            'J.K. Rowling',
            style: Styles.textStyle18.copyWith(
              color: Colors.grey[500],
              // fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 6),
          const BookRating(mainAxisAlignment: MainAxisAlignment.center),
        ],
      ),
    );
  }
}
