import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Themes/app_colors.dart';
import 'package:movie_app/Widgets/movie_item.dart';
import 'package:movie_app/Widgets/Slider/movie_slider.dart';
import 'package:movie_app/Widgets/new_releases.dart';
import 'package:movie_app/Widgets/recommended.dart';

class HomeTab extends StatelessWidget {
  static const String routeName = 'home_tab';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieSlider(),
            SizedBox(height: 20.h),
            NewReleases(),
            SizedBox(height: 20.h),
            Recommended()
          ],
        ),
      ),
    );
  }
}
