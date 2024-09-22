import 'package:flutter/material.dart';
import 'package:movie_app/Themes/app_colors.dart';

class MovieDetailsTab extends StatefulWidget {
  static const String routeName = 'movie_details';

  @override
  _MovieDetailsTabState createState() => _MovieDetailsTabState();
}

class _MovieDetailsTabState extends State<MovieDetailsTab> {
  String movieTitle = "Dora and the Lost City of Gold";
  String posterAsset = "assets/images/Image.png";
  double rating = 6.1;
  String releaseDate = "2019";
  String duration = "1h 42m";
  String description =
      "Teenage explorer Dora leads her friends on an adventure to save her parents and solve the mystery behind a lost city of gold.";

  List<String> genres = ["Dark Comedy", "Superhero", "Action"];

  final List<Map<String, dynamic>> moreLikeThis = [
    {
      "title": "Avengers: Infinity War",
      "poster": "assets/images/movieposter/avengers.jpg",
      "rating": 8.4,
      "releaseDate": "2018",
      "duration": "2h 29m",
      "description": "The Avengers must stop Thanos, who is hell-bent on collecting the Infinity Stones."
    },
    {
      "title": "Black Panther",
      "poster": "assets/images/movieposter/black_panther.jpg",
      "rating": 7.3,
      "releaseDate": "2018",
      "duration": "2h 15m",
      "description": "T'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people."
    },
    {
      "title": "Avengers: Infinity War",
      "poster": "assets/images/movieposter/avengers.jpg",
      "rating": 8.4,
      "releaseDate": "2018",
      "duration": "2h 29m",
      "description": "The Avengers must stop Thanos, who is hell-bent on collecting the Infinity Stones."
    },
    {
      "title": "Avengers: Infinity War",
      "poster": "assets/images/movieposter/avengers.jpg",
      "rating": 8.4,
      "releaseDate": "2018",
      "duration": "2h 29m",
      "description": "The Avengers must stop Thanos, who is hell-bent on collecting the Infinity Stones."
    },
    {
      "title": "Avengers: Infinity War",
      "poster": "assets/images/movieposter/avengers.jpg",
      "rating": 8.4,
      "releaseDate": "2018",
      "duration": "2h 29m",
      "description": "The Avengers must stop Thanos, who is hell-bent on collecting the Infinity Stones."
    },
    {
      "title": "Avengers: Infinity War",
      "poster": "assets/images/movieposter/avengers.jpg",
      "rating": 8.4,
      "releaseDate": "2018",
      "duration": "2h 29m",
      "description": "The Avengers must stop Thanos, who is hell-bent on collecting the Infinity Stones."
    },
    {
      "title": "Deadpool & Wolverine",
      "poster": "assets/images/movieposter/wolverine.jpg",
      "rating": 8,
      "releaseDate": "2024",
      "duration": "2h 8m",
      "description": "Deadpool is offered a place in the Marvel Cinematic Universe by the Time Variance Authority, but instead recruits a variant of Wolverine to save his universe from extinction."
    },
    {
      "title": "Dora and the Lost City of Gold",
      "poster": "assets/images/Image.png",
      "rating": 6.1,
      "releaseDate": "2019",
      "duration": "1h 42m",
      "description": "Teenage explorer Dora leads her friends on an adventure to save her parents and solve the mystery behind a lost city of gold."
    },
  ];

  void _updateMovieDetails(Map<String, dynamic> movie) {
    setState(() {
      movieTitle = movie["title"];
      posterAsset = movie["poster"];
      rating = movie["rating"];
      releaseDate = movie["releaseDate"];
      duration = movie["duration"];
      description = movie["description"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          movieTitle,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        backgroundColor: AppColors.barGreyColor,
        iconTheme: IconThemeData(color: AppColors.primaryYellowColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    posterAsset,
                    width: double.maxFinite,
                    height: 220,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 220,
                        color: Colors.grey,
                        child: Icon(
                          Icons.broken_image,
                          color: AppColors.sectionGreyColor,
                          size: 50,
                        ),
                      );
                    },
                  ),
                  Positioned.fill(
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          _showTrailerDialog(context);
                        },
                        icon: Icon(
                          Icons.play_circle_outline,
                          color: AppColors.whiteColor,
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                movieTitle,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColors.whiteColor),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    releaseDate,
                    style: TextStyle(
                      color: AppColors.sectionGreyColor,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    duration,
                    style: TextStyle(
                      color: AppColors.sectionGreyColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: genres.map((genre) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        _showGenreDialog(context, genre);
                      },
                      child: Chip(
                        label: Text(
                          genre,
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                        backgroundColor: AppColors.barGreyColor,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.primaryYellowColor),
                  SizedBox(width: 5),
                  Text(
                    "$rating",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "More Like This",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: moreLikeThis.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _updateMovieDetails(moreLikeThis[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  moreLikeThis[index]["poster"],
                                  width: 100,
                                  height: 140,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 100,
                                      height: 140,
                                      color: Colors.grey,
                                      child: Icon(
                                        Icons.broken_image,
                                        color: AppColors.sectionGreyColor,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              moreLikeThis[index]["title"],
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 12,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: AppColors.primaryYellowColor,
                                    size: 14),
                                SizedBox(width: 5),
                                Text(
                                  "${moreLikeThis[index]["rating"]}",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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

  void _showTrailerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.barGreyColor,
          title: Text(
            'Watch Trailer',
            style: TextStyle(color: AppColors.whiteColor),
          ),
          content: Container(
            height: 200,
            width: 300,
            child: Center(
              child: Icon(
                Icons.play_circle_outline,
                color: AppColors.primaryYellowColor,
                size: 100,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close', style: TextStyle(color: AppColors.whiteColor)),
            ),
          ],
        );
      },
    );
  }

  void _showGenreDialog(BuildContext context, String genre) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.barGreyColor,
          title: Text(
            'Genre: $genre',
            style: TextStyle(color: AppColors.whiteColor),
          ),
          content: Text(
            'Movies in $genre genre coming soon!',
            style: TextStyle(color: AppColors.whiteColor),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close', style: TextStyle(color: AppColors.whiteColor)),
            ),
          ],
        );
      },
    );
  }
}
