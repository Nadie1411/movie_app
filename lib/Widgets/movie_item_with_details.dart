import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/HomeScreen/Movie%20Details/movie_details.dart';
import 'package:movie_app/Themes/app_colors.dart';
import 'package:movie_app/Widgets/movie_item.dart';

class MovieItemWithDetails extends StatelessWidget {
  final VoidCallback onTap;
  MovieItemWithDetails({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.movieGreyColor,
      width: 97.w,
      height: 200.h,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MovieItem(
          onTap: () {
            MovieDetailsTab();
          },
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
                '7.7',
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Title',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            '2017',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ]),
    );
  }
}
