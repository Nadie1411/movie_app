import 'package:bloc/bloc.dart';
import 'package:movie_app/HomeScreen/HomeTab/cubit/movies_states.dart';
import 'package:movie_app/data/api_manager.dart';

import '../../../data/model/Response/MovieDetailResponse.dart';

class MovieDetails extends Cubit<MoviesStates> {
  MovieDetails() : super(MoviesInitialState());

  List<Genres> ?detail ;

  void getGenre(int id) async {
    try {
      var response = await ApiManager.getMovieDetails(id);
      if (response.success == 'false') {
        emit(MovieDetailsErrorState(error: response.statusMessage!));
      } else {
        detail = response.genres;
        emit(MovieDetailsSuccessState(response: response));
      }
    } catch (e) {
      emit(MovieDetailsErrorState(error: e.toString()));
    }
  }

}