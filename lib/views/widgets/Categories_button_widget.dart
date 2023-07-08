import 'package:flutter/material.dart';

import '../screens/home_view.dart';

class CategoriesButton extends StatelessWidget {
  CategoriesButton(
      {required this.label, required this.colr, required this.font_color});
  String label;
  Color colr;
  Color font_color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: TextButton(
          child: Text(
            label,
            style: TextStyle(fontSize: 13, color: font_color),
          ),
          style: TextButton.styleFrom(
            backgroundColor: colr,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black),
            ),
          ),
          onPressed: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Home(category: label);
                }))
              }),
    );
  }
}
