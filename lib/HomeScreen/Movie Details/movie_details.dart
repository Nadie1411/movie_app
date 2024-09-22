import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/HomeScreen/HomeTab/cubit/movies_cubit.dart';
import 'package:movie_app/HomeScreen/HomeTab/cubit/movies_states.dart';
import 'package:movie_app/HomeScreen/Movie%20Details/similar_items.dart';
import 'package:movie_app/Themes/app_colors.dart';
import 'package:movie_app/data/end_points.dart';
import 'package:movie_app/data/model/Response/MovieResponse.dart';

class MovieDetailsTab extends StatelessWidget {
  static const String routeName = 'movie_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments! as Movie;
    MoviesCubit cubit = MoviesCubit();

    return BlocBuilder<MoviesCubit, MoviesStates>(
      bloc: cubit..getSimilar(args.id ?? 0),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            title: Text(
              args.title ?? '',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            backgroundColor: AppColors.barGreyColor,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        '${EndPoints.baseImageUrl}${args.posterPath}',
                        width: double.maxFinite,
                        height: 300,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 300,
                            color: Colors.grey,
                            child: Icon(
                              Icons.broken_image,
                              color: AppColors.sectionGreyColor,
                              size: 50,
                            ),
                          );
                        },
                      ),
                      Center(
                        child: IconButton(
                          onPressed: () {
                            _showTrailerDialog(context);
                          },
                          icon: Icon(
                            Icons.play_circle_outline,
                            color: AppColors.whiteColor,
                            size: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    args.title ?? '',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        args.releaseDate ?? '',
                        style: TextStyle(
                          color: AppColors.sectionGreyColor,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        args.voteAverage.toString(),
                        style: TextStyle(
                          color: AppColors.sectionGreyColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.primaryYellowColor),
                      Text(
                        args.voteAverage.toString(),
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    args.overview ?? ' ',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "More Like This",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Ensure the Container is now wrapped properly in a Column
                  Container(
                    height: 200,
                    child: state is SimilarMovieSuccessState
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.response.results?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SimilarItem(
                                        movie: cubit.similarMovies![index]),
                                    SizedBox(height: 8),
                                    Text(
                                      args.title ?? '',
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: AppColors.primaryYellowColor,
                                            size: 14),
                                        Text(
                                          args.voteAverage.toString(),
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryYellowColor,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showTrailerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.barGreyColor,
          title: Text(
            'Watch Trailer',
            style: TextStyle(color: AppColors.whiteColor),
          ),
          content: Container(
            height: 200,
            width: 300,
            child: Center(
              child: Icon(
                Icons.play_circle_outline,
                color: AppColors.primaryYellowColor,
                size: 100,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child:
                  Text('Close', style: TextStyle(color: AppColors.whiteColor)),
            ),
          ],
        );
      },
    );
  }

  void _showGenreDialog(BuildContext context, String genre) {
    var args = ModalRoute.of(context)?.settings.arguments! as Movie;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.barGreyColor,
          title: Text(
            'Genre: ${args.genreIds}',
            style: TextStyle(color: AppColors.whiteColor),
          ),
          content: Text(
            'Movies in ${args.genreIds} genre coming soon!',
            style: TextStyle(color: AppColors.whiteColor),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child:
                  Text('Close', style: TextStyle(color: AppColors.whiteColor)),
            ),
          ],
        );
      },
    );
  }
}