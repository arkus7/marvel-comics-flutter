import 'package:flutter/material.dart';
import 'package:marvel_comics/api/marvel-api-client.dart';
import 'package:marvel_comics/comics_list_item.dart';

import 'models/comic_book.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Future<List<ComicBook>> comicBooks;

  @override
  void initState() {
    super.initState();
    comicBooks = MarvelApiClient().getComicBooks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ComicBook>>(
        future: comicBooks,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return comicBookList(snapshot.data);
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }

          return Center(child: CircularProgressIndicator());
        });
  }

  Widget comicBookList(List<ComicBook> comicBooks) {
    return ListView.builder(
        itemCount: comicBooks.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, i) {
          return ComicsListItemWidget(comicBooks.elementAt(i).title,
              comicBooks.elementAt(i).description);
        });
  }
}
