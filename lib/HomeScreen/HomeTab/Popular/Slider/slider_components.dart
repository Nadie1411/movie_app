import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/HomeScreen/Movie%20Details/movie_details.dart';
import 'package:movie_app/Widgets/movie_item.dart';
import 'package:movie_app/HomeScreen/HomeTab/Popular/Slider/slider_image.dart';
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
        height: 300.h,
        child: Stack(
          children: [
            Container(
              width: 412.w,
              height: 230.h,
              child: Image.network('$baseImageUrl/${movie.backdropPath}'),
            ),
            Positioned(
              top: 118.h,
              left: 21.w,
              child: Container(
                width: 129.w,
                height: 200.h,
                child: InkWell(
                  child: SliderImage(
                    movie: movie,
                  ),
                  onTap: () {
                    MovieDetailsTab();
                  },
                ),
              ),
            ),
            Positioned(
              top: 250.h,
              left: 160.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? '',
                    style: Theme.of(context).textTheme.headlineMedium,
                    maxLines: 2,
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
      ),
    );
  }
}
