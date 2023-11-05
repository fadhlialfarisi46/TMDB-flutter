/*
 * *
 *  * Created by fadhlialfarisi on 11/5/23, 1:46 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/5/23, 1:46 PM
 *
 */
import 'package:bloc_test/bloc_test.dart';
import 'package:core/common/failure.dart';
import 'package:core/common/state_enum.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/entities/movie_detail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/usecase/get_movie_detail.dart';
import 'package:movie/domain/usecase/get_movie_recommendations.dart';
import 'package:movie/domain/usecase/get_watchlist_status.dart';
import 'package:movie/domain/usecase/remove_watchlist.dart';
import 'package:movie/domain/usecase/save_watchlist.dart';
import 'package:movie/presentation/bloc/movie_detail_bloc/movie_detail_bloc.dart';

import 'movie_detail_bloc_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
  GetWatchListStatus,
  SaveWatchlist,
  RemoveWatchlist,
])
void main() {
  late MovieDetailBloc movieDetailBloc;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetWatchListStatus mockGetWatchlistStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetWatchlistStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();
    movieDetailBloc = MovieDetailBloc(
      getMovieDetail: mockGetMovieDetail,
      getMovieRecommendations: mockGetMovieRecommendations,
      getWatchListStatus: mockGetWatchlistStatus,
      saveWatchlist: mockSaveWatchlist,
      removeWatchlist: mockRemoveWatchlist,
    );
  });

  const tId = 1;
  final movieDetailStateInit = MovieDetailState.initial();
  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );
  final tMovies = <Movie>[tMovie];

  final tMovieDetail = MovieDetail(
    adult: false,
    backdropPath: 'backdropPath',
    genres: [Genre(id: 1, name: 'Comedy')],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    runtime: 1,
    title: 'title',
    voteAverage: 1,
    voteCount: 1,
  );

  group('Get Movie Detail', () {
    blocTest<MovieDetailBloc, MovieDetailState>(
      'Shoud emit MovieDetailLoading, RecomendationLoading, MovieDetailLoaded and RecomendationLoaded when get  Detail Movies and Recommendation Success',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => Right(tMovieDetail));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Right(tMovies));
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(const FetchMovieDetail(tId)),
      expect: () => [
        movieDetailStateInit.copyWith(movieDetailState: RequestState.loading),
        movieDetailStateInit.copyWith(
          movieRecommendationState: RequestState.loading,
          movieDetail: tMovieDetail,
          movieDetailState: RequestState.loaded,
          message: '',
        ),
        movieDetailStateInit.copyWith(
          movieDetailState: RequestState.loaded,
          movieDetail: tMovieDetail,
          movieRecommendationState: RequestState.loaded,
          movieRecommendations: tMovies,
          message: '',
        ),
      ],
      verify: (_) {
        verify(mockGetMovieDetail.execute(tId));
        verify(mockGetMovieRecommendations.execute(tId));
      },
    );

    blocTest<MovieDetailBloc, MovieDetailState>(
      'Shoud emit MovieDetailLoading, RecomendationLoading, MovieDetailLoaded and RecommendationError when Get MovieRecommendations Failed',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => Right(tMovieDetail));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => const Left(ConnectionFailure('Failed')));
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(const FetchMovieDetail(tId)),
      expect: () => [
        movieDetailStateInit.copyWith(movieDetailState: RequestState.loading),
        movieDetailStateInit.copyWith(
          movieRecommendationState: RequestState.loading,
          movieDetail: tMovieDetail,
          movieDetailState: RequestState.loaded,
          message: '',
        ),
        movieDetailStateInit.copyWith(
          movieDetailState: RequestState.loaded,
          movieDetail: tMovieDetail,
          movieRecommendationState: RequestState.error,
          message: 'Failed',
        ),
      ],
      verify: (_) {
        verify(mockGetMovieDetail.execute(tId));
        verify(mockGetMovieRecommendations.execute(tId));
      },
    );

    blocTest<MovieDetailBloc, MovieDetailState>(
      'Shoud emit MovieDetailError when Get Movie Detail Failed',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => const Left(ConnectionFailure('Failed')));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Right(tMovies));
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(const FetchMovieDetail(tId)),
      expect: () => [
        movieDetailStateInit.copyWith(movieDetailState: RequestState.loading),
        movieDetailStateInit.copyWith(
            movieDetailState: RequestState.error, message: 'Failed'),
      ],
      verify: (_) {
        verify(mockGetMovieDetail.execute(tId));
        verify(mockGetMovieRecommendations.execute(tId));
      },
    );
  });

  group('AddToWatchlist Movie', () {
    blocTest<MovieDetailBloc, MovieDetailState>(
      'Shoud emit WatchlistMessage and isAddedToWatchlist True when Success AddWatchlist',
      build: () {
        when(mockSaveWatchlist.execute(tMovieDetail))
            .thenAnswer((_) async => const Right('Added to Watchlist'));
        when(mockGetWatchlistStatus.execute(tMovieDetail.id))
            .thenAnswer((_) async => true);
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(AddToWatchlist(tMovieDetail)),
      expect: () => [
        movieDetailStateInit.copyWith(watchlistMessage: 'Added to Watchlist'),
        movieDetailStateInit.copyWith(
            watchlistMessage: 'Added to Watchlist', isAddedToWatchlist: true),
      ],
      verify: (_) {
        verify(mockSaveWatchlist.execute(tMovieDetail));
        verify(mockGetWatchlistStatus.execute(tMovieDetail.id));
      },
    );

    blocTest<MovieDetailBloc, MovieDetailState>(
      'Shoud emit watchlistMessage when Failed',
      build: () {
        when(mockSaveWatchlist.execute(tMovieDetail))
            .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
        when(mockGetWatchlistStatus.execute(tMovieDetail.id))
            .thenAnswer((_) async => false);
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(AddToWatchlist(tMovieDetail)),
      expect: () => [
        movieDetailStateInit.copyWith(watchlistMessage: 'Failed'),
      ],
      verify: (_) {
        verify(mockSaveWatchlist.execute(tMovieDetail));
        verify(mockGetWatchlistStatus.execute(tMovieDetail.id));
      },
    );
  });

  group('RemoveFromWatchlist Movie', () {
    blocTest<MovieDetailBloc, MovieDetailState>(
      'Shoud emit WatchlistMessage and isAddedToWatchlist False when Success RemoveFromWatchlist',
      build: () {
        when(mockRemoveWatchlist.execute(tMovieDetail))
            .thenAnswer((_) async => const Right('Removed From Watchlist'));
        when(mockGetWatchlistStatus.execute(tMovieDetail.id))
            .thenAnswer((_) async => false);
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(RemoveFromWatchlist(tMovieDetail)),
      expect: () => [
        movieDetailStateInit.copyWith(
            watchlistMessage: 'Removed From Watchlist',
            isAddedToWatchlist: false),
      ],
      verify: (_) {
        verify(mockRemoveWatchlist.execute(tMovieDetail));
        verify(mockGetWatchlistStatus.execute(tMovieDetail.id));
      },
    );

    blocTest<MovieDetailBloc, MovieDetailState>(
      'Shoud emit watchlistMessage when Failed',
      build: () {
        when(mockRemoveWatchlist.execute(tMovieDetail))
            .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
        when(mockGetWatchlistStatus.execute(tMovieDetail.id))
            .thenAnswer((_) async => false);
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(RemoveFromWatchlist(tMovieDetail)),
      expect: () => [
        movieDetailStateInit.copyWith(watchlistMessage: 'Failed'),
      ],
      verify: (_) {
        verify(mockRemoveWatchlist.execute(tMovieDetail));
        verify(mockGetWatchlistStatus.execute(tMovieDetail.id));
      },
    );
  });

  group('LoadWatchlistStatus', () {
    blocTest<MovieDetailBloc, MovieDetailState>(
      'Should Emit AddWatchlistStatus True',
      build: () {
        when(mockGetWatchlistStatus.execute(tId)).thenAnswer((_) async => true);
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(const LoadWatchlistStatus(tId)),
      expect: () => [
        movieDetailStateInit.copyWith(isAddedToWatchlist: true),
      ],
      verify: (_) {
        verify(mockGetWatchlistStatus.execute(tMovieDetail.id));
      },
    );
  });
}
