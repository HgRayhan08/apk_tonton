import 'package:core/core.dart';
import 'package:core/presentation/pages/home_page.dart';
// import 'package:ditonton/common/constants.dart';
// import 'package:ditonton/common/utils.dart';
// import 'package:ditonton/presentation/pages/about_page.dart';
// import 'package:ditonton/presentation/pages/home_page.dart';
// import 'package:ditonton/presentation/pages/movie/movie_detail_page.dart';
// import 'package:ditonton/presentation/pages/movie/home_movie_page.dart';
// import 'package:ditonton/presentation/pages/movie/popular_movies_page.dart';
// import 'package:ditonton/presentation/pages/movie/search_page.dart';
// import 'package:ditonton/presentation/pages/movie/top_rated_movies_page.dart';
// import 'package:ditonton/presentation/pages/tv_series/popular_tv_series_page.dart';
// import 'package:ditonton/presentation/pages/tv_series/search_tv_series_page.dart';
// import 'package:ditonton/presentation/pages/tv_series/top_rated_tv_series_page.dart';
// import 'package:ditonton/presentation/pages/tv_series/tv_series_detail_page.dart';
// import 'package:ditonton/presentation/pages/tv_series/tv_series_page.dart';
// import 'package:ditonton/presentation/pages/movie/watchlist_movies_page.dart';
// import 'package:ditonton/presentation/pages/tv_series/watchlist_tv_series_page.dart';
// import 'package:ditonton/presentation/provider/movie/movie_detail_notifier.dart';
// import 'package:ditonton/presentation/provider/movie/movie_list_notifier.dart';
// import 'package:ditonton/presentation/provider/movie/movie_search_notifier.dart';
// import 'package:ditonton/presentation/provider/movie/popular_movies_notifier.dart';
// import 'package:ditonton/presentation/provider/movie/top_rated_movies_notifier.dart';
// import 'package:ditonton/presentation/provider/movie/watchlist_movie_notifier.dart';
// import 'package:ditonton/presentation/provider/tv_series/now_playing_tv_series_notifier.dart';
// import 'package:ditonton/presentation/provider/tv_series/popular_tv_series_notifier.dart';
// import 'package:ditonton/presentation/provider/tv_series/top_rated_tv_series_notifier.dart';
// import 'package:ditonton/presentation/provider/tv_series/tv_series_detail_notifier.dart';
// import 'package:ditonton/presentation/provider/tv_series/tv_series_list_notifier.dart';
// import 'package:ditonton/presentation/provider/tv_series/tv_series_search_notifier.dart';
// import 'package:ditonton/presentation/provider/tv_series/watchlist_tv_series_notifier.dart';
import 'package:flutter/material.dart';
import 'package:movies/presentation/blocs/detail/detail_movie_bloc.dart';
import 'package:movies/presentation/blocs/now_playing/now_playing_movies_bloc.dart';
import 'package:movies/presentation/blocs/popular/popular_movies_bloc.dart';
import 'package:movies/presentation/blocs/search/search_movies_bloc.dart';
import 'package:movies/presentation/blocs/top_rated/top_rated_movies_bloc.dart';
import 'package:movies/presentation/blocs/watchlist/watchlist_movies_bloc.dart';
import 'package:movies/presentation/pages/movie_detail_page.dart';
import 'package:movies/presentation/pages/popular_movies_page.dart';
import 'package:movies/presentation/pages/search_movies_page.dart';
import 'package:movies/presentation/pages/top_rated_movies_page.dart';
import 'package:movies/presentation/pages/watchlist_movies_page.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/blocs/detail/detail_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/now_playing/now_playing_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/popular/popular_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/recommendation/recommendation_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/search/search_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/season_detail/season_detail_bloc.dart';
import 'package:tv_series/presentation/blocs/top_rated/top_rated_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/watchlist/watchlist_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/watchlist_status/watchlist_status_tv_series_bloc.dart';
import 'package:tv_series/presentation/pages/now_playing_tv_series_page.dart';
import 'package:tv_series/presentation/pages/popular_tv_series_page.dart';
import 'package:tv_series/presentation/pages/search_tv_series_page.dart';
import 'package:tv_series/presentation/pages/season_detail_page.dart';
import 'package:tv_series/presentation/pages/top_rated_tv_series_page.dart';
import 'package:tv_series/presentation/pages/tv_series_detail_page.dart';
import 'package:tv_series/presentation/pages/watchlist_tv_series_page.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HttpSSLPinning.init();
  di.init();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<NowPlayingMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<NowPlayingTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<RecommendationTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistStatusTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SeasonDetailBloc>(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<MovieListNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<MovieDetailNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<MovieSearchNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TopRatedMoviesNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<PopularMoviesNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<WatchlistMovieNotifier>(),
        // ),
        // // list tv series
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TvSeriesListNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<NowPlayingTvSeriesNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<PopularTvSeriesNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TopRatedTvSeriesNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TvSeriesSearchNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TvSeriesDetailNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<WatchlistTvSeriesNotifier>(),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          // textTheme: kTextTheme,
        ),
        home: HomePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            // case HomePage.ROUTE_NAME:
            //   return CupertinoPageRoute(builder: (_) => HomePage());
            // case '/home':
            //   return MaterialPageRoute(builder: (_) => HomePage());
            // case PopularMoviesPage:
            //   return MaterialPageRoute(builder: (_) => PopularMoviesPage());
            // case TopRatedMoviesPage:
            //   return MaterialPageRoute(builder: (_) => TopRatedMoviesPage());
            // case MovieDetailPage:
            //   final id = settings.arguments as int;
            //   return MaterialPageRoute(
            //     builder: (_) => MovieDetailPage(id: id),
            //     settings: settings,
            //   );
            // case SearchMoviesPage():
            //   return CupertinoPageRoute(builder: (_) => SearchPage());
            // case WatchlistMoviesPage:
            //   return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            // // case AboutPage:
            // //   return MaterialPageRoute(builder: (_) => AboutPage());
            // case TvSeriesListPage():
            //   return MaterialPageRoute(builder: (_) => TvSeriesListPage());
            // case TvSeriesDetailPage:
            //   final id = settings.arguments as int;
            //   return MaterialPageRoute(
            //     builder: (_) => TvSeriesDetailPage(id: id),
            //     settings: settings,
            //   );
            // case PopularTvSeriesPage:
            //   return MaterialPageRoute(builder: (_) => PopularTvSeriesPage());
            // case TopRatedTvSeriesPage:
            //   return MaterialPageRoute(builder: (_) => TopRatedTvSeriesPage());
            // case SearchTvSeriesPage:
            //   return MaterialPageRoute(builder: (_) => SearchTvSeriesPage());
            // case WatchlistTvSeriesPage.ROUTE_NAME:
            //   return MaterialPageRoute(builder: (_) => WatchlistTvSeriesPage());
            case popularMoviesRoute:
              return MaterialPageRoute(builder: (_) => PopularMoviesPage());
            case topRatedMoviesRoute:
              return MaterialPageRoute(builder: (_) => TopRatedMoviesPage());
            case movieDetailRoute:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case searchMoviesRoute:
              return MaterialPageRoute(builder: (_) => SearchMoviesPage());
            case watchListMovies:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case nowPlayingTvSeriesRoute:
              return MaterialPageRoute(
                builder: (_) => NowPlayingTvSeriesPage(),
              );
            case popularTvSeriesRoute:
              return MaterialPageRoute(builder: (_) => PopularTvSeriesPage());
            case topRatedTvSeriesRoute:
              return MaterialPageRoute(builder: (_) => TopRatedTvSeriesPage());
            case searchTvSeriesRoute:
              return MaterialPageRoute(builder: (_) => SearchTvSeriesPage());
            case tvSeriesDetailRoute:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvSeriesDetailPage(id: id),
                settings: settings,
              );
            case seasonDetailRoute:
              final args = settings.arguments as Map;
              return MaterialPageRoute(
                builder: (_) => SeasonDetailPage(
                  id: args['id'],
                  seasonNumber: args['seasonNumber'],
                ),
                settings: settings,
              );
            case watchlistTvSeries:
              return MaterialPageRoute(builder: (_) => WatchlistTvSeriesPage());
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
