import 'package:flutter/material.dart';

import '../screens/artical_details_view.dart';

class VerticalCard extends StatelessWidget {
  VerticalCard(
      {required this.newsCategory,
      required this.newsImageUrl,
      required this.newsTitle,
      required this.time,
      required this.content,
      required this.source,
      this.pageName});

  String newsImageUrl;
  String newsTitle;
  String newsCategory;
  String time;
  String content;
  String source;
  String? pageName;

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
              pageName: pageName,
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
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        newsCategory,
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        newsTitle,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2),
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
                            color: Colors.grey,
                            size: 14.0,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            time,
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 80,
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(newsImageUrl),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
