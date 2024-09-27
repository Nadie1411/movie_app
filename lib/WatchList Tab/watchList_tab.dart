import 'package:flutter/material.dart';
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
      body: SizedBox.expand(
        child: Container(
          padding: EdgeInsets.all(10),
          color: AppColors.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text(
                'Watchlist',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(),
              ),
              Expanded(
                child: StreamBuilder<List<Movies>>(
                  stream: FirebaseUtils.getMoviesCollection().snapshots().map(
                        (snapshot) =>
                            snapshot.docs.map((doc) => doc.data()).toList(),
                      ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    final movies = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return ListTile(
                          title: Text(movie.title),
                          subtitle: Text(movie.releaseDate),
                          leading: Image.network(
                            '${EndPoints.baseImageUrl}${movie.posterPath}',
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              Watchlist.removeMovie(movie);
                              FirebaseUtils.removeMovieFromFireStore(movie.id);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
