import '../models/home_model.dart';
import '../repositories/news/news_api.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeViewModel {
  var home_model = HomeModel();

  List<Map<String, String>> latestNewsCards = [];

  Future<bool> getListOfLatestNewsCards(String category) async {
    String category_arg = category == "all" ? "" : "&category=$category";
    List<HomeModel> latestNews =
        await newsApiCall().getLatestPost(category_arg);

    if (latestNews != null || !latestNews.isEmpty) {
      for (int i = 0; i < latestNews.length; i++) {
        if (latestNews[i] != null &&
            latestNews[i].newsImageUrl != null &&
            latestNews[i].content != null &&
            latestNews[i].source != null) {
          latestNewsCards.add({
            "newsCategory": category,
            "newsTitle": latestNews[i].newsTitle!,
            "time": timeago
                .format(DateTime.parse(latestNews[i].publishedTime!))
                .toString(),
            "newsImageUrl": latestNews[i].newsImageUrl!,
            "content": latestNews[i].content!,
            "source": latestNews[i].source!,
          });
        }
      }
    }

    return latestNewsCards != null;
  }
}
