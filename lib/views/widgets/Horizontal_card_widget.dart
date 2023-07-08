import 'package:flutter/material.dart';
import '../screens/artical_details_view.dart';

class HorizontalCard extends StatelessWidget {
  HorizontalCard(
      {required this.newsCategory,
      required this.newsImageUrl,
      required this.newsTitle,
      required this.content,
      required this.source,
      required this.time});
  String newsImageUrl;
  String newsTitle;
  String newsCategory;
  String content;
  String source;
  String time;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticalDetails(
              newsImageUrl: newsImageUrl,
              newsTitle: newsTitle,
              newsCategory: newsCategory,
              content: content,
              source: source,
              time: time,
            ),
          ),
        );
      },
      focusColor: Colors.black38,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40), // if you need this
          side: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Container(
          color: Colors.white,
          width: 250,
          height: 280,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                    image: NetworkImage(newsImageUrl),
                    height: 120,
                    width: double.infinity,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  newsTitle,
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  newsCategory,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
