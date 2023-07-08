import 'package:flutter/material.dart';

import '../screens/Artical_details.dart';

class VerticalCard extends StatelessWidget {
  VerticalCard({
    required this.newsCategory,
    required this.newsImageUrl,
    required this.newsTitle,
    required this.time,
    required this.content,
  });
  String newsImageUrl;
  String newsTitle;
  String newsCategory;
  String time;
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
              content: content,
            ),
          ),
        );
      },
      focusColor: Colors.black38,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // if you need this
          side: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Image(
                  image: NetworkImage(newsImageUrl),
                  height: 80,
                  width: 80,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        newsCategory,
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        newsTitle,
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.left,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_alarm,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            time,
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
