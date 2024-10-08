import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/data/end_points.dart';
import 'package:movie_app/data/model/Response/BrowseResponse.dart';
import 'package:movie_app/data/model/Response/MovieResponse.dart';

import 'model/Response/MovieDetailResponse.dart';

class ApiManager {
  static const String baseUrl = 'api.themoviedb.org';

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

  static Future<MovieResponse> getDiscoverMovieCategory(
      String page, String id) async {
    Uri url = Uri.https(baseUrl, EndPoints.getMovieCategory, {
      "api_key": EndPoints.apiKey,
      "language": "en-US",
      "page": page,
      "with_genres": id,
      "sort_by": "popularity.desc"
    });
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

  static Future<BrowseResponse> getBrowseMovies() async {
    Uri url =
        Uri.https(baseUrl, EndPoints.getBrowse, {"api_key": EndPoints.apiKey});
    print(url);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return BrowseResponse.fromJson(json);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<MovieResponse> getSimilarMovies(int id, String page) async {
    Uri url = Uri.https(baseUrl, EndPoints.getSimilar(id),
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

  static Future<MovieResponse> getSearchMovie(String query) async {
    Uri url = Uri.https(baseUrl, EndPoints.getSearch,
        {"api_key": EndPoints.apiKey, 'query': query});

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

  static Future<MovieDetailResponse> getMovieDetails(int id) async {
    Uri url = Uri.https(baseUrl, EndPoints.getDetails(id),
        {"api_key": EndPoints.apiKey, "language": "en-US"});
    print(url);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MovieDetailResponse.fromJson(json);
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
