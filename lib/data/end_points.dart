class EndPoints {
  static const String apiKey = '0612cdac7ed1bc2e16f0a795f3142cb0';
  static const String getPopular = '/3/movie/popular';

  static const String getUpcoming = '3/movie/upcoming';

  static const String getMovieCategory = '/3/discover/movie';
  static const String getTopRated = '/3/movie/top_rated';
  static const String getBrowse = '/3/genre/movie/list';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500/';

  static String getDetails(int movieId) {
    return "/3/movie/$movieId";
  }

  static String getSimilar(int movieId) {
    return '/3/movie/$movieId/similar';
  }
}
