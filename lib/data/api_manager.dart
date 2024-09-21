import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movie_app/data/end_points.dart';
import 'package:movie_app/data/model/Response/MovieResponse.dart';

class ApiManager {
  static const String baseUrl = 'api.themoviedb.org';

  static Future<MovieResponse> getPopularMovies() async {
    Uri url = Uri.https(baseUrl, EndPoints.getPopular);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MovieResponse.fromJson(json);
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
