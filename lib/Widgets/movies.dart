// movies.dart
class Movies {
  static const String collectionName='movies';
  String id;
  String title;
  String overview;
  String posterPath;
  String releaseDate;
  num voteAverage;
   // This will store the document ID from Firestore



  Movies({
    this.id='',
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
     // Optional parameter for document ID
  });


  // You can add a method to create a Movie from a Map if needed
  factory Movies.fromMap(Map<String, dynamic> map) {
    return Movies(
      title: map['title'],
      overview: map['description'],
      posterPath: map['posterPath'],
      releaseDate: map['releaseDate'],
      voteAverage: map['voteAverage'],
       id:map['id']
       // Assuming you're retrieving this from Firestore
    );
  }




  // You might also want to create a method to convert a Movie to a Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': overview,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'voteAverage': voteAverage,
      'id':id,
    };



  }

  Movies.fromFireStore(Map<String, dynamic> data):this(
      title: data['title'] as String,
      overview: data['description'],
      posterPath: data['posterPath'],
      releaseDate: data['releaseDate'],
      voteAverage: data['voteAverage'],
      id:data['id']
    // Assuming you're retrieving this from Firestore
  );







  Map<String, dynamic> toFireStore() {
    return {
      'title': title,
      'description': overview,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'voteAverage': voteAverage,
      'id': id,

    };
  }


}
