import 'package:flutter/material.dart';
import 'Horizontal_card_widget.dart';

class HorizontalCardListSlider extends StatelessWidget {
  HorizontalCardListSlider({required this.trendingNews});

  List<Map<String, String>> trendingNews;

  //list<HorizontalCard> HorizontalCards;
  @override
  Widget build(BuildContext context) {
    List<HorizontalCard> getListOfHorizontalCards() {
      List<HorizontalCard> horizontalCards = [];
      for (int i = 0; i <= 4; i++) {
        horizontalCards.add(HorizontalCard(
          newsImageUrl: trendingNews[i]['newsImageUrl'].toString(),
          newsTitle: trendingNews[i]["newsTitle"].toString(),
          newsCategory: trendingNews[i]["newsCategory"].toString(),
          content: trendingNews[i]["content"].toString(),
        ));
      }
      return horizontalCards;
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: getListOfHorizontalCards()),
    );
  }
}
