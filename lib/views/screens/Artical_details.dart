import 'package:flutter/material.dart';

class ArticalDetails extends StatelessWidget {
  ArticalDetails({
    required this.newsCategory,
    required this.newsImageUrl,
    required this.newsTitle,
    required this.content,
  });
  String newsImageUrl;
  String newsTitle;
  String newsCategory;
  String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.more_horiz),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "source",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                newsTitle,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Image(
                image: NetworkImage(
                  newsImageUrl,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                content,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
