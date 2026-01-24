import 'package:bookly/core/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_action_buttons.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.21),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? "",
          ),
        ),
        const SizedBox(height: 32),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(
            height: 1.2,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Text(
          bookModel.volumeInfo.authors?[0] ?? "Unknown",
          style: Styles.textStyle18.copyWith(
            color: Colors.grey[500],
            // fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 6),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          count: bookModel.volumeInfo.pageCount ?? 0,
          rating: bookModel.volumeInfo.pageCount ?? 0,
        ),
        const SizedBox(height: 16),
        BooksActionButtons(bookModel: bookModel),
      ],
    );
  }
}
