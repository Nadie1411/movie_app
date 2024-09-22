import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:movie_app/HomeScreen/HomeTab/cubit/movies_cubit.dart';
import 'package:movie_app/HomeScreen/HomeTab/cubit/movies_states.dart';
import 'package:movie_app/HomeScreen/Movie%20Details/movie_details.dart';
import 'package:movie_app/Themes/app_colors.dart';
import 'package:movie_app/Widgets/movie_item.dart';

import 'package:movie_app/HomeScreen/HomeTab/New%20Releases/new_releases.dart';
import 'package:movie_app/HomeScreen/HomeTab/Recommended/recommended.dart';
import 'package:movie_app/Widgets/slider_image.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'home_tab';

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  MoviesCubit cubit = MoviesCubit();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesStates>(
        bloc: cubit
          ..getPopularMovies()
          ..getUpComing()
          ..getTopRated(),
        builder: (context, state) {
          return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: state is PopularSuccessState
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider.builder(
                            itemCount: state.response.results?.length ?? 0,
                            itemBuilder: (context, index, realIdx) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MovieDetailsTab.routeName);
                                },
                                child: SliderImage(
                                  movie: cubit.popularMovies![index],
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: 200.h,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              aspectRatio: 2.0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),
                          NewReleases(cubit: cubit),
                          SizedBox(height: 20.h),
                          Recommended(
                            cubit: cubit,
                          )
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryYellowColor,
                      ),
                    ));
        });
  }
}
