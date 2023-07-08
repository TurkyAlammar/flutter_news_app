import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/home_model.dart';

class newsApiCall {
  Future<List<HomeModel>> getLatestPost() async {
    List<HomeModel> latestNews = [];
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/everything?q=bitcoin&apiKey=08bb1529624f4d2692f2f272778da3ab');
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body);
      List<dynamic> articles = responsebody['articles'];
      print(articles);
      latestNews = articles.map((article) {
        print(article);
        return HomeModel.fromJson(article);
      }).toList();
    } catch (e) {
      print(e);
    }
    return latestNews;
  }
}
