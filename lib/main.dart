
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Browse%20Tab/browse_tab.dart';
import 'package:movie_app/HomeScreen/HomeTab/cubit/movies_cubit.dart';
import 'package:movie_app/HomeScreen/HomeTab/home_tab.dart';
import 'package:movie_app/HomeScreen/Movie%20Details/movie_details.dart';
import 'package:movie_app/HomeScreen/home_screen.dart';
import 'package:movie_app/Search%20Tab/search_tab.dart';
import 'package:movie_app/Splash%20Screen/splash_screen.dart';
import 'package:movie_app/Themes/my_theme.dart';
import 'package:movie_app/WatchList%20Tab/watchList_tab.dart';

import 'Browse Tab/category_screen.dart';
import 'WatchList Tab/bloc/bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(

      options: FirebaseOptions(
          apiKey: 'AIzaSyBHQVuGW7iNqyL8Zn3ntJj-GVcebADvP1w',
          appId: 'com.example.movie_app',
          messagingSenderId: '479459839502',
          projectId: 'movie-project-33381'
      ))
  :
  await Firebase.initializeApp(


  );

  //await FirebaseFirestore.instance.disableNetwork();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MoviesCubit()),
      ],
      child: MyApp(),
    ),
  );
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
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),
              HomeTab.routeName: (context) => HomeTab(),
              MovieDetailsTab.routeName: (context) => MovieDetailsTab(),
              SearchTab.routeName: (context) => SearchTab(),
              BrowseTab.routeName: (context) => BrowseTab(),
              WatchListTab.routeName: (context) => WatchListTab(),
              CategoryScreen.routeName: (context) => CategoryScreen(),
            },
          );
        });
  }
}
