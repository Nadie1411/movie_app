import 'package:movie_app/data/model/Response/MovieResponse.dart';

abstract class DiscoverMovieStates {}

class DiscoverMovieInitialState extends DiscoverMovieStates {}

class DiscoverMovieLoadingState extends DiscoverMovieStates {}

class DiscoverMovieErrorState extends DiscoverMovieStates {
  String error;

  DiscoverMovieErrorState({required this.error});
}

class DiscoverMovieSuccessState extends DiscoverMovieStates {
  MovieResponse response;

  DiscoverMovieSuccessState({required this.response});
}
