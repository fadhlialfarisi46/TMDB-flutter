/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:36 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/3/23, 9:38 PM
 *
 */

part of 'usecases.dart';

class GetWatchlistTvShows {
  final TvShowRepository _repository;

  GetWatchlistTvShows(this._repository);

  Future<Either<Failure, List<TvShow>>> execute() {
    return _repository.getWatchlistTvShows();
  }
}
