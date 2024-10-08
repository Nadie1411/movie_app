import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/HomeScreen/HomeTab/cubit/movies_cubit.dart';
import 'package:movie_app/Themes/app_colors.dart';
import 'package:movie_app/Widgets/movie_item_with_details.dart';

class Similar extends StatelessWidget {
  Similar({
    required this.cubit,
  });

  final MoviesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 565.w,
      height: 260.h,
      color: AppColors.sectionGreyColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "More Like This",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 186.h,
              child: ListView.builder(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: cubit.similarMovies?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: MovieItemWithDetails(
                      movie: cubit.similarMovies![index],
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
