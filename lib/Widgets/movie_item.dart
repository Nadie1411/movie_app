import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieItem extends StatefulWidget {
  bool isWishListed = false;
  final VoidCallback onTap;
  MovieItem({required this.onTap});
  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  bool isWishlisted = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 96.87.w,
          height: 127.74.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Image.png'),
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
              ////todo add to wish list
            },
          ),
        ),
      ],
    );
  }
}
