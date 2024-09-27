import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Themes/my_theme.dart';
import 'Browse Tab/browse_tab.dart';
import 'HomeScreen/HomeTab/cubit/movies_cubit.dart';
import 'HomeScreen/HomeTab/home_tab.dart';
import 'HomeScreen/Movie Details/movie_details.dart';
import 'HomeScreen/home_screen.dart';
import 'Search Tab/search_tab.dart';
import 'Splash Screen/splash_screen.dart';
import 'WatchList Tab/watchList_tab.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => MoviesCubit()),
    ],
    child: MyApp(),
  ));
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
            theme: MyTheme.theme,
            debugShowCheckedModeBanner: false,
            initialRoute: HomeScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),
              HomeTab.routeName: (context) => HomeTab(),
              MovieDetailsTab.routeName: (context) => MovieDetailsTab(),
              SearchTab.routeName: (context) => SearchTab(),
              BrowseTab.routeName: (context) => BrowseTab(),
              WatchListTab.routeName: (context) => WatchListTab(),
            },
          );
        });
  }
}
