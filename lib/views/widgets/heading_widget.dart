import 'package:flutter/material.dart';

class heading_widget extends StatelessWidget {
  heading_widget({required this.label});
  String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    );
  }
}
