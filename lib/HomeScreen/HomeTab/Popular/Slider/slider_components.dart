import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/HomeScreen/Movie%20Details/movie_details.dart';
import 'package:movie_app/Widgets/movie_item.dart';
import 'package:movie_app/data/model/Response/MovieResponse.dart';

class SliderComponents extends StatelessWidget {
  Movie movie;
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  SliderComponents({required this.movie});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsTab.routeName);
      },
      child: Container(
          width: 412.w,
          height: 289.h,
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: 412.w,
                  height: 217.h,
                  child: Image.network('$baseImageUrl/${movie.posterPath}'),
                ),
                Positioned(
                  top: 100.h,
                  left: 150.w,
                  child: Image.network('$baseImageUrl/${movie.posterPath}'),
                ),
                Positioned(
                  top: 118.h,
                  left: 21.w,
                  child: Container(
                    height: 199.h,
                    width: 129.w,
                    child: InkWell(
                      child: MovieItem(
                        movie: movie,
                      ),
                      onTap: () {
                        MovieDetailsTab();
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 220.h,
                  left: 125.w,
                  child: Column(
                    children: [
                      Text(
                        movie.title ?? '',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        movie.releaseDate ?? '',
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
