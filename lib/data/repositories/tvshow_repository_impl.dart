/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:20 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:20 PM
 *
 */
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/data/datasources/tvshow_local_data_source.dart';
import 'package:ditonton/domain/entities/tvshow.dart';
import 'package:ditonton/domain/repositories/tvshow_repository.dart';

import '../../common/exception.dart';
import '../../common/failure.dart';
import '../../domain/entities/tvshow_detail.dart';
import '../datasources/tvshow_remote_data_source.dart';
import '../models/tvshow_table.dart';

class TvShowRepositoryImpl implements TvShowRepository {
  final TvShowRemoteDataSource remoteDataSource;
  final TvShowLocalDataSource localDataSource;

  TvShowRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
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
      throw e;
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
    try {
      final result = await remoteDataSource.getOnAirTvShows();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getPopularTvShows() async {
    try {
      final result = await remoteDataSource.getPopularTvShows();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getTopRatedTvShows() async {
    try {
      final result = await remoteDataSource.getTopRatedTvShows();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TvShowDetail>> getDetailTvShow(int id) async {
    try {
      final result = await remoteDataSource.getDetailTvShow(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getRecommendationTvShow(int id) async {
    try {
      final result = await remoteDataSource.getRecommendationTvShow(id);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<bool> isAddedToWatchlist(int id) {
    // TODO: implement isAddedToWatchlist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TvShow>>> searchTvShows(String query) async {
    try {
      final result = await remoteDataSource.searchTvShows(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
