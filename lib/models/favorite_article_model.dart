import 'Artical_details_model.dart';

class FavoriteArticleModel {
  FavoriteArticleModel(
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

  var DetailsModel = ArticalDetailsModel();

  FavoriteArticleModel.fromJson(Map<String, dynamic> json) {
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

  String Ruselt_title = "Results";
}
