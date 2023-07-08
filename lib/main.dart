import 'package:flutter/material.dart';
import 'views/screens/home_view.dart';
import 'views/screens/Artical_details.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      initialRoute: "/",
      routes: {
        "/": (context) => Home(),
        "ArticalDetails": (context) => ArticalDetails(
              newsImageUrl: "",
              newsTitle: "",
              newsCategory: "",
              content: "",
            ),
      },
    );
  }
}
