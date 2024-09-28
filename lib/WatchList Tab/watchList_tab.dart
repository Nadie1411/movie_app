import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/WatchList%20Tab/watchlist.dart';

import '../Themes/app_colors.dart';
import '../Widgets/movies.dart';
import '../data/end_points.dart';
import 'firestore/firebase_utils.dart';

class WatchListTab extends StatelessWidget {
  static const String routeName = 'watchList_tab';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(16),
              color: AppColors.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Watchlist',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontSize: 28.sp, // Adjust the size accordingly
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h), // Space below the title
                  Expanded(
                    child: StreamBuilder<List<Movies>>(
                      stream: FirebaseUtils.getMoviesCollection().snapshots().map(
                            (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        }
                        final movies = snapshot.data ?? [];
                        return ListView.separated(
                          itemCount: movies.length,
                          separatorBuilder: (context, index) => SizedBox(height: 16.h),
                          itemBuilder: (context, index) {
                            final movie = movies[index];
                            return Container(
                              height: 120.h, // Set the height of the container
                              decoration: BoxDecoration(
                                color: AppColors.sectionGreyColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  // Image takes the full height of the container
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4.r),
                                    child: Image.network(
                                      '${EndPoints.baseImageUrl}${movie.posterPath}',
                                      width: 80.w,
                                      height: double.infinity, // Ensures the image takes the full height of the container
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          movie.title,
                                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                        Text(
                                          movie.releaseDate,
                                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            color: AppColors.primaryYellowColor,
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: AppColors.primaryYellowColor),
                                    onPressed: () {
                                      Watchlist.removeMovie(movie);
                                      FirebaseUtils.removeMovieFromFireStore(movie.id);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ), ),
        );
    }
}