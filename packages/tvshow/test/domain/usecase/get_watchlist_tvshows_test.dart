/*
 * *
 *  * Created by fadhlialfarisi on 11/5/23, 1:05 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/5/23, 9:49 AM
 *
 */
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvshow/domain/usecase/usecases.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/tvshow_test_helper.mocks.dart';

void main() {
  late GetWatchlistTvShows usecase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    usecase = GetWatchlistTvShows(mockTvShowRepository);
  });

  test('should get list of tvshows from the repository', () async {
    // arrange
    when(mockTvShowRepository.getWatchlistTvShows())
        .thenAnswer((_) async => Right(testTvshowList));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(testTvshowList));
  });
}
