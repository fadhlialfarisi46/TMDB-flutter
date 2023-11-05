import 'package:core/common/http_ssl_pinning.dart';
import 'package:core/common/network_info.dart';
import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/data/datasources/movie_local_data_source.dart';
import 'package:core/data/datasources/movie_remote_data_source.dart';
import 'package:core/data/datasources/tvshow_local_data_source.dart';
import 'package:core/data/datasources/tvshow_remote_data_source.dart';
import 'package:core/data/repositories/movie_repository_impl.dart';
import 'package:core/data/repositories/tvshow_repository_impl.dart';
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:core/domain/repositories/tvshow_repository.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/movie.dart';
import 'package:search/domain/usecase/search_movies.dart';
import 'package:search/domain/usecase/search_tvshows.dart';
import 'package:search/presentation/bloc/search_bloc.dart';
import 'package:tvshow/domain/usecase/usecases.dart';
import 'package:tvshow/presentation/bloc/detail_tvshow_bloc/detail_tvshow_bloc.dart';
import 'package:tvshow/presentation/bloc/onair_tvshow_bloc/onair_tvshow_bloc.dart';
import 'package:tvshow/presentation/bloc/popular_tvshow_bloc/popular_tvshow_bloc.dart';
import 'package:tvshow/presentation/bloc/top_rated_tvshow_bloc/top_rated_tvshow_bloc.dart';
import 'package:tvshow/presentation/bloc/tvshow_list_bloc/tvshow_list_bloc.dart';
import 'package:tvshow/presentation/bloc/watchlist_tvshow_bloc/watchlist_tvshow_bloc.dart';

final locator = GetIt.instance;

void init() {
  // BLoC
  locator.registerFactory(
    () => NowPlayingMovieListBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMovieListBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMovieListBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => OnAirTvshowListBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularTvshowListBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedTvshowListBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailBloc(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => SearchMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => SearchTvShowsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularTvshowBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => OnairTvshowBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedTvshowBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => DetailTvshowBloc(
      getDetailTvShow: locator(),
      getRecommendationTvShow: locator(),
      getWatchListByIdTvShow: locator(),
      removeWatchlistTvShow: locator(),
      insertWatchlistTvShow: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistTvShowBloc(
      locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => SearchTvShows(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  locator.registerLazySingleton(() => GetPopularTvShows(locator()));
  locator.registerLazySingleton(() => GetOnAirTvShows(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvShows(locator()));
  locator.registerLazySingleton(() => GetDetailTvShow(locator()));
  locator.registerLazySingleton(() => GetRecommendationTvShows(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvShows(locator()));
  locator.registerLazySingleton(() => GetWatchListByIdTvShow(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTvShow(locator()));
  locator.registerLazySingleton(() => InsertWatchlistTvShow(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );
  locator.registerLazySingleton<TvShowRepository>(
    () => TvShowRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TvShowRemoteDataSource>(
      () => TvShowRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvShowLocalDataSource>(
      () => TvShowLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  //network info
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  // external
  locator.registerLazySingleton(() => HttpSSLPinning.client);
  locator.registerLazySingleton(() => DataConnectionChecker());
}
