import '../models/search_result_model.dart';
import '../repositories/news/news_api.dart';
import 'package:timeago/timeago.dart' as timeago;

class SearchRuesltViewModel {
  var SearchModel = SearchRuesltModel();

  List<Map<String, String>> searchNewsCard = [];

  Future<bool> getSearchResult(String category, String search_text) async {
    String categoryArg = category == "all" ? "" : "&category=$category";
    String searchTextArg = search_text == "" ? "" : "q=$search_text";
    List<SearchRuesltModel> serchRuestList =
        await NewsApiCall().getSearchResults(categoryArg, searchTextArg);

    if (serchRuestList != null || !serchRuestList.isEmpty) {
      for (int i = 0; i < serchRuestList.length; i++) {
        if (serchRuestList[i] != null &&
            serchRuestList[i].newsImageUrl != null &&
            serchRuestList[i].content != null &&
            serchRuestList[i].source != null) {
          searchNewsCard.add({
            "newsCategory": category,
            "newsTitle": serchRuestList[i].newsTitle!,
            "time": timeago
                .format(DateTime.parse(serchRuestList[i].publishedTime!))
                .toString(),
            "newsImageUrl": serchRuestList[i].newsImageUrl!,
            "content": serchRuestList[i].content!,
            "source": serchRuestList[i].source!,
          });
        }
      }
    }

    return serchRuestList != null;
  }
}
