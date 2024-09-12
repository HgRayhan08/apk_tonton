// import 'package:ditonton/data/datasources/db/database_helper.dart';
// import 'package:ditonton/data/datasources/movie_local_data_source.dart';
// import 'package:ditonton/data/datasources/movie_remote_data_source.dart';
// import 'package:ditonton/data/datasources/tv_series_local_data_source.dart';
// import 'package:ditonton/data/datasources/tv_series_remote_data_source.dart';
// import 'package:ditonton/data/repositories/movie_repository_impl.dart';
// import 'package:ditonton/data/repositories/tv_series_repository_impl.dart';
// import 'package:ditonton/domain/repositories/movie_repository.dart';
// import 'package:ditonton/domain/repositories/tv_series_repository.dart';
// import 'package:ditonton/domain/usecases/movie/get_movie_detail.dart';
// import 'package:ditonton/domain/usecases/movie/get_movie_recommendations.dart';
// import 'package:ditonton/domain/usecases/movie/get_now_playing_movies.dart';
// import 'package:ditonton/domain/usecases/movie/get_popular_movies.dart';
// import 'package:ditonton/domain/usecases/movie/get_top_rated_movies.dart';
// import 'package:ditonton/domain/usecases/movie/get_watchlist_movies.dart';
// import 'package:ditonton/domain/usecases/movie/get_watchlist_status.dart';
// import 'package:ditonton/domain/usecases/movie/remove_watchlist.dart';
// import 'package:ditonton/domain/usecases/movie/save_watchlist.dart';
// import 'package:ditonton/domain/usecases/movie/search_movies.dart';
// import 'package:ditonton/domain/usecases/tv_series/get_now_playing_tv_series.dart';
// import 'package:ditonton/domain/usecases/tv_series/get_popular_tv_series.dart';
// import 'package:ditonton/domain/usecases/tv_series/get_top_rated_tv_series.dart';
// import 'package:ditonton/domain/usecases/tv_series/get_tv_series_detail.dart';
// import 'package:ditonton/domain/usecases/tv_series/get_tv_series_recommendations.dart';
// import 'package:ditonton/domain/usecases/tv_series/get_watchlist_status_tv_series.dart';
// import 'package:ditonton/domain/usecases/tv_series/get_watchlist_tv_series.dart';
// import 'package:ditonton/domain/usecases/tv_series/remove_watchlist_tv_series.dart';
// import 'package:ditonton/domain/usecases/tv_series/save_watchlist_tv_series.dart';
// import 'package:ditonton/domain/usecases/tv_series/search_tv_series.dart';
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
// import 'package:http/http.dart' as http;
// import 'package:get_it/get_it.dart';

// final locator = GetIt.instance;

// // void init() {
// //   // provider
// //   locator.registerFactory(
// //     () => MovieListNotifier(
// //       getNowPlayingMovies: locator(),
// //       getPopularMovies: locator(),
// //       getTopRatedMovies: locator(),
// //     ),
// //   );
// //   locator.registerFactory(
// //     () => MovieDetailNotifier(
// //       getMovieDetail: locator(),
// //       getMovieRecommendations: locator(),
// //       getWatchListStatus: locator(),
// //       saveWatchlist: locator(),
// //       removeWatchlist: locator(),
// //     ),
// //   );
// //   locator.registerFactory(
// //     () => MovieSearchNotifier(
// //       searchMovies: locator(),
// //     ),
// //   );
// //   locator.registerFactory(
// //     () => PopularMoviesNotifier(
// //       locator(),
// //     ),
// //   );
// //   locator.registerFactory(
// //     () => TopRatedMoviesNotifier(
// //       getTopRatedMovies: locator(),
// //     ),
// //   );
// //   locator.registerFactory(
// //     () => WatchlistMovieNotifier(
// //       getWatchlistMovies: locator(),
// //     ),
// //   );
// //   // Tv series
// //   locator.registerFactory(
// //     () => TvSeriesListNotifier(
// //       getNowPlayingTvSeries: locator(),
// //       getPopularTvSeries: locator(),
// //       getTopRatedTvSeries: locator(),
// //     ),
// //   );

// //   // use case
// //   locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
// //   locator.registerLazySingleton(() => GetPopularMovies(locator()));
// //   locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
// //   locator.registerLazySingleton(() => GetMovieDetail(locator()));
// //   locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
// //   locator.registerLazySingleton(() => SearchMovies(locator()));
// //   locator.registerLazySingleton(() => GetWatchListStatus(locator()));
// //   locator.registerLazySingleton(() => SaveWatchlist(locator()));
// //   locator.registerLazySingleton(() => RemoveWatchlist(locator()));
// //   locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
// //   // tv Series
// //   locator.registerFactory(() => GetNowPlayingTvSeries(locator()));

// //   // repository
// //   locator.registerLazySingleton<MovieRepository>(
// //     () => MovieRepositoryImpl(
// //       remoteDataSource: locator(),
// //       localDataSource: locator(),
// //     ),
// //   );
// //   locator.registerFactory(
// //     () => TvSeriesRepositoryImpl(
// //       remoteDataSource: locator(),
// //       localDataSource: locator(),
// //     ),
// //   );

// //   // data sources
// //   locator.registerLazySingleton<MovieRemoteDataSource>(
// //       () => MovieRemoteDataSourceImpl(client: locator()));
// //   locator.registerLazySingleton<MovieLocalDataSource>(
// //       () => MovieLocalDataSourceImpl(databaseHelper: locator()));
// //   locator.registerLazySingleton<TvSeriesRemoteDataSource>(
// //       () => TvSeriesRemoteDataSourceImpl(client: locator()));
// //   locator.registerLazySingleton<TvSeriesLocalDataSource>(
// //       () => TvSeriesLocalDataSourceImpl(databaseHelper: locator()));

// //   // helper
// //   locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

// //   // external
// //   locator.registerLazySingleton(() => http.Client());
// // }

// void init() {
//   // provider movies
//   locator.registerFactory(
//     () => MovieListNotifier(
//       getNowPlayingMovies: locator(),
//       getPopularMovies: locator(),
//       getTopRatedMovies: locator(),
//     ),
//   );
//   locator.registerFactory(
//     () => MovieDetailNotifier(
//       getMovieDetail: locator(),
//       getMovieRecommendations: locator(),
//       getWatchListStatus: locator(),
//       saveWatchlist: locator(),
//       removeWatchlist: locator(),
//     ),
//   );
//   locator.registerFactory(
//     () => MovieSearchNotifier(
//       searchMovies: locator(),
//     ),
//   );
//   locator.registerFactory(
//     () => PopularMoviesNotifier(
//       locator(),
//     ),
//   );
//   locator.registerFactory(
//     () => TopRatedMoviesNotifier(
//       getTopRatedMovies: locator(),
//     ),
//   );
//   locator.registerFactory(
//     () => WatchlistMovieNotifier(
//       getWatchlistMovies: locator(),
//     ),
//   );
//   // provider tv series
//   locator.registerFactory(
//     () => TvSeriesListNotifier(
//       getNowPlayingTvSeries: locator(),
//       getPopularTvSeries: locator(),
//       getTopRatedTvSeries: locator(),
//     ),
//   );
//   locator.registerFactory(() => NowPlayingTvSeriesNotifier(locator()));
//   locator.registerFactory(() => PopularTvSeriesNotifier(locator()));
//   locator.registerFactory(() => TopRatedTvSeriesNotifier(locator()));
//   locator.registerFactory(() => TvSeriesSearchNotifier(locator()));
//   locator.registerFactory(
//     () => TvSeriesDetailNotifier(
//       getTvSeriesDetail: locator(),
//       getTvSeriesRecommendations: locator(),
//       getWatchListStatusTvSeries: locator(),
//       saveWatchlistTvSeries: locator(),
//       removeWatchlistTvSeries: locator(),
//     ),
//   );
//   locator.registerFactory(
//     () => WatchlistTvSeriesNotifier(getWatchlistTvSeries: locator()),
//   );

//   // use case movies
//   locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
//   locator.registerLazySingleton(() => GetPopularMovies(locator()));
//   locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
//   locator.registerLazySingleton(() => GetMovieDetail(locator()));
//   locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
//   locator.registerLazySingleton(() => SearchMovies(locator()));
//   locator.registerLazySingleton(() => GetWatchListStatus(locator()));
//   locator.registerLazySingleton(() => SaveWatchlist(locator()));
//   locator.registerLazySingleton(() => RemoveWatchlist(locator()));
//   locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
//   // use case tv series
//   locator.registerLazySingleton(() => GetNowPlayingTvSeries(locator()));
//   locator.registerLazySingleton(() => GetPopularTvSeries(locator()));
//   locator.registerLazySingleton(() => GetTopRatedTvSeries(locator()));
//   locator.registerLazySingleton(() => SearchTvSeries(locator()));
//   locator.registerLazySingleton(() => GetTvSeriesDetail(locator()));
//   locator.registerLazySingleton(() => GetTvSeriesRecommendations(locator()));
//   locator.registerLazySingleton(() => GetWatchListStatusTvSeries(locator()));
//   locator.registerLazySingleton(() => SaveWatchlistTvSeries(locator()));
//   locator.registerLazySingleton(() => RemoveWatchlistTvSeries(locator()));
//   locator.registerLazySingleton(() => GetWatchlistTvSeries(locator()));

//   // repository
//   locator.registerLazySingleton<MovieRepository>(
//     () => MovieRepositoryImpl(
//       remoteDataSource: locator(),
//       localDataSource: locator(),
//     ),
//   );
//   locator.registerLazySingleton<TvSeriesRepository>(
//     () => TvSeriesRepositoryImpl(
//       remoteDataSource: locator(),
//       localDataSource: locator(),
//     ),
//   );

//   // data sources
//   locator.registerLazySingleton<MovieRemoteDataSource>(
//       () => MovieRemoteDataSourceImpl(client: locator()));
//   locator.registerLazySingleton<MovieLocalDataSource>(
//       () => MovieLocalDataSourceImpl(databaseHelper: locator()));
//   locator.registerLazySingleton<TvSeriesRemoteDataSource>(
//       () => TvSeriesRemoteDataSourceImpl(client: locator()));
//   locator.registerLazySingleton<TvSeriesLocalDataSource>(
//       () => TvSeriesLocalDataSourceImpl(databaseHelper: locator()));

//   // helper
//   locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

//   // external
//   locator.registerLazySingleton(() => http.Client());
// }

import 'package:core/core.dart';
import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/data/datasources/movie_local_data_source.dart';
import 'package:core/data/datasources/movie_remote_data_source.dart';
import 'package:core/data/datasources/tv_series_local_data_source.dart';
import 'package:core/data/datasources/tv_series_remote_data_source.dart';
import 'package:core/data/repositories/movie_repository_impl.dart';
import 'package:core/data/repositories/tv_series_repository_impl.dart';
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:core/domain/repositories/tv_series_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/domain/usecases/get_detail_movie.dart';
import 'package:movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/domain/usecases/get_recommendation_movies.dart';
import 'package:movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_status_movie.dart';
import 'package:movies/domain/usecases/remove_watchlist_movie.dart';
import 'package:movies/domain/usecases/save_watchlist_movie.dart';
import 'package:movies/domain/usecases/search_movies.dart';
import 'package:movies/presentation/blocs/detail/detail_movie_bloc.dart';
import 'package:movies/presentation/blocs/now_playing/now_playing_movies_bloc.dart';
import 'package:movies/presentation/blocs/popular/popular_movies_bloc.dart';
import 'package:movies/presentation/blocs/search/search_movies_bloc.dart';
import 'package:movies/presentation/blocs/top_rated/top_rated_movies_bloc.dart';
import 'package:movies/presentation/blocs/watchlist/watchlist_movies_bloc.dart';
import 'package:tv_series/domain/usecases/get_detail_tv_series.dart';
import 'package:tv_series/domain/usecases/get_now_playing_tv_series.dart';
import 'package:tv_series/domain/usecases/get_popular_tv_series.dart';
import 'package:tv_series/domain/usecases/get_recommendation_tv_series.dart';
import 'package:tv_series/domain/usecases/get_season_detail.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv_series.dart';
import 'package:tv_series/domain/usecases/get_watchlist_status_tv_series.dart';
import 'package:tv_series/domain/usecases/get_watchlist_tv_series.dart';
import 'package:tv_series/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:tv_series/domain/usecases/save_watchlist_tv_series.dart';
import 'package:tv_series/domain/usecases/search_tv_series.dart';
import 'package:tv_series/presentation/blocs/detail/detail_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/now_playing/now_playing_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/popular/popular_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/recommendation/recommendation_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/search/search_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/season_detail/season_detail_bloc.dart';
import 'package:tv_series/presentation/blocs/top_rated/top_rated_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/watchlist/watchlist_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/watchlist_status/watchlist_status_tv_series_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => NowPlayingMoviesBloc(locator()));
  locator.registerFactory(() => PopularMoviesBloc(locator()));
  locator.registerFactory(() => TopRatedMoviesBloc(locator()));
  locator.registerFactory(
    () => DetailMovieBloc(
      getDetailMovie: locator(),
      getRecommendationMovies: locator(),
      saveWatchlistMovie: locator(),
      removeWatchlistMovie: locator(),
      getWatchListStatusMovie: locator(),
    ),
  );
  locator.registerFactory(() => WatchlistMoviesBloc(locator()));
  locator.registerFactory(() => SearchMoviesBloc(locator()));

  // bloc tv series
  locator.registerFactory(() => NowPlayingTvSeriesBloc(locator()));
  locator.registerFactory(() => PopularTvSeriesBloc(locator()));
  locator.registerFactory(() => TopRatedTvSeriesBloc(locator()));
  locator.registerFactory(() => DetailTvSeriesBloc(locator()));
  locator.registerFactory(() => SeasonDetailBloc(locator()));
  locator.registerFactory(() => RecommendationTvSeriesBloc(locator()));
  locator.registerFactory(
    () => WatchlistStatusTvSeriesBloc(
      getWatchListStatusTvSeries: locator(),
      removeWatchlistTvSeries: locator(),
      saveWatchlistTvSeries: locator(),
    ),
  );
  locator.registerFactory(() => WatchlistTvSeriesBloc(locator()));
  locator.registerFactory(() => SearchTvSeriesBloc(locator()));

  // use case movies
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetDetailMovie(locator()));
  locator.registerLazySingleton(() => GetRecommendationMovies(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusMovie(locator()));
  locator.registerLazySingleton(() => SaveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  // use case tv series
  locator.registerLazySingleton(() => GetNowPlayingTvSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTvSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvSeries(locator()));
  locator.registerLazySingleton(() => SearchTvSeries(locator()));
  locator.registerLazySingleton(() => GetDetailTvSeries(locator()));
  locator.registerLazySingleton(() => GetSeasonDetail(locator()));
  locator.registerLazySingleton(() => GetRecommendationTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusTvSeries(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvSeries(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TvSeriesRepository>(
    () => TvSeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
      () => TvSeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
      () => TvSeriesLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => HttpSSLPinning.client);
}
