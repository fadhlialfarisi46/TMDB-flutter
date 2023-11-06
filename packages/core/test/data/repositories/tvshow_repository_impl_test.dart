/*
 * *
 *  * Created by fadhlialfarisi on 11/2/23, 8:42 AM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/2/23, 8:42 AM
 *
 */

import 'dart:io';

import 'package:core/data/models/models.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/exception.dart';
import 'package:core/common/failure.dart';
import 'package:core/data/repositories/tvshow_repository_impl.dart';
import 'package:core/domain/entities/tvshow.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/tvshow_test_helper.mocks.dart';

void main() {
  late TvShowRepositoryImpl repository;
  late MockTvShowRemoteDataSource mockRemoteDataSource;
  late MockTvShowLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockTvShowRemoteDataSource();
    mockLocalDataSource = MockTvShowLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = TvShowRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final tTvShowModel = TvShowModel(
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: const [14, 28],
    id: 557,
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    voteAverage: 7.2,
    voteCount: 13507,
    firstAirDate: DateTime.tryParse("2023-11-03"),
    name: 'Naruto',
    originCountry: const ['en'],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
  );

  final tTvShow = TvShow(
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: const [14, 28],
    id: 557,
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    voteAverage: 7.2,
    voteCount: 13507,
    firstAirDate: DateTime.tryParse("2023-11-03"),
    name: 'Naruto',
    originCountry: const ['en'],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
  );

  final tTvShowModelList = <TvShowModel>[tTvShowModel];

  group('On Air TvShows', () {
    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getOnAirTvShows()).thenAnswer((_) async => []);
      //act
      await repository.getOnAirTvShows();
      //assert
      verify(mockNetworkInfo.isConnected);
    });

    group('when device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getOnAirTvShows())
            .thenAnswer((_) async => tTvShowModelList);
        // act
        final result = await repository.getOnAirTvShows();
        // assert
        verify(mockRemoteDataSource.getOnAirTvShows());
        final resultList = result.getOrElse(() => []);
        expect(resultList, testTvshowList);
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getOnAirTvShows())
            .thenThrow(ServerException());
        // act
        final result = await repository.getOnAirTvShows();
        // assert
        verify(mockRemoteDataSource.getOnAirTvShows());
        expect(result, equals(const Left(ServerFailure(''))));
      });

      test(
          'should return connection failure when the device is not connected to internet',
          () async {
        // arrange
        when(mockRemoteDataSource.getOnAirTvShows()).thenThrow(
            const SocketException('Failed to connect to the network'));
        // act
        final result = await repository.getOnAirTvShows();
        // assert
        verify(mockRemoteDataSource.getOnAirTvShows());
        expect(
            result,
            equals(const Left(
                ConnectionFailure('Failed to connect to the network'))));
      });

      test(
          'should cache data locally when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getOnAirTvShows())
            .thenAnswer((_) async => tTvShowModelList);
        // act
        await repository.getOnAirTvShows();
        // assert
        verify(mockRemoteDataSource.getOnAirTvShows());
        verify(mockLocalDataSource.cacheOnAirTvShows([tTvShowCache]));
      });
    });

    group('when device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return cached data when device is offline', () async {
        // arrange
        when(mockLocalDataSource.getCachedOnAirTvShows())
            .thenAnswer((_) async => [tTvShowCache]);
        //act
        final result = await repository.getOnAirTvShows();
        //assert
        verify(mockLocalDataSource.getCachedOnAirTvShows());
        final resultList = result.getOrElse(() => []);
        expect(resultList, [tTvShowFromCache]);
      });

      test('should return CacheFailure when app has no cache', () async {
        // arrange
        when(mockLocalDataSource.getCachedOnAirTvShows())
            .thenThrow(CacheException('No Cache'));
        // act
        final result = await repository.getOnAirTvShows();
        // assert
        verify(mockLocalDataSource.getCachedOnAirTvShows());
        expect(result, const Left(CacheFailure('No Cache')));
      });
    });
  });

  group('Top Rated TvShows', () {
    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getTopRatedTvShows())
          .thenAnswer((_) async => []);
      //act
      await repository.getTopRatedTvShows();
      //assert
      verify(mockNetworkInfo.isConnected);
    });

    group('when device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getTopRatedTvShows())
            .thenAnswer((_) async => tTvShowModelList);
        // act
        final result = await repository.getTopRatedTvShows();
        // assert
        verify(mockRemoteDataSource.getTopRatedTvShows());
        /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
        final resultList = result.getOrElse(() => []);
        expect(resultList, testTvshowList);
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getTopRatedTvShows())
            .thenThrow(ServerException());
        // act
        final result = await repository.getTopRatedTvShows();
        // assert
        verify(mockRemoteDataSource.getTopRatedTvShows());
        expect(result, equals(const Left(ServerFailure(''))));
      });

      test(
          'should return connection failure when the device is not connected to internet',
          () async {
        // arrange
        when(mockRemoteDataSource.getTopRatedTvShows()).thenThrow(
            const SocketException('Failed to connect to the network'));
        // act
        final result = await repository.getTopRatedTvShows();
        // assert
        verify(mockRemoteDataSource.getTopRatedTvShows());
        expect(
            result,
            equals(const Left(
                ConnectionFailure('Failed to connect to the network'))));
      });

      test(
          'should cache data locally when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getTopRatedTvShows())
            .thenAnswer((_) async => tTvShowModelList);
        // act
        await repository.getTopRatedTvShows();
        // assert
        verify(mockRemoteDataSource.getTopRatedTvShows());
        verify(mockLocalDataSource.cacheTopRatedTvShows([tTvShowCache]));
      });
    });

    group('when device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return cached data when device is offline', () async {
        // arrange
        when(mockLocalDataSource.getCachedTopRatedTvShows())
            .thenAnswer((_) async => [tTvShowCache]);
        //act
        final result = await repository.getTopRatedTvShows();
        //assert
        verify(mockLocalDataSource.getCachedTopRatedTvShows());
        final resultList = result.getOrElse(() => []);
        expect(resultList, [tTvShowFromCache]);
      });

      test('should return CacheFailure when app has no cache', () async {
        // arrange
        when(mockLocalDataSource.getCachedTopRatedTvShows())
            .thenThrow(CacheException('No Cache'));
        // act
        final result = await repository.getTopRatedTvShows();
        // assert
        verify(mockLocalDataSource.getCachedTopRatedTvShows());
        expect(result, const Left(CacheFailure('No Cache')));
      });
    });
  });

  group('Popular TvShows', () {
    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getPopularTvShows())
          .thenAnswer((_) async => []);
      //act
      await repository.getPopularTvShows();
      //assert
      verify(mockNetworkInfo.isConnected);
    });

    group('when device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getPopularTvShows())
            .thenAnswer((_) async => tTvShowModelList);
        // act
        final result = await repository.getPopularTvShows();
        // assert
        verify(mockRemoteDataSource.getPopularTvShows());
        /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
        final resultList = result.getOrElse(() => []);
        expect(resultList, testTvshowList);
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getPopularTvShows())
            .thenThrow(ServerException());
        // act
        final result = await repository.getPopularTvShows();
        // assert
        verify(mockRemoteDataSource.getPopularTvShows());
        expect(result, equals(const Left(ServerFailure(''))));
      });

      test(
          'should return connection failure when the device is not connected to internet',
          () async {
        // arrange
        when(mockRemoteDataSource.getPopularTvShows()).thenThrow(
            const SocketException('Failed to connect to the network'));
        // act
        final result = await repository.getPopularTvShows();
        // assert
        verify(mockRemoteDataSource.getPopularTvShows());
        expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the network'))),
        );
      });

      test(
          'should cache data locally when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getPopularTvShows())
            .thenAnswer((_) async => tTvShowModelList);
        // act
        await repository.getPopularTvShows();
        // assert
        verify(mockRemoteDataSource.getPopularTvShows());
        verify(mockLocalDataSource.cachePopularTvShows([tTvShowCache]));
      });
    });

    group('when device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return cached data when device is offline', () async {
        // arrange
        when(mockLocalDataSource.getCachedPopularTvShows())
            .thenAnswer((_) async => [tTvShowCache]);
        //act
        final result = await repository.getPopularTvShows();
        //assert
        verify(mockLocalDataSource.getCachedPopularTvShows());
        final resultList = result.getOrElse(() => []);
        expect(resultList, [tTvShowFromCache]);
      });

      test('should return CacheFailure when app has no cache', () async {
        // arrange
        when(mockLocalDataSource.getCachedPopularTvShows())
            .thenThrow(CacheException('No Cache'));
        // act
        final result = await repository.getPopularTvShows();
        // assert
        verify(mockLocalDataSource.getCachedPopularTvShows());
        expect(result, const Left(CacheFailure('No Cache')));
      });
    });
  });

  group('get watchlist tvshow', () {
    test('should return list of tvshow', () async {
      // arrange
      when(mockLocalDataSource.getWatchlistTvShows())
          .thenAnswer((_) async => [testTvShowTable]);
      // act
      final result = await repository.getWatchlistTvShows();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testWatchlistTvShow]);
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      const tId = 1;
      when(mockLocalDataSource.getTvShowById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await repository.isAddedToWatchlist(tId);
      // assert
      expect(result, false);
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlistTvShow(testTvShowTable))
          .thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result = await repository.removeWatchlistTvShow(testTvShowDetail);
      // assert
      expect(result, const Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlistTvShow(testTvShowTable))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result = await repository.removeWatchlistTvShow(testTvShowDetail);
      // assert
      expect(result, const Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('save watchlist', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchListTvShow(testTvShowTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await repository.insertWatchListTvShow(testTvShowDetail);
      // assert
      expect(result, const Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchListTvShow(testTvShowTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.insertWatchListTvShow(testTvShowDetail);
      // assert
      expect(result, const Left(DatabaseFailure('Failed to add watchlist')));
    });
  });
}
