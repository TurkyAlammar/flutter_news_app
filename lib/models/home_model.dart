import 'package:intl/intl.dart';

class HomeModel {
  HomeModel(
      {this.newsImageUrl,
      this.newsTitle,
      this.publishedTime,
      this.content,
      this.source});
  String? newsImageUrl;
  String? newsTitle;
  String? publishedTime;
  String? content;
  String? source;

  HomeModel.fromJson(Map<String, dynamic> json) {
    newsImageUrl = json['urlToImage'];
    newsTitle = json['title'];
    publishedTime = json['publishedAt'];
    content = json['content'];
    source = json['source']["name"];
  }

  Map<String, dynamic> toJSON() {
    return {
      "newsImageUrl": newsImageUrl,
      "newsTitle": newsTitle,
      "publishedTime": publishedTime,
      "content": content,
      "content": source,
    };
  }

  String page_title = "HeadLine";
  String page_current_time =
      "Today, " + DateFormat("MMMM, dd").format(DateTime.now()) + "rd";
  //String category = "all";
  String tranding_news_title = "Tranding";
  String latest_news_title = "Latest";

  List<String> categories = [
    "all",
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];
}
