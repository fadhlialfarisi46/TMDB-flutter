/*
 * *
 *  * Created by fadhlialfarisi on 11/5/23, 11:22 AM
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
  late GetDetailTvShow usecase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    usecase = GetDetailTvShow(mockTvShowRepository);
  });

  const tId = 1;

  test('should get tvshow detail from the repository', () async {
    // arrange
    when(mockTvShowRepository.getDetailTvShow(tId))
        .thenAnswer((_) async => Right(testTvShowDetail));
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, Right(testTvShowDetail));
  });
}
