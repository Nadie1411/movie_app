import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Themes/app_colors.dart';
import 'package:movie_app/data/end_points.dart';
import 'package:movie_app/data/model/Response/MovieResponse.dart';

class SimilarItems extends StatefulWidget {
  Movie movie;
  bool isWishListed = false;

  SimilarItems({required this.movie});

  @override
  State<SimilarItems> createState() => _SimilarItemsState();
}

class _SimilarItemsState extends State<SimilarItems> {
  bool isWishListed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: AppColors.movieGreyColor,
        width: 100.87.w,
        height: 200.h,
        child:
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 100.87.w,
                  height: 100.74.h,
                  child: Expanded(
                    child: Container(
                      width: 96.87.w,
                      height: 127.74.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              '${EndPoints.baseImageUrl}${widget.movie.posterPath}',
                            ),
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.center),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
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