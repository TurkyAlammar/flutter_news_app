class ArticalDetailsModel {
  static List<Map<String, String>> Favorite_list = [];

  List<Map<String, String>> getAllFavList(String listFilter) {
    List<Map<String, String>> allFavList = [];
    if (listFilter != "") {
      for (Map<String, String> item in ArticalDetailsModel.Favorite_list) {
        if (item["newsTitle"]!.contains(listFilter)) {
          allFavList.add(item);
        }
      }
      return allFavList;
    }
    return ArticalDetailsModel.Favorite_list;
  }
}
