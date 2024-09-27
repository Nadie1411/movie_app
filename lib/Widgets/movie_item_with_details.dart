import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/HomeScreen/Movie%20Details/movie_details.dart';
import 'package:movie_app/Themes/app_colors.dart';
import 'package:movie_app/data/end_points.dart';
import 'package:movie_app/data/model/Response/MovieResponse.dart';

class MovieItemWithDetails extends StatefulWidget {
  Movie movie;
  bool isWishListed = false;

  MovieItemWithDetails({required this.movie});

  @override
  State<MovieItemWithDetails> createState() => _MovieItemWithDetailsState();
}

class _MovieItemWithDetailsState extends State<MovieItemWithDetails> {
  bool isWishListed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsTab.routeName,
            arguments: widget.movie);
      },
      child: Container(
        color: AppColors.movieGreyColor,
        width: 97.w,
        height: 200.h,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Container(
                width: 100.87.w,
                height: 100.74.h,
                child: Expanded(
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
                  onTap: () {
                    setState(() {});
                    isWishListed = !isWishListed;
                    ////todo add to wish list
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
                SizedBox(width: 5.w),
                Text(
                  widget.movie.voteAverage.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.movie.title ?? '',
              style: Theme.of(context).textTheme.headlineMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.movie.releaseDate ?? '',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ]),
      ),
    );
  }
}
