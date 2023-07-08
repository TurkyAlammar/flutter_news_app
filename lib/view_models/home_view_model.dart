import '../models/home_model.dart';
import '../repositories/news/news_api.dart';
import '../views/widgets/Vertical_card_widget.dart';

class HomeViewModel {
  var home_model = HomeModel();

  List<Map<String, String>> latestNewsCards = [];

  Future<bool> getListOfLatestNewsCards() async {
    List<HomeModel> latestNews = await newsApiCall().getLatestPost();

    if (latestNews != null || !latestNews.isEmpty) {
      for (HomeModel item in latestNews) {
        if (item != null && item.newsImageUrl != null) {
          print("vvvvvvvvvvvvvvvvvvvvv");
          latestNewsCards.add({
            "newsCategory": "not found",
            "newsTitle": item.newsTitle!,
            "time": item.publishedTime!,
            "newsImageUrl": item.newsImageUrl!,
            "content": item.content!,
          });
        }
      }
    }

    return latestNewsCards != null;
  }
}
