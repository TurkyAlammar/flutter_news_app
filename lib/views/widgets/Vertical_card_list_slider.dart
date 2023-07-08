import 'package:flutter/material.dart';
import 'Vertical_card_widget.dart';

class VerticalCardListSlider extends StatelessWidget {
  VerticalCardListSlider({required this.latestNews});
  //List<VerticalCard> VerticalCards;
  List<Map<String, String>> latestNews;
  @override
  Widget build(BuildContext context) {
    List<VerticalCard> getListOfVerticalCards() {
      List<VerticalCard> verticalCards = [];
      for (int i = 5; i < latestNews.length; i++) {
        verticalCards.add(VerticalCard(
          newsImageUrl: latestNews[i]['newsImageUrl'].toString(),
          newsTitle: latestNews[i]['newsTitle'].toString(),
          newsCategory: latestNews[i]['newsCategory'].toString(),
          time: latestNews[i]['time'].toString(),
          content: latestNews[i]["content"].toString(),
        ));
      }
      return verticalCards;
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: getListOfVerticalCards()),
    );
  }
}
