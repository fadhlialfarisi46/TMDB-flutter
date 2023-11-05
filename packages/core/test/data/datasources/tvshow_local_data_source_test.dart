/*
 * *
 *  * Created by fadhlialfarisi on 11/2/23, 8:11 AM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/2/23, 8:11 AM
 *
 */
import 'package:core/data/datasources/tvshow_local_data_source.dart';
import 'package:core/common/exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvShowLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = TvShowLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('save watchlist TvShow', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchListTvShow(testTvShowTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.insertWatchListTvShow(testTvShowTable);
      // assert
      expect(result, 'Added to TvShow Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchListTvShow(testTvShowTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchListTvShow(testTvShowTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist TvShow', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlistTvShow(testTvShowTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeWatchlistTvShow(testTvShowTable);
      // assert
      expect(result, 'Removed from TvShow Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlistTvShow(testTvShowTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchlistTvShow(testTvShowTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Tvshow Detail By Id', () {
    final tId = 1;

    test('should return Tvshow Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getTvShowById(tId))
          .thenAnswer((_) async => testTvShowMap);
      // act
      final result = await dataSource.getTvShowById(tId);
      // assert
      expect(result, testTvShowTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getTvShowById(tId)).thenAnswer((_) async => null);
      // act
      final result = await dataSource.getTvShowById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist tvshows', () {
    test('should return list of TvShowTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistTvShows())
          .thenAnswer((_) async => [testTvShowMap]);
      // act
      final result = await dataSource.getWatchlistTvShows();
      // assert
      expect(result, [testTvShowTable]);
    });
  });
}
