import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/view_model/home_books_cubit/home_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBooksListView extends StatelessWidget {
  const HomeBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBooksCubit, HomeBooksState>(
      builder: (context, state) {
        if (state is HomeBooksSuccess) { 
          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: CustomBookImage(),
                  );
                },
              ),
            ),
          );
        } else if (state is HomeBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
