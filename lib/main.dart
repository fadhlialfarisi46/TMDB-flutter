import 'package:about/about_page.dart';
import 'package:core/common/constants.dart';
import 'package:core/common/http_ssl_pinning.dart';
import 'package:core/common/routes.dart';
import 'package:core/common/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:movie/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:movie/presentation/bloc/top_rated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:movie/presentation/bloc/watchlist_movie_bloc/watchlist_movie_bloc.dart';
import 'package:movie/presentation/page/home_movie_page.dart';
import 'package:movie/presentation/page/movie_detail_page.dart';
import 'package:movie/presentation/page/popular_movies_page.dart';
import 'package:movie/presentation/page/top_rated_movies_page.dart';
import 'package:movie/presentation/page/watchlist_movies_page.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:search/presentation/bloc/search_bloc.dart';
import 'package:search/presentation/page/search_page.dart';
import 'package:tvshow/presentation/bloc/detail_tvshow_bloc/detail_tvshow_bloc.dart';
import 'package:tvshow/presentation/bloc/onair_tvshow_bloc/onair_tvshow_bloc.dart';
import 'package:tvshow/presentation/bloc/popular_tvshow_bloc/popular_tvshow_bloc.dart';
import 'package:tvshow/presentation/bloc/top_rated_tvshow_bloc/top_rated_tvshow_bloc.dart';
import 'package:tvshow/presentation/bloc/tvshow_list_bloc/tvshow_list_bloc.dart';
import 'package:tvshow/presentation/bloc/watchlist_tvshow_bloc/watchlist_tvshow_bloc.dart';
import 'package:tvshow/presentation/page/detail_tvshow_page.dart';
import 'package:tvshow/presentation/page/onair_tvshow_page.dart';
import 'package:tvshow/presentation/page/popular_tvshow_page.dart';
import 'package:tvshow/presentation/page/top_rated_tvshow_page.dart';
import 'package:tvshow/presentation/page/tvshow_page.dart';
import 'package:tvshow/presentation/page/watchlist_tvshows_page.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await HttpSSLPinning.init();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<NowPlayingMovieListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMovieListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMovieListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<OnAirTvshowListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularTvshowListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedTvshowListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieDetailBloc>(),
        ),
        BlocProvider(create: (_) => di.locator<SearchTvShowsBloc>()),
        BlocProvider(create: (_) => di.locator<SearchMoviesBloc>()),
        BlocProvider(
          create: (_) => di.locator<TopRatedMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularTvshowBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<OnairTvshowBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedTvshowBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailTvshowBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistTvShowBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Movie TvShow Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case POPULAR_MOVIES_ROUTE:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case POPULAR_TVSHOW_ROUTE:
              return CupertinoPageRoute(builder: (_) => PopularTvShowPage());
            case TOP_RATED_ROUTE:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MOVIE_DETAIL_ROUTE:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case WATCHLIST_MOVIE_ROUTE:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case WATCHLIST_TVSHOW_ROUTE:
              return MaterialPageRoute(builder: (_) => WatchlistTvShowsPage());
            case ABOUT_ROUTE:
              return MaterialPageRoute(builder: (_) => AboutPage());
            case TVSHOW_ROUTE:
              return MaterialPageRoute(builder: (_) => TvShowPage());
            case ONAIR_TVSHOW_ROUTE:
              return MaterialPageRoute(builder: (_) => OnAirTvShowPage());
            case TOP_RATED_TVSHOW_ROUTE:
              return MaterialPageRoute(builder: (_) => TopRatedTvShowPage());
            case DETAIL_TVSHOW_ROUTE:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => DetailTvShowPage(id: id),
                settings: settings,
              );
            case SEARCH_ROUTE:
              final type = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => SearchPage(
                  type: type,
                ),
                settings: settings,
              );
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
