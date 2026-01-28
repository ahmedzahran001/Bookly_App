import 'package:bookly/constans.dart';
import 'package:bookly/core/styles.dart';
import 'package:bookly/core/widgets/animated_loading_indicator.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/features/search/presentation/view_models/search_books_cubit/search_books_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/animated_no_result.dart';
import 'package:bookly/features/search/presentation/views/widgets/animated_search_loading.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomSearchTextField(controller: searchController),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 16),
          child: Text('Search Result', style: Styles.textStyle18),
        ),
        const SizedBox(height: 8),

        Expanded(
          child: BlocBuilder<SearchBooksCubit, SearchBooksState>(
            builder: (context, state) {
              if (searchController.text.isEmpty &&
                  state is SearchBooksInitialState) {
                return Center(child: AnimatedSearchLoading());
              }
              if (state is SearchBooksLoadingState) {
                return Center(child: AnimatedLoadingIndicator());
              }

              if (state is SearchBooksSuccessState) {
                if (searchController.text.isEmpty) {
                  return const Center(child: AnimatedNoResultsWidget());
                }

                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  // physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    final bookModel = state.books[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 8,
                        bottom: 8,
                        right: 16,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(
                            context,
                          ).push('/bookDetailsView', extra: bookModel);
                        },
                        child: SizedBox(
                          height: 140,
                          child: Row(
                            children: [
                              CustomBookImage(
                                imageUrl:
                                    bookModel
                                        .volumeInfo
                                        .imageLinks
                                        ?.thumbnail ??
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7tXrGlHXTOohTFIStW0SbGZ_FINaWFC6vOQ&s",
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      // height: 58,
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.64,
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
                                      bookModel.volumeInfo.authors?[0] ??
                                          'Unknown',

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
                                        // const SizedBox(width: 100),
                                        const Spacer(),
                                        BookRating(
                                          rating:
                                              bookModel.volumeInfo.pageCount ??
                                              0,
                                          count:
                                              bookModel.volumeInfo.pageCount ??
                                              0,
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
                  },
                );
              }

              if (state is SearchBooksFailureState) {
                return Center(
                  child: CustomErrorWidget(errMessage: state.errMessage),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
