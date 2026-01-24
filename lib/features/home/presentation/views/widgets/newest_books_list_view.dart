import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return NewestBookListViewItem(bookModel: state.books[index]);
            }, childCount: state.books.length),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 250),
              child: CustomErrorWidget(errMessage: state.errMessage),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 250),
              child: CustomLoadingIndicator(),
            ),
          );
        }
      },
    );
  }
}
