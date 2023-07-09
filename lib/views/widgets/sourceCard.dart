import 'package:flutter/material.dart';

class SourceCard extends StatelessWidget {
  const SourceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 12, right: 20, bottom: 12),
      height: 160,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.grey[300],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white,
            ),
            child: Image(
              image: NetworkImage(
                  "https://seeklogo.com/images/B/bbc-news-logo-8648ABD044-seeklogo.com.png"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "BBC News",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 28,
            child: RawMaterialButton(
              elevation: 1,
              child: Text(
                "Explore",
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
              fillColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
