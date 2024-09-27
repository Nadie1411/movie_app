import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/data/end_points.dart';
import 'package:movie_app/data/model/Response/MovieResponse.dart';

class ApiManager {
  static const String baseUrl = 'api.themoviedb.org';
//getpopular
  static Future<MovieResponse> getPopularMovies(String page) async {
    Uri url = Uri.https(baseUrl, EndPoints.getPopular,
        {"api_key": EndPoints.apiKey, "language": "en-US", "page": page});
    print(url);
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

////UpComing  (new releases)
  static Future<MovieResponse> getUpComingMovies(String page) async {
    Uri url = Uri.https(baseUrl, EndPoints.getUpcoming,
        {"api_key": EndPoints.apiKey, "language": "en-US", "page": page});
    print(url);
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

////Top Rated (recommended)
  static Future<MovieResponse> getTopRatedMovies(String page) async {
    Uri url = Uri.https(baseUrl, EndPoints.getTopRated,
        {"api_key": EndPoints.apiKey, "language": "en-US", "page": page});
    print(url);
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
