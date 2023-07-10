import 'package:flutter/material.dart';

class SourceCard extends StatelessWidget {
  SourceCard({
    required this.label,
  });
  String label;

  @override
  Widget build(BuildContext context) {
    String shortTitle = label;
    if (label.length > 9) {
      shortTitle = "${label.substring(0, 8)}...";
    }
    return Container(
      padding: EdgeInsets.only(left: 10, top: 12, right: 10, bottom: 12),
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
              image:
                  NetworkImage("https://newsapi.org/images/n-logo-border.png"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            shortTitle,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
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
