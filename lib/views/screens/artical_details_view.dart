import 'package:flutter/material.dart';
import 'package:news_app/models/Artical_details_model.dart';

import '../../view_models/atrical_details_view_model.dart';

class ArticalDetails extends StatefulWidget {
  ArticalDetails(
      {required this.newsCategory,
      required this.newsImageUrl,
      required this.newsTitle,
      required this.content,
      required this.source,
      required this.time});
  String newsImageUrl;
  String newsTitle;
  String newsCategory;
  String content;
  String source;
  String time;

  @override
  State<ArticalDetails> createState() => _ArticalDetailsState(
      newsCategory: newsCategory,
      newsImageUrl: newsImageUrl,
      newsTitle: newsTitle,
      content: content,
      source: source,
      time: time);
}

class _ArticalDetailsState extends State<ArticalDetails> {
  _ArticalDetailsState(
      {required this.newsCategory,
      required this.newsImageUrl,
      required this.newsTitle,
      required this.content,
      required this.source,
      required this.time});

  String newsImageUrl;
  String newsTitle;
  String newsCategory;
  String content;
  String source;
  String time;

  var Artical_details_view_model = ArticalDetailsViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: [
          PopupMenuButton(
            // Callback that sets the selected popup menu item.
            onSelected: (item) {
              setState(() {
                ArticalDetailsViewModel.setFavoriteListItems({
                  "newsImageUrl": newsImageUrl,
                  "newsTitle": newsTitle,
                  "newsCategory": newsCategory,
                  "content": content,
                  "source": source,
                  "time": time,
                });
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: "add",
                child: Text('add the article to favorite list'),
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
