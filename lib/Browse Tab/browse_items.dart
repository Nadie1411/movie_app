import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Themes/my_theme.dart';
import 'package:movie_app/data/model/Response/BrowseResponse.dart';

class BrowseItems extends StatelessWidget {
  Genres genres;

  BrowseItems({required this.genres});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 90.h,
          width: 158.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child:
                Image.asset('assets/images/browseImage.png', fit: BoxFit.fill),
          ),
        ),
        Text(
          genres.name ?? '',
          style: MyTheme.theme.textTheme.bodyMedium,
        )
      ],
    );
  }
}
