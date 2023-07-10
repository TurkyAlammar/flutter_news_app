import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/explore_model.dart';
import '../../models/home_model.dart';
import '../../models/search_result_model.dart';

class NewsApiCall {
  Future<List<HomeModel>> getPosts(String category) async {
    List<HomeModel> newsPosts = [];
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us$category&apiKey=08bb1529624f4d2692f2f272778da3ab');
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body);
      List<dynamic> articles = responsebody['articles'];
      newsPosts = articles.map((article) {
        return HomeModel.fromJson(article);
      }).toList();
    } catch (e) {
      print(e);
    }
    return newsPosts;
  }

  Future<List<SearchRuesltModel>> getSearchResults(
      String category, String search_text) async {
    List<SearchRuesltModel> searchRuesltList = [];

    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/everything?$search_text$category&apiKey=08bb1529624f4d2692f2f272778da3ab');

      var response = await http.get(url);
      var responsebody = jsonDecode(response.body);
      List<dynamic> articles = responsebody['articles'];
      searchRuesltList = articles.map((article) {
        return SearchRuesltModel.fromJson(article);
      }).toList();
    } catch (e) {
      print(e);
    }
    return searchRuesltList;
  }

  Future<List<ExploreModel>> getSources() async {
    List<ExploreModel> sourcesList = [];

    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines/sources?apiKey=08bb1529624f4d2692f2f272778da3ab');

      var response = await http.get(url);
      var responsebody = jsonDecode(response.body);

      List<dynamic> sources = responsebody['sources'];
      sourcesList = sources.map((sources) {
        return ExploreModel.fromJson(sources);
      }).toList();
    } catch (e) {
      print(e);
    }
    return sourcesList;
  }
}
