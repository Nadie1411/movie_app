import 'package:bloc/bloc.dart';
import 'package:movie_app/HomeScreen/HomeTab/cubit/movies_states.dart';
import 'package:movie_app/data/api_manager.dart';
import 'package:movie_app/data/model/Response/MovieResponse.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit() : super(MoviesInitialState());
  //hold data , handle logic
  List<Movie>? popularMovies;
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

  List<Movie>? searchMovie;

  void getSearchMovie(String query) async {
    try {
      var response = await ApiManager.getSearchMovie(query);
      if (response.success == 'false') {
        emit(SearchMovieErrorState(errorMessage: response.statusMessage!));
      } else {
        searchMovie = response.results ?? [];

        emit(SearchMovieSuccessState(response: response));
      }
    } catch (e) {
      emit(SearchMovieErrorState(errorMessage: e.toString()));
    }
  }

  void clearSearchResults() {
    searchMovie = [];

  }

  List<Movie>? similarMovies;

  void getSimilar(int id) async {
    print("Fetching Top Rated Movies");
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
