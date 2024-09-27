import 'package:bloc/bloc.dart';
import '../../../data/api_manager.dart';
import '../../../data/model/Response/MovieResponse.dart';
import 'movies_states.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit() : super(MoviesInitialState());
  //hold data , handle logic
  List<Movie>? popularMovies;
  List<Movie>? similarMovies;
  void getPopularMovies() async {
    try {
      var response = await ApiManager.getPopularMovies('3');
      if (response.success == 'false') {
        emit(PopularErrorState(errorMessage: response.statusMessage!));
      } else {
        popularMovies = response.results ?? [];
        emit(PopularSuccessState(response: response));
      }
    } catch (e) {
      emit(PopularErrorState(errorMessage: e.toString()));
    }
  }

  //newreleases
  List<Movie>? upComingMovies;
  void getUpComing() async {
    try {
      var response = await ApiManager.getUpComingMovies('1');
      if (response.success == 'false') {
        emit(UpComingErrorState(errorMessage: response.statusMessage!));
      } else {
        upComingMovies = response.results ?? [];
        emit(PopularSuccessState(response: response));
      }
    } catch (e) {
      emit(PopularErrorState(errorMessage: e.toString()));
    }
  }

  //Recommended
  List<Movie>? topRatedMovies;
  void getTopRated() async {
    print("Fetching Top Rated Movies");
    try {
      var response = await ApiManager.getTopRatedMovies('1');
      if (response.success == 'false') {
        emit(TopRatedErrorState(errorMessage: response.statusMessage!));
      } else {
        topRatedMovies = response.results ?? [];
        print(
            "Top Rated Movies fetched: ${topRatedMovies?.length}"); // Add this line
        emit(PopularSuccessState(response: response));
      }
    } catch (e) {
      emit(PopularErrorState(errorMessage: e.toString()));
    }
  }
  //similar

  void getSimilar(int id) async {
    try {
      var response = await ApiManager.getSimilarMovies(id, '1');
      if (response.success == 'false') {
        emit(SimilarMovieErrorState(errorMessage: response.statusMessage!));
      } else {
        similarMovies = response.results ?? [];

        emit(SimilarMovieSuccessState(response: response));
      }
    } catch (e) {
      emit(SimilarMovieErrorState(errorMessage: e.toString()));
    }
  }
}
