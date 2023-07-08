import 'package:flutter/material.dart';

class CategoriesButton extends StatelessWidget {
  CategoriesButton({required this.label});
  String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: TextButton(
          child: Text(
            label,
            style: TextStyle(fontSize: 13, color: Colors.black),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.all(15),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black),
              ),
            ),
          ),
          onPressed: () => null),
    );
  }
}
