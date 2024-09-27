import 'package:flutter/material.dart';
import '../Browse Tab/browse_tab.dart';
import '../Search Tab/search_tab.dart';
import '../Themes/app_colors.dart';
import '../WatchList Tab/watchList_tab.dart';
import 'HomeTab/home_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchListTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.barGreyColor,
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        selectedLabelStyle: Theme.of(context).textTheme.bodySmall,
        unselectedLabelStyle: Theme.of(context).textTheme.bodySmall,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primaryYellowColor,
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: selectedIndex == 0
                    ? Image.asset('assets/images/home_yellow.png')
                    : Image.asset('assets/images/home_icon.png'),
              ),
              label: "HOME",
              backgroundColor: AppColors.barGreyColor),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: selectedIndex == 1
                    ? Image.asset('assets/images/searchYellow.png')
                    : Image.asset('assets/images/search.png'),
              ),
              label: "SEARCH",
              backgroundColor: AppColors.barGreyColor),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: selectedIndex == 2
                    ? Image.asset('assets/images/browseYellow.png')
                    : Image.asset('assets/images/browse.png'),
              ),
              label: "BROWSE",
              backgroundColor: AppColors.barGreyColor),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: selectedIndex == 3
                  ? Image.asset('assets/images/watchlistYellow.png')
                  : Image.asset('assets/images/watchlist.png'),
            ),
            label: "WATCHLIST",
            backgroundColor: AppColors.barGreyColor,
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
