import 'package:flutter/material.dart';

class heading_widget extends StatelessWidget {
  heading_widget({required this.label});
  String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: Colors.black),
      textAlign: TextAlign.left,
    );
  }
}
