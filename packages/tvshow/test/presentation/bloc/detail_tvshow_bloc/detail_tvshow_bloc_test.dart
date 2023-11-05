/*
 * *
 *  * Created by fadhlialfarisi on 11/5/23, 10:10 AM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/5/23, 10:10 AM
 *
 */
import 'package:bloc_test/bloc_test.dart';
import 'package:core/common/failure.dart';
import 'package:core/common/state_enum.dart';
import 'package:core/domain/entities/tvshow.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvshow/domain/usecase/usecases.dart';
import 'package:tvshow/presentation/bloc/detail_tvshow_bloc/detail_tvshow_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'detail_tvshow_bloc_test.mocks.dart';

@GenerateMocks([
  GetDetailTvShow,
  GetRecommendationTvShows,
  GetWatchListByIdTvShow,
  InsertWatchlistTvShow,
  RemoveWatchlistTvShow,
])
void main() {
  late DetailTvshowBloc detailTvshowBloc;
  late MockGetDetailTvShow mockGetDetailTvShow;
  late MockGetRecommendationTvShows mockGetRecommendationTvShow;
  late MockGetWatchListByIdTvShow mockGetWatchListByIdTvShow;
  late MockInsertWatchlistTvShow mockInsertWatchlistTvShow;
  late MockRemoveWatchlistTvShow mockRemoveWatchlistTvShow;

  setUp(() {
    mockGetDetailTvShow = MockGetDetailTvShow();
    mockGetRecommendationTvShow = MockGetRecommendationTvShows();
    mockGetWatchListByIdTvShow = MockGetWatchListByIdTvShow();
    mockInsertWatchlistTvShow = MockInsertWatchlistTvShow();
    mockRemoveWatchlistTvShow = MockRemoveWatchlistTvShow();
    detailTvshowBloc = DetailTvshowBloc(
      getDetailTvShow: mockGetDetailTvShow,
      getRecommendationTvShow: mockGetRecommendationTvShow,
      getWatchListByIdTvShow: mockGetWatchListByIdTvShow,
      insertWatchlistTvShow: mockInsertWatchlistTvShow,
      removeWatchlistTvShow: mockRemoveWatchlistTvShow,
    );
  });

  final detailTvshowState = DetailTvshowState.initial();

  const tId = 1;
  final tTvShow = TvShow(
    backdropPath: 'backdropPath',
    firstAirDate: DateTime.parse('2022-14-08'),
    genreIds: const [1, 2, 3],
    id: 1,
    name: 'name',
    originCountry: const ['en'],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
  );
  final tTvShowS = <TvShow>[tTvShow];

  group('Get TvShow Detail', () {
    blocTest<DetailTvshowBloc, DetailTvshowState>(
      'Shoud emit TvShowDetailLoading, RecomendationLoading, TvShowDetailLoaded and RecomendationLoaded when get  Detail TvShows and Recommendation Success',
      build: () {
        when(mockGetDetailTvShow.execute(tId))
            .thenAnswer((_) async => Right(testTvShowDetail));
        when(mockGetRecommendationTvShow.execute(tId))
            .thenAnswer((_) async => Right(tTvShowS));
        return detailTvshowBloc;
      },
      act: (bloc) => bloc.add(const FetchDetailTvShow(tId)),
      expect: () => [
        detailTvshowState.copyWith(tvShowDetailState: RequestState.loading),
        detailTvshowState.copyWith(
          tvShowRecommendationsState: RequestState.loading,
          tvShowDetail: testTvShowDetail,
          tvShowDetailState: RequestState.loaded,
          message: '',
        ),
        detailTvshowState.copyWith(
          tvShowDetailState: RequestState.loaded,
          tvShowDetail: testTvShowDetail,
          tvShowRecommendationsState: RequestState.loaded,
          tvShowRecommendations: tTvShowS,
          message: '',
        ),
      ],
      verify: (_) {
        verify(mockGetDetailTvShow.execute(tId));
        verify(mockGetRecommendationTvShow.execute(tId));
      },
    );

    blocTest<DetailTvshowBloc, DetailTvshowState>(
      'Shoud emit TvShowDetailLoading, RecomendationLoading, TvShowDetailLoaded and RecommendationError when Get TvShowRecommendations Failed',
      build: () {
        when(mockGetDetailTvShow.execute(tId))
            .thenAnswer((_) async => Right(testTvShowDetail));
        when(mockGetRecommendationTvShow.execute(tId))
            .thenAnswer((_) async => const Left(ConnectionFailure('Failed')));
        return detailTvshowBloc;
      },
      act: (bloc) => bloc.add(const FetchDetailTvShow(tId)),
      expect: () => [
        detailTvshowState.copyWith(tvShowDetailState: RequestState.loading),
        detailTvshowState.copyWith(
          tvShowRecommendationsState: RequestState.loading,
          tvShowDetail: testTvShowDetail,
          tvShowDetailState: RequestState.loaded,
          message: '',
        ),
        detailTvshowState.copyWith(
          tvShowDetailState: RequestState.loaded,
          tvShowDetail: testTvShowDetail,
          tvShowRecommendationsState: RequestState.error,
          message: 'Failed',
        ),
      ],
      verify: (_) {
        verify(mockGetDetailTvShow.execute(tId));
        verify(mockGetRecommendationTvShow.execute(tId));
      },
    );

    blocTest<DetailTvshowBloc, DetailTvshowState>(
      'Shoud emit TvShowDetailError when Get TvShow Detail Failed',
      build: () {
        when(mockGetDetailTvShow.execute(tId))
            .thenAnswer((_) async => const Left(ConnectionFailure('Failed')));
        when(mockGetRecommendationTvShow.execute(tId))
            .thenAnswer((_) async => Right(tTvShowS));
        return detailTvshowBloc;
      },
      act: (bloc) => bloc.add(const FetchDetailTvShow(tId)),
      expect: () => [
        detailTvshowState.copyWith(tvShowDetailState: RequestState.loading),
        detailTvshowState.copyWith(
            tvShowDetailState: RequestState.error, message: 'Failed'),
      ],
      verify: (_) {
        verify(mockGetDetailTvShow.execute(tId));
        verify(mockGetRecommendationTvShow.execute(tId));
      },
    );
  });

  group('AddToWatchlist TvShow', () {
    blocTest<DetailTvshowBloc, DetailTvshowState>(
      'Shoud emit WatchlistMessage and isAddedToWatchlist True when Success AddWatchlist',
      build: () {
        when(mockInsertWatchlistTvShow.execute(testTvShowDetail))
            .thenAnswer((_) async => const Right('Added to Watchlist'));
        when(mockGetWatchListByIdTvShow.execute(testTvShowDetail.id))
            .thenAnswer((_) async => true);
        return detailTvshowBloc;
      },
      act: (bloc) => bloc.add(AddToWatchlist(testTvShowDetail)),
      expect: () => [
        detailTvshowState.copyWith(watchlistMessage: 'Added to Watchlist'),
        detailTvshowState.copyWith(
            watchlistMessage: 'Added to Watchlist', isAddedToWatchlist: true),
      ],
      verify: (_) {
        verify(mockInsertWatchlistTvShow.execute(testTvShowDetail));
        verify(mockGetWatchListByIdTvShow.execute(testTvShowDetail.id));
      },
    );

    blocTest<DetailTvshowBloc, DetailTvshowState>(
      'Shoud emit watchlistMessage when Failed',
      build: () {
        when(mockInsertWatchlistTvShow.execute(testTvShowDetail))
            .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
        when(mockGetWatchListByIdTvShow.execute(testTvShowDetail.id))
            .thenAnswer((_) async => false);
        return detailTvshowBloc;
      },
      act: (bloc) => bloc.add(AddToWatchlist(testTvShowDetail)),
      expect: () => [
        detailTvshowState.copyWith(watchlistMessage: 'Failed'),
      ],
      verify: (_) {
        verify(mockInsertWatchlistTvShow.execute(testTvShowDetail));
        verify(mockGetWatchListByIdTvShow.execute(testTvShowDetail.id));
      },
    );
  });

  group('RemoveFromWatchlist TvShow', () {
    blocTest<DetailTvshowBloc, DetailTvshowState>(
      'Shoud emit WatchlistMessage and isAddedToWatchlist False when Success RemoveFromWatchlist',
      build: () {
        when(mockRemoveWatchlistTvShow.execute(testTvShowDetail))
            .thenAnswer((_) async => const Right('Removed From Watchlist'));
        when(mockGetWatchListByIdTvShow.execute(testTvShowDetail.id))
            .thenAnswer((_) async => false);
        return detailTvshowBloc;
      },
      act: (bloc) => bloc.add(RemoveFromWatchlist(testTvShowDetail)),
      expect: () => [
        detailTvshowState.copyWith(
            watchlistMessage: 'Removed From Watchlist',
            isAddedToWatchlist: false),
      ],
      verify: (_) {
        verify(mockRemoveWatchlistTvShow.execute(testTvShowDetail));
        verify(mockGetWatchListByIdTvShow.execute(testTvShowDetail.id));
      },
    );

    blocTest<DetailTvshowBloc, DetailTvshowState>(
      'Shoud emit watchlistMessage when Failed',
      build: () {
        when(mockRemoveWatchlistTvShow.execute(testTvShowDetail))
            .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
        when(mockGetWatchListByIdTvShow.execute(testTvShowDetail.id))
            .thenAnswer((_) async => false);
        return detailTvshowBloc;
      },
      act: (bloc) => bloc.add(RemoveFromWatchlist(testTvShowDetail)),
      expect: () => [
        detailTvshowState.copyWith(watchlistMessage: 'Failed'),
      ],
      verify: (_) {
        verify(mockRemoveWatchlistTvShow.execute(testTvShowDetail));
        verify(mockGetWatchListByIdTvShow.execute(testTvShowDetail.id));
      },
    );
  });

  group('LoadWatchlistStatus', () {
    blocTest<DetailTvshowBloc, DetailTvshowState>(
      'Should Emit AddWatchlistStatus True',
      build: () {
        when(mockGetWatchListByIdTvShow.execute(tId))
            .thenAnswer((_) async => true);
        return detailTvshowBloc;
      },
      act: (bloc) => bloc.add(const LoadWatchlistStatus(tId)),
      expect: () => [
        detailTvshowState.copyWith(isAddedToWatchlist: true),
      ],
      verify: (_) {
        verify(mockGetWatchListByIdTvShow.execute(testTvShowDetail.id));
      },
    );
  });
}
