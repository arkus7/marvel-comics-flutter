import 'package:flutter/foundation.dart';

class ComicBook {
  final String title;
  final String description;

  ComicBook({@required this.title, @required this.description});

  factory ComicBook.fromJson(Map<String, dynamic> json) {
    return ComicBook(
      title: json['title'],
      description: json['description'],
    );
  }
}
