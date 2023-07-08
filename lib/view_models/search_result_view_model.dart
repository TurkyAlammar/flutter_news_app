import '../models/search_result_model.dart';
import '../repositories/news/news_api.dart';
import 'package:timeago/timeago.dart' as timeago;

class SearchRuesltViewModel {
  var SearchModel = SearchRuesltModel();

  List<Map<String, String>> SearchNewsCard = [];

  Future<bool> getSearchResult(String category, String search_text) async {
    String category_arg = category == "all" ? "" : "&category=$category";
    String search_text_arg = search_text == "" ? "" : "q=$search_text";
    print("hereee");
    print(category);
    print(search_text);
    List<SearchRuesltModel> serchRuestList =
        await newsApiCall().getSearchResults(category_arg, search_text_arg);

    if (serchRuestList != null || !serchRuestList.isEmpty) {
      for (int i = 0; i < serchRuestList.length; i++) {
        if (serchRuestList[i] != null &&
            serchRuestList[i].newsImageUrl != null &&
            serchRuestList[i].content != null &&
            serchRuestList[i].source != null) {
          SearchNewsCard.add({
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
