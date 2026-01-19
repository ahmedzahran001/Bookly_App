import 'package:bookly/constans.dart';
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
          child: Text('Best Seller', style: Styles.textStyle18),
        ),
        BestSellerListViewItem(),
      ],
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8),
      child: SizedBox(
        height: 140,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.8 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(kTestImage),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
