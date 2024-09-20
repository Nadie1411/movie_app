import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Browse%20Tab/browse_tab.dart';
import 'package:movie_app/HomeScreen/HomeTab/home_tab.dart';
import 'package:movie_app/HomeScreen/Movie%20Details/movie_details.dart';
import 'package:movie_app/HomeScreen/home_screen.dart';
import 'package:movie_app/Search%20Tab/search_tab.dart';
import 'package:movie_app/Splash%20Screen/splash_screen.dart';
import 'package:movie_app/WatchList%20Tab/watchList_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 892),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: HomeScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),
              HomeTab.routeName: (context) => HomeTab(),
              MovieDetailsTab.routeName: (context) => MovieDetailsTab(),
              SearchTab.routeName: (context) => SearchTab(),
              BrowseTab.routeName: (context) => BrowseTab(),
              WatchListTab.routeName: (context) => WatchListTab()
            },
          );
        });
  }
}
