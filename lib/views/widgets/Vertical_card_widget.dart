import 'package:flutter/material.dart';

import '../screens/artical_details_view.dart';

class VerticalCard extends StatelessWidget {
  VerticalCard(
      {required this.newsCategory,
      required this.newsImageUrl,
      required this.newsTitle,
      required this.time,
      required this.content,
      required this.source});

  String newsImageUrl;
  String newsTitle;
  String newsCategory;
  String time;
  String content;
  String source;

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
          borderRadius: BorderRadius.circular(20), // if you need this
          side: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                    image: NetworkImage(newsImageUrl),
                    height: 120,
                    width: 100,
                  ),
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
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        newsTitle,
                        style: TextStyle(color: Colors.black, fontSize: 14),
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
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
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
