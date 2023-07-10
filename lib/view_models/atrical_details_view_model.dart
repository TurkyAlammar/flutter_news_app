import 'package:news_app/models/artical_details_model.dart';

class ArticalDetailsViewModel {
  var articalModel = ArticalDetailsModel();

  static setFavoriteListItems(Map<String, String> atricle) {
    for (Map<String, String> listItem in ArticalDetailsModel.favoriteList) {
      if (listItem['newsTitle'] == atricle['newsTitle']) {
        return;
      }
    }
    ArticalDetailsModel.favoriteList.add(atricle);
  }

  static deleteFromFavoriteListItems(String newsTitle) {
    for (int i = 0; i < ArticalDetailsModel.favoriteList.length; i++) {
      if (ArticalDetailsModel.favoriteList[i]['newsTitle'] == newsTitle) {
        ArticalDetailsModel.favoriteList
            .remove(ArticalDetailsModel.favoriteList[i]);
      }
    }
  }
}
