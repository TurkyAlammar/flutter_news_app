import 'package:flutter/material.dart';

import '../../view_models/atrical_details_view_model.dart';
import 'favorite_article_view.dart';

class ArticalDetails extends StatefulWidget {
  ArticalDetails(
      {required this.newsCategory,
      required this.newsImageUrl,
      required this.newsTitle,
      required this.content,
      required this.source,
      required this.time,
      this.pageName});
  String newsImageUrl;
  String newsTitle;
  String newsCategory;
  String content;
  String source;
  String time;
  String? pageName;

  @override
  State<ArticalDetails> createState() => _ArticalDetailsState(
      newsCategory: newsCategory,
      newsImageUrl: newsImageUrl,
      newsTitle: newsTitle,
      content: content,
      source: source,
      time: time,
      pageName: pageName);
}

class _ArticalDetailsState extends State<ArticalDetails> {
  _ArticalDetailsState(
      {required this.newsCategory,
      required this.newsImageUrl,
      required this.newsTitle,
      required this.content,
      required this.source,
      required this.time,
      this.pageName});

  String newsImageUrl;
  String newsTitle;
  String newsCategory;
  String content;
  String source;
  String time;
  String? pageName;
  String menuLabel = "add the article to favorite list";
  String menuValue = "add";

  var Artical_details_view_model = ArticalDetailsViewModel();
  @override
  Widget build(BuildContext context) {
    if (pageName != null && pageName == "favPage") {
      menuLabel = "delete the article from favorite list";
      menuValue = "delete";
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          PopupMenuButton(
            onSelected: (item) {
              setState(() {
                if (item == "add") {
                  ArticalDetailsViewModel.setFavoriteListItems({
                    "newsImageUrl": newsImageUrl,
                    "newsTitle": newsTitle,
                    "newsCategory": newsCategory,
                    "content": content,
                    "source": source,
                    "time": time,
                  });
                } else if (item == "delete") {
                  ArticalDetailsViewModel.deleteFromFavoriteListItems(
                      newsTitle);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoriteArticle(),
                    ),
                  );
                }
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                value: menuValue,
                child: Text(menuLabel),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                source,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                newsTitle,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Image(
                image: NetworkImage(
                  newsImageUrl,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                content,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
