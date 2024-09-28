import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Widgets/movies.dart';

class FirebaseUtils {
  // Reference to the movies collection
  static CollectionReference<Movies> getMoviesCollection() {
    return FirebaseFirestore.instance.collection(Movies.collectionName)
        .withConverter<Movies>(
      fromFirestore: (snapshot, options) => Movies.fromFireStore(snapshot.data()!),
      toFirestore: (movie, options) => movie.toFireStore(),
    );
  }

  // Add a movie to Firestore, ensuring the movie ID is unique (e.g., using TMDb ID)
  static Future<void> addMovieToFireStore(Movies movie) async {
    var movieCollection = getMoviesCollection();

    // Use the movie's TMDb ID (or another unique identifier) as the document ID
    var movieDocRef = movieCollection.doc(movie.id); // Ensure movie.id is unique, e.g., from TMDb

    // Check if the movie already exists
    var existingMovieDoc = await movieDocRef.get();
    if (existingMovieDoc.exists) {
      print('Movie with ID: ${movie.id} already exists in Firestore.');
    } else {
      await movieDocRef.set(movie); // Save movie using its unique ID
      print('Movie added with ID: ${movie.id}');
    }
  }

  // Remove a movie from Firestore
  static Future<void> removeMovieFromFireStore(String movieId) async {
    var movieCollection = getMoviesCollection();
    await movieCollection.doc(movieId).delete();
    print('Movie with ID: $movieId removed');
  }

  // Check if a movie exists in Firestore by its ID
  static Future<bool> checkIfMovieExists(String movieId) async {
    var movieDoc = await getMoviesCollection().doc(movieId).get();
    return movieDoc.exists;
  }
  static Future<List<Movies>> getBookmarkedMovies() async {
    try {
      var snapshot = await getMoviesCollection().get();
      List<Movies> bookmarkedMovies = snapshot.docs.map((doc) => doc.data()).toList();
      return bookmarkedMovies;
    } catch (e) {
      print('Error fetching bookmarked movies: $e');
      return []; // Return an empty list in case of an error
    }
  }

}