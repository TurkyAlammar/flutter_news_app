import 'package:flutter/material.dart';
import 'Categories_button_widget.dart';

class CategoriesButtonListSlider extends StatelessWidget {
  const CategoriesButtonListSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CategoriesButton(label: "Technology"),
          CategoriesButton(label: "Technology"),
          CategoriesButton(label: "Technology"),
          CategoriesButton(label: "Technology"),
          CategoriesButton(label: "Technology"),
        ],
      ),
    );
  }
}
