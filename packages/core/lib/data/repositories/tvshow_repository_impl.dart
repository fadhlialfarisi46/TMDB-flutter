/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:20 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:20 PM
 *
 */
import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../common/exception.dart';
import '../../common/failure.dart';
import '../../common/network_info.dart';
import '../../domain/entities/tvshow.dart';
import '../../domain/entities/tvshow_detail.dart';
import '../../domain/repositories/tvshow_repository.dart';
import '../datasources/tvshow_local_data_source.dart';
import '../datasources/tvshow_remote_data_source.dart';
import '../models/models.dart';

class TvShowRepositoryImpl implements TvShowRepository {
  final TvShowRemoteDataSource remoteDataSource;
  final TvShowLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TvShowRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, String>> insertWatchListTvShow(
      TvShowDetail tvShowDetail) async {
    try {
      final result = await localDataSource
          .insertWatchListTvShow(TvShowTable.fromEntity(tvShowDetail));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> removeWatchlistTvShow(
      TvShowDetail tvShowDetail) async {
    try {
      final result = await localDataSource
          .removeWatchlistTvShow(TvShowTable.fromEntity(tvShowDetail));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<bool> getTvShowById(int id) async {
    final result = await localDataSource.getTvShowById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, List<TvShow>>> getWatchlistTvShows() async {
    final result = await localDataSource.getWatchlistTvShows();
    return Right(result.map((data) => data.toEntity()).toList());
  }

  @override
  Future<Either<Failure, List<TvShow>>> getOnAirTvShows() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getOnAirTvShows();
        localDataSource.cacheOnAirTvShows(
            result.map((e) => TvShowTable.fromDTO(e)).toList());
        return Right(result.map((model) => model.toEntity()).toList());
      } on ServerException {
        return const Left(ServerFailure(''));
      } on SocketException {
        return const Left(
            ConnectionFailure('Failed to connect to the network'));
      } on TlsException catch (e) {
        return Left(CommonFailure('Certificated Not Valid:\n${e.message}'));
      }
    } else {
      try {
        final result = await localDataSource.getCachedOnAirTvShows();
        return Right(result.map((e) => e.toEntity()).toList());
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getPopularTvShows() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getPopularTvShows();
        localDataSource.cachePopularTvShows(
            result.map((e) => TvShowTable.fromDTO(e)).toList());
        return Right(result.map((model) => model.toEntity()).toList());
      } on ServerException {
        return const Left(ServerFailure(''));
      } on SocketException {
        return const Left(
            ConnectionFailure('Failed to connect to the network'));
      } on TlsException catch (e) {
        return Left(CommonFailure('Certificated Not Valid:\n${e.message}'));
      }
    } else {
      try {
        final result = await localDataSource.getCachedPopularTvShows();
        return Right(result.map((e) => e.toEntity()).toList());
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getTopRatedTvShows() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getTopRatedTvShows();
        localDataSource.cacheTopRatedTvShows(
            result.map((e) => TvShowTable.fromDTO(e)).toList());
        return Right(result.map((model) => model.toEntity()).toList());
      } on ServerException {
        return const Left(ServerFailure(''));
      } on SocketException {
        return const Left(
            ConnectionFailure('Failed to connect to the network'));
      } on TlsException catch (e) {
        return Left(CommonFailure('Certificated Not Valid:\n${e.message}'));
      }
    } else {
      try {
        final result = await localDataSource.getCachedTopRatedTvShows();
        return Right(result.map((e) => e.toEntity()).toList());
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, TvShowDetail>> getDetailTvShow(int id) async {
    try {
      final result = await remoteDataSource.getDetailTvShow(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated Not Valid:\n${e.message}'));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getRecommendationTvShow(int id) async {
    try {
      final result = await remoteDataSource.getRecommendationTvShow(id);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated Not Valid:\n${e.message}'));
    }
  }

  @override
  Future<bool> isAddedToWatchlist(int id) async {
    final result = await localDataSource.getTvShowById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, List<TvShow>>> searchTvShows(String query) async {
    try {
      final result = await remoteDataSource.searchTvShows(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated Not Valid:\n${e.message}'));
    }
  }
}
