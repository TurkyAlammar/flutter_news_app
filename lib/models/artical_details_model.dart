class ArticalDetailsModel {
  static List<Map<String, String>> favoriteList = [];

  List<Map<String, String>> getAllFavList(String listFilter) {
    List<Map<String, String>> allFavList = [];
    if (listFilter != "") {
      for (Map<String, String> item in ArticalDetailsModel.favoriteList) {
        if (item["newsTitle"]!.contains(listFilter)) {
          allFavList.add(item);
        }
      }
      return allFavList;
    }
    return ArticalDetailsModel.favoriteList;
  }
}
