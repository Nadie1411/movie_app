import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/end_points.dart';
import '../../../../data/model/Response/MovieResponse.dart';

class SliderImage extends StatefulWidget {
  bool isWishListed = false;
  Movie movie;
  SliderImage({required this.movie});

  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  bool isWishlisted = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 129.w,
          height: 199.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  '${EndPoints.baseImageUrl}${widget.movie.posterPath}'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        Positioned(
          child: GestureDetector(
            child: isWishlisted
                ? Image.asset(
                    'assets/images/bookmarked.png',
                    width: 27.w,
                    height: 36.h,
                  )
                : Image.asset(
                    'assets/images/bookmark.png',
                    width: 27.w,
                    height: 36.h,
                  ),
            onTap: () {
              setState(() {});
              isWishlisted = !isWishlisted;
              ////todo add to wish list//////
            },
          ),
        ),
      ],
    );
  }
}
