import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/HomeScreen/HomeTab/New%20Releases/new_releases.dart';
import 'package:movie_app/HomeScreen/HomeTab/Recommended/recommended.dart';
import 'package:movie_app/HomeScreen/HomeTab/cubit/movies_cubit.dart';
import 'package:movie_app/HomeScreen/HomeTab/cubit/movies_states.dart';
import 'package:movie_app/HomeScreen/Movie%20Details/movie_details.dart';
import 'package:movie_app/Themes/app_colors.dart';
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
                          Gallery3D(
                              itemConfig: GalleryItemConfig(
                                  width: 129.w, height: 199.h),
                              controller: Gallery3DController(
                                  itemCount:
                                      state.response.results?.length ?? 0,
                                  autoLoop: true,
                                  scrollTime: 5),
                              width: MediaQuery.of(context).size.width,
                              onItemChanged: (index) {
                                _currentIndex = index;
                              },
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, MovieDetailsTab.routeName);
                                  },
                                  child: SliderImage(
                                    movie: cubit.popularMovies![index],
                                  ),
                                );
                              }),
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
