import 'dart:convert';

import 'package:basic/models/Photo.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static const String url = 'https://jsonplaceholder.typicode.com/photos';

  static List<Photo> parsePhoto(String responsrBody) {
    var list = jsonDecode(responsrBody) as List<dynamic>;

    List<Photo> photos = list.map((e) => Photo.fromJson(e)).toList();
    return photos;
  }

  static Future<List<Photo>> fetchPhotos({int page = 1}) async {
    final reponse = await http.get(url as Uri);
    if (reponse.statusCode == 200) {
      return compute(parsePhoto, reponse.body);
    } else if (reponse.statusCode == 404) {
      throw Exception('not found');
    } else {
      throw Exception('can\'t get Photo');
    }
  }
}
