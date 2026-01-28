import 'package:bookly/constans.dart';
import 'package:bookly/core/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestBookListViewItem extends StatelessWidget {
  const NewestBookListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push('/bookDetailsView', extra: bookModel);
        },
        child: SizedBox(
          height: 140,
          child: Row(
            children: [
              CustomBookImage(
                imageUrl:
                    bookModel.volumeInfo.imageLinks?.thumbnail ??
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7tXrGlHXTOohTFIStW0SbGZ_FINaWFC6vOQ&s",
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      // height: 58,
                      width: MediaQuery.of(context).size.width * 0.64,
                      child: Text(
                        bookModel.volumeInfo.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20.copyWith(
                          fontFamily: kGtSectraFine,
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      bookModel.volumeInfo.authors?[0] ?? 'Unknown',

                      style: Styles.textStyle14.copyWith(
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // const SizedBox(width: 80),
                        const Spacer(),
                        BookRating(
                          rating: bookModel.volumeInfo.pageCount ?? 0,
                          count: bookModel.volumeInfo.pageCount ?? 0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
