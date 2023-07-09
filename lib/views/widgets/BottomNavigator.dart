import 'package:flutter/material.dart';
import 'package:news_app/views/screens/explore_view.dart';

import '../screens/favorite_article_view.dart';
import '../screens/home_view.dart';

class ButtomNavigator extends StatelessWidget {
  ButtomNavigator({
    required this.selected_item,
  });

  int selected_item;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
        selected_item = i;
        print("selected_item$i");

        if (selected_item == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(category: "all"),
            ),
          );
        } else if (selected_item == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExploreView(),
            ),
          );
        } else if (selected_item == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoriteArticle(),
            ),
          );
        }
      },
    );
  }
}
