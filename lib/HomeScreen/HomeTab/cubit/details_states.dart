import 'package:movie_app/data/model/Response/MovieDetailResponse.dart';

abstract class MovieDetailState {}

class MovieDetailsInitialState extends MovieDetailState{}

class MovieDetailsLoadingState extends MovieDetailState{}

class MovieDetailsErrorState extends MovieDetailState{
  String error;
  MovieDetailsErrorState({required this.error});
}

class MovieDetailsSuccessState extends MovieDetailState{
  MovieDetailResponse response;
  MovieDetailsSuccessState({required this.response});
}