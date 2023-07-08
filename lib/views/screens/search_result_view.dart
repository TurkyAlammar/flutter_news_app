import 'package:flutter/material.dart';

import '../../view_models/search_result_view_model.dart';
import '../widgets/Vertical_card_list_slider.dart';
import '../widgets/heading_widget.dart';

class SearchResult extends StatefulWidget {
  SearchResult({required this.category, required this.SearchText});

  String category;
  String SearchText;
  @override
  State<SearchResult> createState() =>
      _SearchResultState(category: category, SearchText: SearchText);
}

class _SearchResultState extends State<SearchResult> {
  _SearchResultState({required this.category, required this.SearchText});
  String category;
  String SearchText;

  var Search_View_Model = SearchRuesltViewModel();
  bool isLoaded = false;
  TextEditingController _textEditingController = TextEditingController();
  //late Map<String, dynamic> post;
  @override
  initState() {
    super.initState();
    getData();
    // ignore: avoid_print
  }

  void getData() async {
    await Search_View_Model.getSearchResult(category, SearchText);
    if (Search_View_Model.getSearchResult(category, SearchText) != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  int selected_item = 1;

  @override
  Widget build(BuildContext context) {
    print("eeeeeee");
    //print(Home_View_Model.latestNewsCards);

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
        body: Visibility(
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
          visible: isLoaded,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SearchBar(
                    backgroundColor: MaterialStateProperty.all(Colors.grey[50]),
                    leading: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        if (_textEditingController.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchResult(
                                category: "all",
                                SearchText: _textEditingController.text,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    elevation: MaterialStateProperty.all(0.0),
                    hintText: SearchText,
                    hintStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.grey),
                    ),
                    controller: _textEditingController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      heading_widget(
                        label: Search_View_Model.SearchModel.Ruselt_title,
                      ),
                      Text(
                          "${Search_View_Model.SearchNewsCard.length} articles found")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  VerticalCardListSlider(
                      latestNews: Search_View_Model.SearchNewsCard),
                  ButtonBar()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
