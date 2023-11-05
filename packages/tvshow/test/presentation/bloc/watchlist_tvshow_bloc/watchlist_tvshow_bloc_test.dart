/*
 * *
 *  * Created by fadhlialfarisi on 11/5/23, 10:15 AM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/5/23, 10:15 AM
 *
 */
import 'package:bloc_test/bloc_test.dart';
import 'package:core/common/failure.dart';
import 'package:core/domain/entities/tvshow.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvshow/tvshow.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'watchlist_tvshow_bloc_test.mocks.dart';

@GenerateMocks([GetWatchlistTvShows])
void main() {
  late WatchlistTvShowBloc watchlistTvshowsBloc;
  late MockGetWatchlistTvShows mockGetWatchlistTvShows;

  setUp(() {
    mockGetWatchlistTvShows = MockGetWatchlistTvShows();
    watchlistTvshowsBloc = WatchlistTvShowBloc(mockGetWatchlistTvShows);
  });

  group('Watchlist Tv Shows', () {
    test('Initial state should be empty', () {
      expect(watchlistTvshowsBloc.state, const WatchlistTvShowEmpty(''));
    });

    blocTest<WatchlistTvShowBloc, WatchlistTvShowState>(
      'Should emit [WatchlistTvShowLoading, WatchlistTvShowHasData] when data is gotten successfully',
      build: () {
        when(mockGetWatchlistTvShows.execute())
            .thenAnswer((_) async => Right([testWatchlistTvShow]));
        return watchlistTvshowsBloc;
      },
      act: (bloc) => bloc.add(WatchlistTvShowEvent()),
      expect: () => [
        WatchlistTvShowLoading(),
        WatchlistTvShowHasData([testWatchlistTvShow]),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistTvShows.execute());
      },
    );

    blocTest<WatchlistTvShowBloc, WatchlistTvShowState>(
      'Should emit [WatchlistTvShowLoading, WatchlistTvShowHasData[], WatchlistTvShowEmpty] when data is empty',
      build: () {
        when(mockGetWatchlistTvShows.execute())
            .thenAnswer((_) async => const Right(<TvShow>[]));
        return watchlistTvshowsBloc;
      },
      act: (bloc) => bloc.add(WatchlistTvShowEvent()),
      expect: () => [
        WatchlistTvShowLoading(),
        const WatchlistTvShowHasData(<TvShow>[]),
        const WatchlistTvShowEmpty('You haven\'t added any TvShow yet'),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistTvShows.execute());
      },
    );

    blocTest<WatchlistTvShowBloc, WatchlistTvShowState>(
      'Should emit [WatchlistTvShowLoading, WatchlistError] when data is unsuccessful',
      build: () {
        when(mockGetWatchlistTvShows.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return watchlistTvshowsBloc;
      },
      act: (bloc) => bloc.add(WatchlistTvShowEvent()),
      expect: () => [
        WatchlistTvShowLoading(),
        const WatchlistTvShowError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistTvShows.execute());
      },
    );
  });
}
