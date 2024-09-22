import 'package:flutter/material.dart';

import '../../data/end_points.dart';
import '../../data/model/Response/MovieResponse.dart';

class SimilarItem extends StatelessWidget {
  SimilarItem({required this.movie});

  Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          ' ${EndPoints.baseImageUrl}${movie.posterPath}',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
