import 'package:flutter/material.dart';
import 'Vertical_card_widget.dart';

class VerticalCardListSlider extends StatelessWidget {
  VerticalCardListSlider({required this.latestNews, this.page});
  String? page;
  int index = 0;

  //List<VerticalCard> VerticalCards;
  List<Map<String, String>> latestNews;
  @override
  Widget build(BuildContext context) {
    List<VerticalCard> getListOfVerticalCards() {
      List<VerticalCard> verticalCards = [];
      if (page == "homePage") {
        index = 4;
      }
      for (int i = index; i < latestNews.length; i++) {
        verticalCards.add(VerticalCard(
          newsImageUrl: latestNews[i]['newsImageUrl'].toString(),
          newsTitle: latestNews[i]['newsTitle'].toString(),
          newsCategory: latestNews[i]['newsCategory'].toString(),
          time: latestNews[i]['time'].toString(),
          content: latestNews[i]["content"].toString(),
          source: latestNews[i]["source"].toString(),
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
