/*
 * *
 *  * Created by fadhlialfarisi on 11/2/23, 8:21 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/2/23, 8:21 PM
 *
 */
import 'package:core/domain/entities/tvshow.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvshow/domain/usecase/usecases.dart';

import '../../helpers/tvshow_test_helper.mocks.dart';

void main() {
  late GetRecommendationTvShows usecase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    usecase = GetRecommendationTvShows(mockTvShowRepository);
  });

  const tId = 1;
  final tTvShow = <TvShow>[];

  test('should get list of tvshow recommendations from the repository',
      () async {
    // arrange
    when(mockTvShowRepository.getRecommendationTvShow(tId))
        .thenAnswer((_) async => Right(tTvShow));
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, Right(tTvShow));
  });
}
