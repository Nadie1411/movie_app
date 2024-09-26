import 'package:bloc/bloc.dart';
import 'package:movie_app/Browse%20Tab/Cubit/browse_states.dart';
import 'package:movie_app/data/model/Response/BrowseResponse.dart';

import '../../data/api_manager.dart';

class BrowseCubit extends Cubit<BrowseStates> {
  BrowseCubit() : super(BrowseInitialState());
  List<Category>? BrowseMovies;

  void getBrowse() async {
    print("Fetching Genres Movies");
    try {
      var response = await ApiManager.getBrowseMovies();
      if (response.success == 'false') {
        emit(BrowseErrorState(error: response.statusMessage!));
      } else {
        BrowseMovies = response.genres ?? [];

        emit(BrowseSuccessState(response: response));
      }
    } catch (e) {
      emit(BrowseErrorState(error: e.toString()));
    }
  }
}
