import 'package:flutter/material.dart';
import 'package:news_app/views/screens/favorite_article_view.dart';
import 'package:news_app/views/screens/search_result_view.dart';
import 'views/screens/home_view.dart';
import 'views/screens/artical_details_view.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      initialRoute: "/",
      routes: {
        "/": (context) => Home(category: "all"),
        "ArticalDetails": (context) => ArticalDetails(
              newsImageUrl: "",
              newsTitle: "",
              newsCategory: "",
              content: "",
              source: "",
              time: "",
            ),
        "SearchResult": (context) =>
            SearchResult(category: "all", SearchText: ""),
        "FavoriteArticle": (context) => FavoriteArticle(),
      },
    );
  }
}
