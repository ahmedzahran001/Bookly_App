import 'package:bookly/constans.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 10, top: 56, bottom: 32),
      child: Row(
        children: [
          Image.asset(kLogo, height: 24),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
