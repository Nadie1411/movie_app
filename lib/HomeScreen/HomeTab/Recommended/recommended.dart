import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Themes/app_colors.dart';
import '../../../Widgets/movie_item_with_details.dart';
import '../cubit/movies_cubit.dart';

class Recommended extends StatelessWidget {
  const Recommended({
    super.key,
    required this.cubit,
  });

  final MoviesCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 565.w,
      height: 290.h,
      color: AppColors.sectionGreyColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Recommended",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 215.h,
              child: ListView.builder(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: cubit.topRatedMovies?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: MovieItemWithDetails(
                      movie: cubit.topRatedMovies![index],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
