// import 'package:about/about.dart';
// import 'package:core/core.dart';
// import 'package:core/presentation/pages/watchlist_page.dart';
// import 'package:flutter/material.dart';
// import 'package:movies/presentation/pages/movie_list_page.dart';
// import 'package:tv_series/presentation/pages/tv_series_list_page.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _bottomNavIndex = 0;

//   final List<BottomNavigationBarItem> _bottomNavBarItems = const [
//     BottomNavigationBarItem(
//       icon: Icon(Icons.movie),
//       label: 'Movies',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(Icons.live_tv_outlined),
//       label: 'TV Series',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(Icons.remove_red_eye),
//       label: 'Watchlist',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(Icons.info_outline),
//       label: 'About',
//     ),
//   ];

//   final List<Widget> _listWidget = [
//     const MovieListPage(),
//     const TvSeriesListPage(),
//     const WatchlistPage(),
//     const AboutPage(),
//   ];

//   void _onBottomNavTapped(int index) {
//     setState(() {
//       _bottomNavIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _listWidget[_bottomNavIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: kMikadoYellow,
//         currentIndex: _bottomNavIndex,
//         items: _bottomNavBarItems,
//         onTap: _onBottomNavTapped,
//       ),
//     );
//   }
// }

// import 'package:ditonton/presentation/pages/movie/home_movie_page.dart';
// import 'package:ditonton/presentation/pages/tv_series/tv_series_page.dart';
import 'package:flutter/material.dart';
import 'package:movies/presentation/pages/movie_list_page.dart';
import 'package:tv_series/presentation/pages/tv_series_list_page.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = '/home-page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MovieListPage(),
    TvSeriesListPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'TV Series',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
