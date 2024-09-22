import 'package:movie_app/data/model/Response/BrowseResponse.dart';

abstract class BrowseStates {}

class BrowseInitialState extends BrowseStates {}

class BrowseLoadingState extends BrowseStates {}

class BrowseErrorState extends BrowseStates {
  String error;

  BrowseErrorState({required this.error});
}

class BrowseSuccessState extends BrowseStates {
  BrowseResponse response;

  BrowseSuccessState({required this.response});
}
