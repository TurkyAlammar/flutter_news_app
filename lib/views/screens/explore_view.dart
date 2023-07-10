import 'package:flutter/material.dart';
import 'package:news_app/views/screens/search_result_view.dart';

import '../../view_models/explore_view_model_.dart';
import '../widgets/bottomNavigator.dart';
import '../widgets/heading_widget.dart';
import '../widgets/row_source_cards.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  int selected_item = 1;
  TextEditingController _textEditingController = TextEditingController();
  String searchText = "";
  ExploreViewModel exploreViewMoel = ExploreViewModel();

  bool isLoaded = false;

  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  void getData() async {
    if (await exploreViewMoel.getSources()) {
      setState(() {
        isLoaded = true;
      });
    }
  }

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
          selected_item: selected_item,
        ),
        body: Visibility(
          visible: isLoaded,
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              child: SearchBar(
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
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.grey[200],
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  heading_widget(
                    label: "Explore Sources",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: RowSourceCards(
                      sourceInfoList: exploreViewMoel.exploreList,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
