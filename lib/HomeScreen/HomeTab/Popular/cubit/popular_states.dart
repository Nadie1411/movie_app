import 'package:movie_app/data/model/Response/MovieResponse.dart';
import 'package:movie_app/data/model/failures.dart';

abstract class PopularStates {}

class PopularInitialState extends PopularStates {}

class PopularLoadingState extends PopularStates {}

class PopularErrorState extends PopularStates {
  String errorMessage;
  PopularErrorState({required this.errorMessage});
}

class PopularSuccessState extends PopularStates {
  MovieResponse response;
  PopularSuccessState({required this.response});
}
