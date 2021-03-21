import 'package:flutter/painting.dart';

String pathForImage(String imageName) => "assets/images/$imageName";

class Images {
  static AssetImage bookOpenIcon =
      AssetImage(pathForImage('book-open-icon.png'));
}

class Strings {
  static String noSearchResults(String query) =>
      "There is no comic book “$query” in our library. Check the spelling and try again.";
  static String searchPlaceholderViewText = "Start typing to find a particular comics.";
  static String searchBarPlaceholder = "Search for a comic book";
}
