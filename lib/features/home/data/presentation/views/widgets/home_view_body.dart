import 'package:bookly/core/styles.dart';
import 'package:bookly/features/home/data/presentation/views/widgets/books_list_view.dart';
import 'package:bookly/features/home/data/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomeAppBar(),
        const BooksListView(),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 32),
          child: Text('Best Seller', style: Styles.titleMedium),
        ),
      ],
    );
  }
}
