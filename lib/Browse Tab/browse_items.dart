import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Browse%20Tab/category_screen.dart';
import 'package:movie_app/Themes/my_theme.dart';
import 'package:movie_app/data/model/Response/BrowseResponse.dart';

class BrowseItems extends StatelessWidget {
  Category genres;

  BrowseItems({required this.genres});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(CategoryScreen.routeName, arguments: genres);
          },
          child: Container(
            height: 90.h,
            width: 158.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: Image.asset(
                  'assets/images/${getMovieAssets() ? genres.name : 'General'}.png',
                  fit: BoxFit.fill),
            ),
          ),
        ),
        Text(
          genres.name ?? '',
          style: MyTheme.theme.textTheme.bodyMedium,
        )
      ],
    );
  }

  bool getMovieAssets() {
    bool getGenreAsset = false;
    List movieGenreAssets = [
      "Adventure",
      "Animation",
      "Comedy",
      "Crime",
      "Documentary",
      "Family",
      "Fantasy",
      "History",
      'Music',
      'Romance',
      'Science Fiction',
      'War',
      'Western',
      'Horror',
    ];

    for (int i = 0; i < movieGenreAssets.length; i++) {
      if (movieGenreAssets[i] == genres.name) {
        getGenreAsset = true;
        return getGenreAsset;
      }
    }
    return getGenreAsset;
  }
}
