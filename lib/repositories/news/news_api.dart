import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/home_model.dart';
import '../../models/search_result_model.dart';

class newsApiCall {
  Future<List<HomeModel>> getLatestPost(String category) async {
    List<HomeModel> latestNews = [];
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us$category&apiKey=08bb1529624f4d2692f2f272778da3ab');
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body);
      List<dynamic> articles = responsebody['articles'];
      latestNews = articles.map((article) {
        return HomeModel.fromJson(article);
      }).toList();
    } catch (e) {
      print(e);
    }
    return latestNews;
  }

  Future<List<SearchRuesltModel>> getSearchResults(
      String category, String search_text) async {
    List<SearchRuesltModel> searchRuesltList = [];

    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/everything?$search_text$category&apiKey=08bb1529624f4d2692f2f272778da3ab');
      print(url);
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body);
      //print(responsebody);
      List<dynamic> articles = responsebody['articles'];
      searchRuesltList = articles.map((article) {
        return SearchRuesltModel.fromJson(article);
      }).toList();
      print("result = =");
      print(searchRuesltList[0].newsTitle);
    } catch (e) {
      print(e);
    }
    return searchRuesltList;
  }
}
