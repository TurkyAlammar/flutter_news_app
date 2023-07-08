import 'package:flutter/material.dart';
import '../screens/Artical_details.dart';

class HorizontalCard extends StatelessWidget {
  HorizontalCard(
      {required this.newsCategory,
      required this.newsImageUrl,
      required this.newsTitle,
      required this.content});
  String newsImageUrl;
  String newsTitle;
  String newsCategory;
  String content;

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
                content: content,),
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
          width: 271,
          height: 278,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: NetworkImage(newsImageUrl),
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
                  style: TextStyle(color: Colors.black),
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
