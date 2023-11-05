/*
 * *
 *  * Created by fadhlialfarisi on 11/2/23, 8:24 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/2/23, 8:24 PM
 *
 */
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvshow/domain/usecase/usecases.dart';

import '../../helpers/tvshow_test_helper.mocks.dart';

void main() {
  late GetWatchListByIdTvShow usecase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    usecase = GetWatchListByIdTvShow(mockTvShowRepository);
  });

  test('should get watchlist status from repository', () async {
    // arrange
    when(mockTvShowRepository.getTvShowById(1)).thenAnswer((_) async => true);
    // act
    final result = await usecase.execute(1);
    // assert
    expect(result, true);
  });
}
