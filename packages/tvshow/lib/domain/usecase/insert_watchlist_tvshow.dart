/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:37 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:43 PM
 *
 */

part of 'usecases.dart';

class InsertWatchlistTvShow {
  final TvShowRepository repository;

  InsertWatchlistTvShow(this.repository);

  Future<Either<Failure, String>> execute(TvShowDetail tvShowDetail) {
    return repository.insertWatchListTvShow(tvShowDetail);
  }
}
