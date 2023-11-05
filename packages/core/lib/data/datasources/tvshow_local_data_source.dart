/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:26 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:26 PM
 *
 */

import '../../common/constants.dart';
import '../../common/exception.dart';
import '../models/models.dart';
import 'db/database_helper.dart';

abstract class TvShowLocalDataSource {
  Future<String> insertWatchListTvShow(TvShowTable tvShowTable);
  Future<String> removeWatchlistTvShow(TvShowTable tvShowTable);
  Future<TvShowTable?> getTvShowById(int id);
  Future<List<TvShowTable>> getWatchlistTvShows();
  Future<void> cacheOnAirTvShows(List<TvShowTable> tvShows);
  Future<List<TvShowTable>> getCachedOnAirTvShows();
  Future<void> cachePopularTvShows(List<TvShowTable> tvShows);
  Future<List<TvShowTable>> getCachedPopularTvShows();
  Future<void> cacheTopRatedTvShows(List<TvShowTable> tvShows);
  Future<List<TvShowTable>> getCachedTopRatedTvShows();
}

class TvShowLocalDataSourceImpl implements TvShowLocalDataSource {
  final DatabaseHelper databaseHelper;

  TvShowLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<TvShowTable?> getTvShowById(int id) async {
    final result = await databaseHelper.getTvShowById(id);
    if (result != null) {
      return TvShowTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TvShowTable>> getWatchlistTvShows() async {
    final result = await databaseHelper.getWatchlistTvShows();
    return result.map((data) => TvShowTable.fromMap(data)).toList();
  }

  @override
  Future<String> insertWatchListTvShow(TvShowTable tvShowTable) async {
    try {
      await databaseHelper.insertWatchListTvShow(tvShowTable);
      return watchlistAddTvShowSuccessMessage;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlistTvShow(TvShowTable tvShowTable) async {
    try {
      await databaseHelper.removeWatchlistTvShow(tvShowTable);
      return watchlistRemoveTvShowSuccessMessage;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<void> cacheOnAirTvShows(List<TvShowTable> tvShows) async {
    await databaseHelper.clearCacheTvShows('on air');
    await databaseHelper.insertCacheTransactionTvShows(tvShows, 'on air');
  }

  @override
  Future<void> cachePopularTvShows(List<TvShowTable> tvShows) async {
    await databaseHelper.clearCacheTvShows('popular');
    await databaseHelper.insertCacheTransactionTvShows(tvShows, 'popular');
  }

  @override
  Future<void> cacheTopRatedTvShows(List<TvShowTable> tvShows) async {
    await databaseHelper.clearCacheTvShows('top rated');
    await databaseHelper.insertCacheTransactionTvShows(tvShows, 'top rated');
  }

  @override
  Future<List<TvShowTable>> getCachedOnAirTvShows() async {
    final result = await databaseHelper.getCacheTvShows('on air');
    if (result.isNotEmpty) {
      return result.map((data) => TvShowTable.fromMap(data)).toList();
    } else {
      throw CacheException("Can't get the data ");
    }
  }

  @override
  Future<List<TvShowTable>> getCachedPopularTvShows() async {
    final result = await databaseHelper.getCacheTvShows('popular');
    if (result.isNotEmpty) {
      return result.map((data) => TvShowTable.fromMap(data)).toList();
    } else {
      throw CacheException("Can't get the data ");
    }
  }

  @override
  Future<List<TvShowTable>> getCachedTopRatedTvShows() async {
    final result = await databaseHelper.getCacheTvShows('top rated');
    if (result.isNotEmpty) {
      return result.map((data) => TvShowTable.fromMap(data)).toList();
    } else {
      throw CacheException("Can't get the data ");
    }
  }
}
