import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/HomeScreen/HomeTab/Popular/Slider/slider_components.dart';
import 'package:movie_app/data/model/Response/MovieResponse.dart';

class MovieSlider extends StatelessWidget {
  int currentIndex = 0;
  final List<Movie> movie;

  MovieSlider({required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 289.h,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return SliderComponents(movie: movie[index]);
          },
          itemCount: movie?.length ?? 0,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
        ));
  }
}
