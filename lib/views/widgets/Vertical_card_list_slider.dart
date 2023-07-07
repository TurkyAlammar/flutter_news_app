import 'package:flutter/material.dart';
import 'Vertical_card_widget.dart';

class VerticalCardListSlider extends StatelessWidget {
  //List<VerticalCard> VerticalCards;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VerticalCard(),
          VerticalCard(),
          VerticalCard(),
        ],
      ),
    );
  }
}
