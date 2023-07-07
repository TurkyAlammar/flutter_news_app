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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                CategoriesButtonListSlider(),
                SizedBox(
                  height: 30,
                ),
                heading_widget(
                    label: Home_View_Model.home_model.tranding_news_title),
                SizedBox(
                  height: 30,
                ),
                HorizontalCardListSlider(),
                SizedBox(
                  height: 30,
                ),
                heading_widget(
                    label: Home_View_Model.home_model.latest_news_title),
                SizedBox(
                  height: 30,
                ),
                VerticalCardListSlider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
