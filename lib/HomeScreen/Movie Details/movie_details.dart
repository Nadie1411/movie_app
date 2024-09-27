import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/HomeScreen/HomeTab/cubit/movies_cubit.dart';
import 'package:movie_app/HomeScreen/HomeTab/cubit/movies_states.dart';
import 'package:movie_app/Themes/app_colors.dart';
import 'package:movie_app/Themes/my_theme.dart';
import 'package:movie_app/data/end_points.dart';
import 'package:movie_app/data/model/Response/MovieDetailResponse.dart';
import 'package:movie_app/data/model/Response/MovieResponse.dart';

import 'cubit/Similar.dart';

class MovieDetailsTab extends StatelessWidget {
  static const String routeName = 'movie_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments! as Movie;
    MoviesCubit cubit = MoviesCubit();

    return BlocBuilder<MoviesCubit, MoviesStates>(
      bloc: cubit
        ..getSimilar(args.id ?? 0)
        ..getGenre(args.id ?? 0),
      builder: (context, state) {
        return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_outlined),
                color: AppColors.primaryYellowColor,
              ),
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
                          '${EndPoints.baseImageUrl}${args.backdropPath}',
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
                          heightFactor: 2.5,
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
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 129.w,
                          height: 199.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.r),
                            child: Image.network(
                                '${EndPoints.baseImageUrl}${args.posterPath}'),
                          ),
                        ),
                        Expanded(
                            child: state is MovieDetailsLoadingState
                                ? Center(child: CircularProgressIndicator())
                                : Column(
                                    children: [
                                      ListView.builder(
                                          itemCount: cubit.detail?.length ?? 0,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Genre_items(
                                                  genres: cubit.detail![index]),
                                            );
                                          }),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      Text(
                              args.overview ?? ' ',
                              overflow: TextOverflow.visible,
                              maxLines: null,
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 16,
                                height: 1.5,
                              ),
                            ),
                                      SizedBox(height: 20.h),
                                      Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.primaryYellowColor,
                                  size: 20,
                                ),
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
                          ],
                                  ))
                      ],
                    ),
                    SizedBox(height: 12),
                    SizedBox(height: 8),
                    state is SimilarMovieLoadingState
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Similar(
                            cubit: cubit,
                          )
                  ]),
            )));
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

class Genre_items extends StatelessWidget {
  const Genre_items({
    super.key,
    required this.genres,
  });

  final Genres? genres;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      alignment: Alignment.center,
      width: 10.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: AppColors.sectionGreyColor, width: 3)),
      child: Text(
        genres?.name ?? '',
        style: MyTheme.theme.textTheme.bodyMedium,
      ),
    );
  }
}
