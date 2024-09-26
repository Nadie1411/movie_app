import 'package:movie_app/data/model/Response/MovieResponse.dart';

import '../../../data/model/Response/MovieDetailResponse.dart';

abstract class MoviesStates {}

class MoviesInitialState extends MoviesStates {}

class PopularLoadingState extends MoviesStates {}

class PopularErrorState extends MoviesStates {
  String errorMessage;

  PopularErrorState({required this.errorMessage});
}

class PopularSuccessState extends MoviesStates {
  MovieResponse response;

  PopularSuccessState({required this.response});
}
//////////////////////
//new releases (Upcoming)

class UpComingLoadingState extends MoviesStates {}

class UpComingErrorState extends MoviesStates {
  String errorMessage;

  UpComingErrorState({required this.errorMessage});
}

class UpComingSuccessState extends MoviesStates {
  MovieResponse response;

  UpComingSuccessState({required this.response});
}

//////////////////////
//Recommended (top rated)

class TopRatedLoadingState extends MoviesStates {}

class TopRatedErrorState extends MoviesStates {
  String errorMessage;

  TopRatedErrorState({required this.errorMessage});
}

class TopRatedSuccessState extends MoviesStates {
  MovieResponse response;

  TopRatedSuccessState({required this.response});
}

class SimilarMovieSuccessState extends MoviesStates {
  MovieResponse response;

  SimilarMovieSuccessState({required this.response});
}

class SimilarMovieErrorState extends MoviesStates {
  String error;

  SimilarMovieErrorState({required this.error});
}

class SimilarMovieLoadingState extends MoviesStates {}

//search
class SearchMovieLoadingState extends MoviesStates {}

class SearchMovieErrorState extends MoviesStates {
  String errorMessage;

  SearchMovieErrorState({required this.errorMessage});
}

class SearchMovieSuccessState extends MoviesStates {
  MovieResponse response;

  SearchMovieSuccessState({required this.response});
}
//details
class MovieDetailsLoadingState extends MoviesStates {}

class MovieDetailsErrorState extends MoviesStates {
  String error;

  MovieDetailsErrorState({required this.error});
}

class MovieDetailsSuccessState extends MoviesStates {
  MovieDetailResponse response;

  MovieDetailsSuccessState({required this.response});
}
