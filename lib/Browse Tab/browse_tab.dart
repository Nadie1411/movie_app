import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Browse%20Tab/Cubit/browse_cubit.dart';
import 'package:movie_app/Browse%20Tab/Cubit/browse_states.dart';
import 'package:movie_app/Browse%20Tab/browse_items.dart';
import 'package:movie_app/Themes/my_theme.dart';

import '../Themes/app_colors.dart';

class BrowseTab extends StatelessWidget {
  static const String routeName = 'Browse_tab';

  BrowseCubit cubit = BrowseCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseCubit, BrowseStates>(
      bloc: cubit..getBrowse(),
      builder: (context, state) {
        return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.w, vertical: 50.h),
                  child: Text(
                    'Browse Category',
                    style: MyTheme.theme.textTheme.headlineLarge!
                        .copyWith(fontSize: 22.sp),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 10 / 5,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {},
                          splashColor: AppColors.barGreyColor,
                          child: BrowseItems(
                            genres: cubit.BrowseMovies![index],
                          ));
                    },
                  ),
                ),
              ],
            ));
      },
    );
  }
}
