import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Themes/app_colors.dart';
import '../Movie Details/movie_details.dart';
import 'New Releases/new_releases.dart';
import 'Popular/Slider/slider_components.dart';
import 'Recommended/recommended.dart';
import 'cubit/movies_cubit.dart';
import 'cubit/movies_states.dart';

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
                                child: SliderComponents(
                                  movie: cubit.popularMovies![index],
                                ),
                              );
                            },
                            options: CarouselOptions(
                              autoPlay: true,
                              height: 350.h,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                          ),
                          // SizedBox(height: 10.h),
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
