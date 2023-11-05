/*
 * *
 *  * Created by fadhlialfarisi on 11/5/23, 11:23 AM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/5/23, 9:49 AM
 *
 */
import 'package:core/domain/entities/tvshow.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvshow/domain/usecase/usecases.dart';

import '../../helpers/tvshow_test_helper.mocks.dart';

void main() {
  late GetOnAirTvShows usecase;
  late MockTvShowRepository mockTvShowRpository;

  setUp(() {
    mockTvShowRpository = MockTvShowRepository();
    usecase = GetOnAirTvShows(mockTvShowRpository);
  });

  final tTvshow = <TvShow>[];

  group('GetOnAirTvShows Tests', () {
    group('execute', () {
      test(
          'should get list of tvshows from the repository when execute function is called',
          () async {
        // arrange
        when(mockTvShowRpository.getOnAirTvShows())
            .thenAnswer((_) async => Right(tTvshow));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tTvshow));
      });
    });
  });
}
