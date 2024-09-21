import 'package:bloc/bloc.dart';
import 'package:movie_app/HomeScreen/HomeTab/Popular/cubit/popular_states.dart';
import 'package:movie_app/data/api_manager.dart';
import 'package:movie_app/data/model/Response/MovieResponse.dart';

class PopularCubit extends Cubit<PopularStates> {
  PopularCubit() : super(PopularInitialState());
  //hold data , handle logic
  List<Movie>? popularMovies;
  void getPopularMovies() async {
    try {
      emit(PopularLoadingState());
      var response = await ApiManager.getPopularMovies();
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
}
