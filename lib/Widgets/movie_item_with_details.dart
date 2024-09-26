import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/HomeScreen/Movie%20Details/movie_details.dart';
import 'package:movie_app/Themes/app_colors.dart';
import 'package:movie_app/Widgets/movies.dart';
import 'package:movie_app/data/end_points.dart';

import '../HomeScreen/HomeTab/cubit/movies_cubit.dart';
import '../WatchList Tab/firestore/firebase_utils.dart';
import '../WatchList Tab/watchlist.dart';
import '../data/model/Response/MovieResponse.dart';

class MovieItemWithDetails extends StatefulWidget {
  final Movie movie;
  bool isWishListed = false;
  final Movies movies;

  MovieItemWithDetails({
    required this.movie,
    Movies? movies,
  }) : movies = movies ?? Movies(
    title: movie.title ?? '',
    overview: movie.overview ?? '',
    posterPath: movie.posterPath ?? '',
    releaseDate: movie.releaseDate ?? '',
    voteAverage: movie.voteAverage ?? 0.0,
  );

  @override
  State<MovieItemWithDetails> createState() => _MovieItemWithDetailsState();
}

class _MovieItemWithDetailsState extends State<MovieItemWithDetails> {
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
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieDetailsTab.routeName,
          arguments: widget.movie,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: AppColors.movieGreyColor,
          width: 97.w,
          height: 186.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 96.87.w,
                    height: 127.74.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          '${EndPoints.baseImageUrl}${widget.movie.posterPath}',
                        ),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      ),
                      borderRadius: BorderRadius.circular(4.r),
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
                        }
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.primaryYellowColor,
                      size: 17,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      widget.movie.voteAverage.toString(),
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.movie.title ?? '',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.movie.releaseDate ?? '',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//   return MovieItemWithDetails(
//   movie: cubit.movieCategory![index]
//   );
// })));
// },
// );
// }
// }

