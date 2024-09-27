import '../Widgets/movies.dart';

class Watchlist {
  static List<Movies> _watchlist = [];

  static void addMovie(Movies movie) {
    _watchlist.add(movie);
  }

  static void removeMovie(Movies movie) {
    _watchlist.remove(movie);
  }

  static List<Movies> getWatchlist() {
    return _watchlist;
  }
}
