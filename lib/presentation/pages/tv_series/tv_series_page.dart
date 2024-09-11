import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/movie/watchlist_movies_page.dart';
import 'package:ditonton/presentation/pages/tv_series/popular_tv_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series/search_tv_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series/top_rated_tv_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series/watchlist_tv_series_page.dart';
import 'package:ditonton/presentation/provider/tv_series/tv_series_list_notifier.dart';
import 'package:ditonton/presentation/widgets/card_list_widget.dart';
import 'package:ditonton/presentation/widgets/sub_heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/tv-series';
  const TvSeriesPage({Key? key}) : super(key: key);

  @override
  State<TvSeriesPage> createState() => _TvSeriesPageState();
}

class _TvSeriesPageState extends State<TvSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<TvSeriesListNotifier>(context, listen: false)
        ..fetchNowPlayingTvSeries()
        ..fetchPopularTvSeries()
        ..fetchTopRatedTvSeries(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text(
                'Ditonton',
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                'ditonton@gmail.com',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist Movie'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist Tv Series'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistTvSeriesPage.ROUTE_NAME);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Ditonton"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchTvSeriesPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SubHeadlingWidget(
                title: "Now Playing",
                onTap: () {},
              ),
              Consumer<TvSeriesListNotifier>(
                builder: (context, data, child) {
                  final state = data.nowPlayingState;
                  if (state == RequestState.Loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state == RequestState.Loaded) {
                    return CardListWidget(
                      data.nowPlayingTvSeries,
                    );
                  } else {
                    return Text("Failed");
                  }
                },
              ),
              SubHeadlingWidget(
                  title: "Popular",
                  onTap: () {
                    Navigator.pushNamed(
                        context, PopularTvSeriesPage.ROUTE_NAME);
                  }),
              Consumer<TvSeriesListNotifier>(
                builder: (context, data, child) {
                  final state = data.popularState;
                  if (state == RequestState.Loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state == RequestState.Loaded) {
                    return CardListWidget(
                      data.popularTvSeries,
                    );
                  } else {
                    return Text("Failed");
                  }
                },
              ),
              SubHeadlingWidget(
                  title: "Top Rated",
                  onTap: () {
                    Navigator.pushNamed(
                        context, TopRatedTvSeriesPage.ROUTE_NAME);
                  }),
              Consumer<TvSeriesListNotifier>(
                builder: (context, data, child) {
                  final state = data.topRatedState;
                  if (state == RequestState.Loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state == RequestState.Loaded) {
                    return CardListWidget(
                      data.topRatedTvSeries,
                    );
                  } else {
                    return Text("Failed");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class TvSeriesList extends StatelessWidget {
//   final List<TvSeries> tvSeries;

//   TvSeriesList(this.tvSeries);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           final item = tvSeries[index];
//           return Container(
//             padding: const EdgeInsets.all(8),
//             child: InkWell(
//               onTap: () {
//                 // Navigator.pushNamed(
//                 //   context,
//                 //   TvSeriesDetailPage.ROUTE_NAME,
//                 //   arguments: item.id,
//                 // );
//               },
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//                 child: CachedNetworkImage(
//                   imageUrl: '$BASE_IMAGE_URL${item.posterPath}',
//                   placeholder: (context, url) => Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                   errorWidget: (context, url, error) => Icon(Icons.error),
//                 ),
//               ),
//             ),
//           );
//         },
//         itemCount: tvSeries.length,
//       ),
//     );
//   }
// }
