import 'package:news_app/models/Artical_details_model.dart';

class ArticalDetailsViewModel {
  var Artical_model = ArticalDetailsModel();

  static setFavoriteListItems(Map<String, String> atricle) {
    for (Map<String, String> listItem in ArticalDetailsModel.Favorite_list) {
      if (listItem['newsTitle'] == atricle['newsTitle']) {
        return;
      }
    }
    ArticalDetailsModel.Favorite_list.add(atricle);
  }
}
