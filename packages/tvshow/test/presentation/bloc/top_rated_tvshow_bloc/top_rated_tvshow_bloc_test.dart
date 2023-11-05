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
import 'package:mockito/mockito.dart';
import 'package:tvshow/presentation/bloc/top_rated_tvshow_bloc/top_rated_tvshow_bloc.dart';

import '../tvshow_list_bloc/tvshow_list_bloc_test.mocks.dart';

void main() {
  late MockGetTopRatedTvShows mockGetTopRatedTvShows;
  late TopRatedTvshowBloc topRatedTvshowBloc;

  setUp(() {
    mockGetTopRatedTvShows = MockGetTopRatedTvShows();
    topRatedTvshowBloc = TopRatedTvshowBloc(mockGetTopRatedTvShows);
  });

  final tTvShow = TvShow(
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
    firstAirDate: DateTime.parse('2022-14-08'),
    originalLanguage: 'en',
    name: 'name',
    originCountry: const ['en'],
    originalName: 'originalName',
  );

  final tTvShowList = <TvShow>[tTvShow];

  group('TopRated Tv Shows', () {
    test('Initial state should be empty', () {
      expect(topRatedTvshowBloc.state, TopRatedTvShowsEmpty());
    });

    blocTest<TopRatedTvshowBloc, TopRatedTvshowState>(
      'Should emit [TopRatedTvShowsLoading, TopRatedTvshowLoaded] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedTvShows.execute())
            .thenAnswer((_) async => Right(tTvShowList));
        return topRatedTvshowBloc;
      },
      act: (bloc) => bloc.add(TopRatedTvshowEvent()),
      expect: () => [
        TopRatedTvShowsLoading(),
        TopRatedTvShowsLoaded(tTvShowList),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedTvShows.execute());
      },
    );

    blocTest<TopRatedTvshowBloc, TopRatedTvshowState>(
      'Should emit [TopRatedTvShowsLoading, TopRatedTvShowsError] when get Failure',
      build: () {
        when(mockGetTopRatedTvShows.execute())
            .thenAnswer((_) async => const Left(ServerFailure('Failed')));
        return topRatedTvshowBloc;
      },
      act: (bloc) => bloc.add(TopRatedTvshowEvent()),
      expect: () => [
        TopRatedTvShowsLoading(),
        const TopRatedTvShowsError('Failed'),
      ],
      verify: (_) {
        verify(mockGetTopRatedTvShows.execute());
      },
    );
  });
}
