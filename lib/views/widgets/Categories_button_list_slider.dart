import 'package:flutter/material.dart';
import 'Categories_button_widget.dart';

class CategoriesButtonListSlider extends StatelessWidget {
  CategoriesButtonListSlider(
      {required this.categories, required this.current_category});

  List<String> categories;
  String current_category;
  @override
  Widget build(BuildContext context) {
    List<CategoriesButton> getListOfCategoryButtons() {
      List<CategoriesButton> categoriesButtons = [];
      for (String item in categories) {
        if (item == current_category) {
          categoriesButtons.add(CategoriesButton(
              label: item, colr: Colors.black, font_color: Colors.white));
        } else {
          categoriesButtons.add(CategoriesButton(
              label: item,
              colr: Colors.grey.shade200,
              font_color: Colors.grey.shade400));
        }
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
