/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:43 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:43 PM
 *
 */

import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tvshow_detail.dart';
import 'package:ditonton/domain/repositories/tvshow_repository.dart';

import '../../common/failure.dart';

class RemoveWatchlistTvShow {
  final TvShowRepository repository;

  RemoveWatchlistTvShow(this.repository);

  Future<Either<Failure, String>> execute(TvShowDetail tvShowDetail) {
    return repository.removeWatchlistTvShow(tvShowDetail);
  }
}
