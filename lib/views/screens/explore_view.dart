import 'package:flutter/material.dart';

import '../widgets/BottomNavigator.dart';
import '../widgets/heading_widget.dart';
import '../widgets/sourceCard.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  int selected_item = 1;
  TextEditingController _textEditingController = TextEditingController();
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
          selected_item: selected_item,
        ),
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: SearchBar(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SourceCard(),
                    SourceCard(),
                    SourceCard(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SourceCard(),
                    SourceCard(),
                    SourceCard(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SourceCard(),
                    SourceCard(),
                    SourceCard(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
