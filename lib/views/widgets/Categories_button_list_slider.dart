import 'package:flutter/material.dart';
import 'Categories_button_widget.dart';

class CategoriesButtonListSlider extends StatelessWidget {
  CategoriesButtonListSlider({required this.categories});
  List<String> categories;
  @override
  Widget build(BuildContext context) {
    List<CategoriesButton> getListOfCategoryButtons() {
      List<CategoriesButton> categoriesButtons = [];
      for (String item in categories) {
        categoriesButtons.add(CategoriesButton(label: item));
      }
      return categoriesButtons;
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getListOfCategoryButtons(),
      ),
    );
  }
}
