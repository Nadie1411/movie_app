import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/HomeScreen/HomeTab/cubit/movies_cubit.dart';
import 'package:movie_app/HomeScreen/Movie%20Details/movie_details.dart';
import 'package:movie_app/Themes/app_colors.dart';
import 'package:movie_app/Widgets/movie_item.dart';

class NewReleases extends StatelessWidget {
  const NewReleases({
    super.key,
    required this.cubit,
  });

  final MoviesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 455.62.w,
      height: 200.h,
      color: AppColors.movieGreyColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "New Releases",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 127.87.h,
              child: ListView.builder(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: cubit.upComingMovies?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            MovieDetailsTab.routeName,
                          );
                        },
                        child: MovieItem(
                          movie: cubit.upComingMovies![index],
                        )),
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
