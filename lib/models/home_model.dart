import 'package:intl/intl.dart';

class HomeModel {
  HomeModel({
    this.newsImageUrl,
    this.newsTitle,
    this.publishedTime,
    this.content,
  });
  String? newsImageUrl;
  String? newsTitle;
  String? publishedTime;
  String? content;

  HomeModel.fromJson(Map<String, dynamic> json) {
    newsImageUrl = json['urlToImage'];
    newsTitle = json['title'];
    publishedTime = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJSON() {
    return {
      "newsImageUrl": newsImageUrl,
      "newsTitle": newsTitle,
      "publishedTime": publishedTime,
      "content": content,
    };
  }

  String page_title = "HeadLine";
  String page_current_time =
      "Today, " + DateFormat("MMMM, dd").format(DateTime.now()) + "rd";
  String categorie_text = "Technology"; //will be change in future
  String tranding_news_title = "Tranding";
  String latest_news_title = "Latest";

  List<String> categories = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7"
  ];

  final List<Map<String, String>> trendingNews = [
    {
      "newsImageUrl":
          "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA18CE5g.img?w=1920&h=1080&q=60&m=2&f=jpg",
      "newsTitle":
          "Al-Nassr announce arrival of Portuguese manager for Ronaldo",
      "newsCategory": "Football"
    },
    {
      "newsImageUrl":
          "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1dtSFG.img?w=800&h=415&q=60&m=2&f=jpg",
      "newsTitle": "The most iconic cars in cinematic and television history",
      "newsCategory": "Cars"
    },
    {
      "newsImageUrl":
          "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1dtSFG.img?w=800&h=415&q=60&m=2&f=jpg",
      "newsTitle": "10 Animals People Wish Were Pet Material But Sadly Aren't",
      "newsCategory": "Animals"
    }
  ];

  final List<Map<String, String>> latestNews = [
    {
      "newsImageUrl":
          "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA18CE5g.img?w=1920&h=1080&q=60&m=2&f=jpg",
      "newsTitle":
          "Al-Nassr announce arrival of Portuguese manager for Ronaldo",
      "newsCategory": "Football",
      "time": "14h ago"
    },
    {
      "newsImageUrl":
          "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1dtSFG.img?w=800&h=415&q=60&m=2&f=jpg",
      "newsTitle": "The most iconic cars in cinematic and television history",
      "newsCategory": "Cars",
      "time": "12h ago"
    },
    {
      "newsImageUrl":
          "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1dtSFG.img?w=800&h=415&q=60&m=2&f=jpg",
      "newsTitle": "10 Animals People Wish Were Pet Material But Sadly Aren't",
      "newsCategory": "Animals",
      "time": "10h ago"
    }
  ];
}
