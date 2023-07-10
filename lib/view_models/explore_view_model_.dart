import '../models/explore_model.dart';
import '../repositories/news/news_api.dart';

class ExploreViewModel {
  var exploreModel = ExploreModel();
  List<Map<String, String>> exploreList = [];

  Future<bool> getSources() async {
    List<ExploreModel> sourceList = await NewsApiCall().getSources();

    if (sourceList != null || !sourceList.isEmpty) {
      for (int i = 0; i < sourceList.length; i++) {
        if (sourceList[i] != null && sourceList[i].sourceName != null) {
          exploreList.add({"sourceName": sourceList[i].sourceName!});
        }
      }
    }

    return exploreList != [];
  }
}
