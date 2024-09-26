import '../Widgets/movies.dart';

class Watchlist {
  static List<Movies> _watchlist = [];
  static List<String> _watchlistIds = []; // List to keep track of movie IDs


  static void addMovie(Movies movie) {
    if (!_watchlistIds.contains(movie.id)) {


      _watchlist.add(movie);
      _watchlistIds.add(movie.id); // Add ID to the list
    }
  }

  static void removeMovie(Movies movie) {
    _watchlist.remove(movie);
    _watchlistIds.remove(movie.id); // Remove ID from the list

  }

  static List<Movies> getWatchlist() {
    return _watchlist;
  }



  // Method to check if a movie is in the watchlist
  static bool containsMovie(Movies movie) {
    return _watchlist.any((m) => m.id == movie.id);
  }







}
