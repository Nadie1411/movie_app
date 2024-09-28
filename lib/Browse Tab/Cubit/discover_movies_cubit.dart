import 'package:bloc/bloc.dart';
import 'package:movie_app/Browse%20Tab/Cubit/discover_movies_states.dart';

import '../../data/api_manager.dart';
import '../../data/model/Response/MovieResponse.dart';

class DiscoverMovieCategory extends Cubit<DiscoverMovieStates> {
  DiscoverMovieCategory() : super(DiscoverMovieInitialState());

  List<Movie>? movieCategory;

  void getMovieCategory(String id) async {
    print("Fetching Top Rated Movies");
    try {
      var response =
          await ApiManager.getDiscoverMovieCategory('1', id.toString());
      if (response.success == 'false') {
        emit(DiscoverMovieErrorState(error: response.statusMessage!));
      } else {
        movieCategory = response.results ?? [];
        // Add this line
        emit(DiscoverMovieSuccessState(response: response));
      }
    } catch (e) {
      emit(DiscoverMovieErrorState(error: e.toString()));
    }
  }
}
