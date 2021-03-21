import 'dart:developer';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

import 'comics_list_item.dart';
import 'models/comic_book.dart';
import 'resources.dart';

class SearchWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String searchQuery;

  Future<List<ComicBook>> search(String query) async {
    setState(() {
      searchQuery = query;
    });
    await Future.delayed(Duration(seconds: 2));
    return [];
    // return List.generate(query.length, (int index) {
    //   return ComicBook(
    //     "Title : $query $index",
    //     "Description :$query $index",
    //   );
    // });
  }

  Widget emptyResultsView(String message) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: Images.bookOpenIcon),
          Padding(
            padding: EdgeInsets.only(bottom: 24),
          ),
          Text(
            message,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: SearchBar<ComicBook>(
            hintText: Strings.searchBarPlaceholder,
            loader: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
                strokeWidth: 10,
              ),
            ),
            placeHolder: emptyResultsView(Strings.searchPlaceholderViewText),
            emptyWidget: emptyResultsView(Strings.noSearchResults(searchQuery)),
            onSearch: search,
            onItemFound: (ComicBook comic, int index) {
              return ComicsListItemWidget(comic.title, comic.description);
            }),
      )),
    );
  }
}
