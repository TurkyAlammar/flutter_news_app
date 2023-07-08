import 'package:flutter/material.dart';
import '../widgets/heading_widget.dart';
import '../widgets/Vertical_card_list_slider.dart';
import '../widgets/Horizontal_card_list_slider.dart';
import '../widgets/Categories_button_list_slider.dart';
import '../../view_models/home_view_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var Home_View_Model = HomeViewModel();
  bool isLoaded = false;
  //late Map<String, dynamic> post;
  @override
  initState() {
    super.initState();
    getData();
    // ignore: avoid_print
  }

  void getData() async {
    await Home_View_Model.getListOfLatestNewsCards();
    if (Home_View_Model.getListOfLatestNewsCards() != null) {
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
                  Text(
                    Home_View_Model.home_model.page_title,
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    Home_View_Model.home_model.page_current_time,
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SearchBar(),
                  SizedBox(
                    height: 30,
                  ),
                  CategoriesButtonListSlider(
                    categories: Home_View_Model.home_model.categories,
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
                      latestNews: Home_View_Model.latestNewsCards),
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
