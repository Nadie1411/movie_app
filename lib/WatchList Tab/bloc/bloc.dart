// import '../../Widgets/movies.dart';
// import '../firestore/firebase_utils.dart';
// import '../watchlist.dart';
// import 'bookmark_event.dart';
//
// class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
//   BookmarkBloc() : super(BookmarkInitial()) {
//     // Add to Firebase and Watchlist
//     on<AddBookmark>((event, emit) async {
//       Movies movieToAdd = Movies(
//         id: event.movieId,
//         title: "",  // You can add more movie details
//         overview: "",
//         posterPath: "",
//         releaseDate: "",
//         voteAverage: 0.0,
//       );
//       await FirebaseUtils.addMovieToFireStore(movieToAdd);
//       Watchlist.addMovie(movieToAdd);
//       emit(BookmarkStatus(true));
//     });
//
//     // Remove from Firebase and Watchlist
//     on<RemoveBookmark>((event, emit) async {
//       await FirebaseUtils.removeMovieFromFireStore(event.movieId);
//       Watchlist.removeMovie(event.movieId);
//       emit(BookmarkStatus(false));
//     });
//
//     // Check bookmark status
//     on<CheckBookmarkStatus>((event, emit) async {
//       bool existsInFirebase = await FirebaseUtils.checkIfMovieExists(event.movieId);
//       if (existsInFirebase || Watchlist.containsMovie(event.movieId)) {
//         emit(BookmarkStatus(true));
//       } else {
//         emit(BookmarkStatus(false));
//       }
//     });
//   }
// }
