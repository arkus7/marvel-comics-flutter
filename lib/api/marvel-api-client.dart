import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marvel_comics/models/comic_book.dart';

class MarvelApiClient {
  static const String baseUrl = "gateway.marvel.com";
  static const String apiKey = "080a502746c8a60aeab043387a56eef0";
  static const String hash = "6edc18ab1a954d230c1f03c590d469d2";

  final client = http.Client();

  Future<List<ComicBook>> getComicBooks() async {
    Map<String, String> queryParams = {
      'ts': '1',
      'apikey': MarvelApiClient.apiKey,
      'hash': MarvelApiClient.hash
    };

    final uri = Uri.https(MarvelApiClient.baseUrl, '/v1/public/comics', queryParams);
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      List<dynamic> comics = jsonBody['data']['results'];
      return comics.map((e) => ComicBook.fromJson(e)).toList();
    }
    throw Exception('Failed to load comic books');
  }
}
