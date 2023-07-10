import 'package:flutter/material.dart';

import '../../view_models/favorite_article_view_model.dart';
import '../widgets/bottomNavigator.dart';
import '../widgets/Vertical_card_list_slider.dart';

class FavoriteArticle extends StatefulWidget {
  const FavoriteArticle({Key? key}) : super(key: key);

  @override
  State<FavoriteArticle> createState() => _FavoriteArticleState();
}

class _FavoriteArticleState extends State<FavoriteArticle> {
  int selected_item = 2;
  TextEditingController _textEditingController = TextEditingController();
  var FavoriteModelView = FavoriteArticleViewModel();
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        bottomNavigationBar: ButtomNavigator(
          selected_item: 2,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 15,
                ),
                SearchBar(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[50]),
                  leading: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        searchText = _textEditingController.text;
                      });
                    },
                  ),
                  elevation: MaterialStateProperty.all(0.0),
                  hintText: "Search in the list ...",
                  hintStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.grey),
                  ),
                  controller: _textEditingController,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${FavoriteModelView.favoriteModel.DetailsModel.getAllFavList(searchText).length} articles found",
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                VerticalCardListSlider(
                  latestNews: FavoriteModelView.favoriteModel.DetailsModel
                      .getAllFavList(searchText),
                  page: "favPage",
                ),
                ButtonBar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
