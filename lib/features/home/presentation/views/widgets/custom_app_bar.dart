import 'package:bookly/constans.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 4, bottom: 16),
      child: Row(
        children: [
          Image.asset(kLogo, height: 24),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push('/searchView');
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 23,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
