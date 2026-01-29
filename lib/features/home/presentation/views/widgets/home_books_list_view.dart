import 'package:bookly/core/widgets/animated_loading_indicator.dart';
import 'package:bookly/core/widgets/animated_no_connection.dart';
import 'package:bookly/features/home/presentation/view_model/home_books_cubit/home_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeBooksListView extends StatelessWidget {
  const HomeBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBooksCubit, HomeBooksState>(
      builder: (context, state) {
        if (state is HomeBooksSuccess) {
          if (state.books.isEmpty) {
            return const Center(child: Text('No books found'));
          }

          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).push('/bookDetailsView', extra: state.books[index]);
                      },
                      child: CustomBookImage(
                        imageUrl:
                            state
                                .books[index]
                                .volumeInfo
                                .imageLinks
                                ?.thumbnail ??
                            "",
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is HomeBooksFailure) {
          // return CustomErrorWidget(errMessage: state.errMessage);
          return Column(
            children: [
              SizedBox(height: 32),
              AnimatedNoConnection(),
              SizedBox(height: 16),

              // CustomErrorWidget(errMessage: state.errMessage),
            ],
          );
        } else {
          return AnimatedLoadingIndicator();
        }
      },
    );
  }
}
