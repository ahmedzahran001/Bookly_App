import 'package:bookly/core/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_books_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    this.text1 = 'Popular',
    this.text2 = 'Newest',
  });
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomeAppBar(),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 12),
                child: Text(text1, style: Styles.textStyle18),
              ),
              const HomeBooksListView(),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Text(text2, style: Styles.textStyle18),
              ),
            ],
          ),
        ),

        const NewestBooksListView(),
      ],
    );
  }
}
