/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:26 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:26 PM
 *
 */

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';

import '../../common/constants.dart';
import '../models/tvshow_table.dart';

abstract class TvShowLocalDataSource {
  Future<String> insertWatchListTvShow(TvShowTable tvShowTable);
  Future<String> removeWatchlistTvShow(TvShowTable tvShowTable);
  Future<TvShowTable?> getTvShowById(int id);
  Future<List<TvShowTable>> getWatchlistTvShows();
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
}
