/*
 * *
 *  * Created by fadhlialfarisi on 11/5/23, 1:08 PM
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
  late RemoveWatchlistTvShow usecase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    usecase = RemoveWatchlistTvShow(mockTvShowRepository);
  });

  test('should remove watchlist TvShow from repository', () async {
    // arrange
    when(mockTvShowRepository.removeWatchlistTvShow(testTvShowDetail))
        .thenAnswer((_) async => const Right('Removed from watchlist'));
    // act
    final result = await usecase.execute(testTvShowDetail);
    // assert
    verify(mockTvShowRepository.removeWatchlistTvShow(testTvShowDetail));
    expect(result, const Right('Removed from watchlist'));
  });
}
