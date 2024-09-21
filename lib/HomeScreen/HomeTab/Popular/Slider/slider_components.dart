import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/HomeScreen/Movie%20Details/movie_details.dart';
import 'package:movie_app/Widgets/movie_item.dart';

class SliderComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsTab.routeName);
      },
      child: Container(
          width: 412.w,
          height: 289.h,
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: 412.w,
                  height: 217.h,
                  child: Image.asset('assets/images/Image (1).png'),
                ),
                Positioned(
                  top: 100.h,
                  left: 150.w,
                  child: Image.asset('assets/images/play-button-2.png'),
                ),
                Positioned(
                  top: 118.h,
                  left: 21.w,
                  child: Container(
                    height: 199.h,
                    width: 129.w,
                    child: InkWell(
                      child: MovieItem(),
                      onTap: () {
                        MovieDetailsTab();
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 220.h,
                  left: 125.w,
                  child: Column(
                    children: [
                      Text(
                        'Title',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        '2019',
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
