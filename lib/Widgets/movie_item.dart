import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/HomeScreen/Movie%20Details/movie_details.dart';
import 'package:movie_app/data/end_points.dart';
import 'package:movie_app/data/model/Response/MovieResponse.dart';

import '../WatchList Tab/firestore/firebase_utils.dart';
import '../WatchList Tab/watchlist.dart';
import 'movies.dart';

class MovieItem extends StatefulWidget {
  bool isWishListed = false;
  Movie movie;
  final Movies movies;

  MovieItem({
    required this.movie,

    Movies? movies,
  }) : movies = movies ?? Movies(
    title: movie.title ?? '',
    overview: movie.overview ?? '',
    posterPath: movie.posterPath ?? '',
    releaseDate: movie.releaseDate ?? '',
    voteAverage: movie.voteAverage ?? 0.0,);


  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  bool isWishListed = false;

  @override
  void initState() {
    super.initState();
    checkIfMovieInWishList();
  }

  // Function to check if the movie exists in Firebase
  Future<void> checkIfMovieInWishList() async {
    bool existsInFirebase = await FirebaseUtils.checkIfMovieExists(
        widget.movies.id);
    setState(() {
      isWishListed = existsInFirebase || Watchlist.containsMovie(widget.movies);
    });
  }




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(MovieDetailsTab.routeName, arguments: widget.movie);
          },
          child: Container(
            width: 96.87.w,
            height: 127.74.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    '${EndPoints.baseImageUrl}${widget.movie.posterPath}'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ),
        Positioned(
          child: GestureDetector(
            child: isWishListed
                ? Image.asset(
                    'assets/images/bookmarked.png',
                    width: 27.w,
                    height: 36.h,
                  )
                : Image.asset(
                    'assets/images/bookmark.png',
                    width: 27.w,
                    height: 36.h,
                  ),
            onTap: () async {
              print('Bookmark tapped. Current state: $isWishListed');

              setState(() {
                isWishListed = !isWishListed;
              });

              // Create the Movies object to add to Firestore
              Movies movieToAdd = Movies(
                id: widget.movie.id.toString(),
                // Use the movie's unique TMDb ID (or similar)
                title: widget.movie.title ?? '',
                overview: widget.movie.overview ?? '',
                posterPath: widget.movie.posterPath ?? '',
                releaseDate: widget.movie.releaseDate ?? '',
                voteAverage: widget.movie.voteAverage ?? 0.0,
              );

              // Add or remove the movie from Firestore
              if (isWishListed) {
                // Add movie to Firestore and Watchlist
                await FirebaseUtils.addMovieToFireStore(movieToAdd);
                Watchlist.addMovie(movieToAdd);
                print(
                    'Movie added to watchlist and Firestore with ID: ${movieToAdd
                        .id}');
              } else {
                // Remove movie from Firestore and Watchlist
                await FirebaseUtils.removeMovieFromFireStore(widget
                    .movie.id.toString());
                Watchlist.removeMovie(movieToAdd);
                print(
                    'Movie removed from watchlist and Firestore with ID: ${movieToAdd
                        .id}');

                ////todo add to wish list//////
              }

            },
          ),
        ),
      ],
    );
  }
}
