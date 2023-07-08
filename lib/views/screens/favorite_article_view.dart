import 'package:flutter/material.dart';

import '../../view_models/favorite_article_view_model.dart';
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selected_item,
          unselectedLabelStyle:
              const TextStyle(color: Colors.black12, fontSize: 14),
          backgroundColor: const Color(0xFF084A76),
          fixedColor: Colors.black,
          unselectedItemColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (int i) {
            setState(() {
              selected_item = i;
              print("selected_item$i");
            });
          },
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
                      "${FavoriteModelView.FavoriteModel.DetailsModel.getAllFavList(searchText).length} articles found",
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                VerticalCardListSlider(
                    latestNews: FavoriteModelView.FavoriteModel.DetailsModel
                        .getAllFavList(searchText)),
                ButtonBar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
