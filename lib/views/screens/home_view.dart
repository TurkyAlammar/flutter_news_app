import 'package:flutter/material.dart';
import 'package:news_app/views/screens/search_result_view.dart';
import '../widgets/BottomNavigator.dart';
import '../widgets/heading_widget.dart';
import '../widgets/Vertical_card_list_slider.dart';
import '../widgets/Horizontal_card_list_slider.dart';
import '../widgets/Categories_button_list_slider.dart';
import '../../view_models/home_view_model.dart';
import 'favorite_article_view.dart';

class Home extends StatefulWidget {
  Home({required this.category});

  String category;
  @override
  State<Home> createState() => _HomeState(category: category);
}

class _HomeState extends State<Home> {
  _HomeState({required this.category});
  String category;
  var Home_View_Model = HomeViewModel();
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
    await Home_View_Model.getListOfLatestNewsCards(category);
    if (Home_View_Model.getListOfLatestNewsCards(category) != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  int selected_item = 0;

  @override
  Widget build(BuildContext context) {
    print("eeeeeee");
    //print(Home_View_Model.latestNewsCards);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ButtomNavigator(selected_item: selected_item),
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
                  Text(
                    Home_View_Model.home_model.page_title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Home_View_Model.home_model.page_current_time,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 30,
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
                    hintText: "Search on Everything...",
                    hintStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.grey),
                    ),
                    controller: _textEditingController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CategoriesButtonListSlider(
                    categories: Home_View_Model.home_model.categories,
                    current_category: category,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  heading_widget(
                      label: Home_View_Model.home_model.tranding_news_title),
                  SizedBox(
                    height: 30,
                  ),
                  HorizontalCardListSlider(
                    trendingNews: Home_View_Model.latestNewsCards,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  heading_widget(
                      label: Home_View_Model.home_model.latest_news_title),
                  SizedBox(
                    height: 30,
                  ),
                  VerticalCardListSlider(
                    latestNews: Home_View_Model.latestNewsCards,
                    page: "homePage",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
