import 'package:flutter/material.dart';
import 'Horizontal_card_widget.dart';

class HorizontalCardListSlider extends StatelessWidget {
  const HorizontalCardListSlider({
    super.key,
  });

  //list<HorizontalCard> HorizontalCards;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          HorizontalCard(),
          HorizontalCard(),
          HorizontalCard(),
        ],
      ),
    );
  }
}
