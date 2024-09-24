import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/HomeScreen/HomeTab/cubit/movies_cubit.dart';
import 'package:movie_app/HomeScreen/HomeTab/cubit/movies_states.dart';
import 'package:movie_app/Themes/my_theme.dart';
import 'package:movie_app/Widgets/movie_item_with_details.dart';

import '../Themes/app_colors.dart';

class SearchTab extends StatelessWidget {
  static const String routeName = 'search_tab';

  MoviesCubit cubit = MoviesCubit();
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesStates>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 43.h),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide:
                            BorderSide(color: AppColors.whiteColor, width: 1)),
                    hintText: "Search",
                    hintStyle: MyTheme.theme.textTheme.bodySmall,
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.whiteColor,
                    ),
                    fillColor: AppColors.barGreyColor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide:
                          BorderSide(color: AppColors.whiteColor, width: 1),
                    ),
                  ),
                  cursorColor: AppColors.primaryYellowColor,
                  style: MyTheme.theme.textTheme.bodySmall,
                  onChanged: (query) {
                    searchController.text = query;
                    if (query.isNotEmpty) {
                      cubit.getSearchMovie(searchController.text);
                    } else {
                      cubit.clearSearchResults();
                    }
                  },
                ),
              ),
              Expanded(
                  child: state is SearchMovieSuccessState
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemCount: cubit.searchMovie?.length ?? 0,
                          shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return MovieItemWithDetails(
                              movie: cubit.searchMovie![index]);
                        })
                      : Center(
                          child: (searchController.text.isEmpty)
                              ? Text("Search for movies",
                                  style: MyTheme.theme.textTheme.headlineLarge)
                              : CircularProgressIndicator(
                                  color: AppColors.primaryYellowColor)))
            ]));
      },
    );
  }
}
