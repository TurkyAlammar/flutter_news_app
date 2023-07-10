import 'package:flutter/material.dart';
import 'package:news_app/views/widgets/sourceCard.dart';

class RowSourceCards extends StatelessWidget {
  RowSourceCards({required this.sourceInfoList});

  List<Map<String, String>> sourceInfoList;
  List<SourceCard> sourceCardList = [];

  @override
  Widget build(BuildContext context) {
    for (Map<String, String> sourceItem in sourceInfoList) {
      sourceCardList.add(
        SourceCard(
          label: sourceItem["sourceName"].toString(),
        ),
      );
    }

    return Wrap(spacing: 10, runSpacing: 10, children: sourceCardList);
  }
}
