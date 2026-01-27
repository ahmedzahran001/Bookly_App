import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
   CustomSearchTextField({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      
      decoration: InputDecoration(
        fillColor: Colors.black,
        filled: true,

        enabledBorder: buildOutLineInputBorder(),
        focusedBorder: buildOutLineInputBorder(),

        hintText: 'Search',
        hintStyle: const TextStyle(color: Colors.white, fontSize: 16),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 16,
            color: Colors.white,
          ),
        ),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.deepPurple),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
