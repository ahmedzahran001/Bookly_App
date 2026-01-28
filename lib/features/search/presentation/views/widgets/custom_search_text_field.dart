import 'package:bookly/constans.dart';
import 'package:bookly/features/search/presentation/view_models/search_books_cubit/search_books_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/animated_no_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        context.read<SearchBooksCubit>().searchBooks(bookName: value);
      },

      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        filled: true,

        enabledBorder: buildOutLineInputBorder(),
        focusedBorder: buildOutLineInputBorder(),

        prefixIcon: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey[500], size: 23),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        hintText: 'Search',
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey[500],
          fontWeight: FontWeight.w500,
        ),

        suffixIcon: IconButton(
          onPressed: () {
            final value = controller.text;
            if (value.isNotEmpty) {
              context.read<SearchBooksCubit>().searchBooks(bookName: value);
            }

            // if (value.isEmpty) {
            //   showDialog(
            //     context: context,
            //     builder: (context) =>
            //         const Center(child: AnimatedNoResultsWidget()),
            //   );
            // } else {
            //   context.read<SearchBooksCubit>().searchBooks(bookName: value);
            // }
          },
          icon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 18,
            color: Colors.grey[500],
          ),
        ),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFEC4F9D)),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
