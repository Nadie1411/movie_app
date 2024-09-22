import 'package:movie_app/data/model/Response/MovieResponse.dart';
import 'package:movie_app/data/model/failures.dart';

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
