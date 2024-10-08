import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Browse%20Tab/Cubit/discover_movies_states.dart';
import 'package:movie_app/Browse%20Tab/category_item.dart';
import 'package:movie_app/Themes/app_colors.dart';
import 'package:movie_app/data/model/Response/BrowseResponse.dart';

import 'Cubit/discover_movies_cubit.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = 'category_screen';
  DiscoverMovieCategory cubit = DiscoverMovieCategory();

  @override
  Widget build(BuildContext context) {
    var genre = ModalRoute.of(context)?.settings.arguments as Category;

    return BlocBuilder<DiscoverMovieCategory, DiscoverMovieStates>(
      bloc: cubit..getMovieCategory(genre.id.toString()),
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.backgroundColor,
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.primaryYellowColor,
                  )),
            ),
            backgroundColor: AppColors.backgroundColor,
            body: Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: cubit.movieCategory?.length ?? 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2 / 3, crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CategoryItem(movie: cubit.movieCategory![index]),
                      );
                    })));
      },
    );
  }
}
