import 'package:flutter/material.dart';

class VerticalCard extends StatelessWidget {
  const VerticalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                image: NetworkImage(
                    "https://media.istockphoto.com/id/511061090/photo/business-office-building-in-london-england.jpg?s=612x612&w=0&k=20&c=nYAn4JKoCqO1hMTjZiND1PAIWoABuy1BwH1MhaEoG6w="),
                height: 80,
                width: 80,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Technology",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Data breakdown: How to Ride Dips",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_alarm,
                        color: Colors.black,
                        size: 20.0,
                      ),
                      Text(
                        "Technology",
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
