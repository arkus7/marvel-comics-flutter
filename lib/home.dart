import 'package:flutter/material.dart';
import 'package:marvel_comics/comics_list_item.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemBuilder: (context, i) {
        return ComicsListItemWidget();
      }
    );
  }
}
