/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:41 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:41 PM
 *
 */

import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tvshow_repository.dart';

import '../../common/failure.dart';
import '../entities/tvshow.dart';

class GetTopRatedTvShows {
  final TvShowRepository repository;

  GetTopRatedTvShows(this.repository);

  Future<Either<Failure, List<TvShow>>> execute() {
    return repository.getTopRatedTvShows();
  }
}
