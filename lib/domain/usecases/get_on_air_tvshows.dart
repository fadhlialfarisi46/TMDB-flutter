/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:39 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:39 PM
 *
 */
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tvshow.dart';
import 'package:ditonton/domain/repositories/tvshow_repository.dart';

import '../../common/failure.dart';

class GetOnAirTvShows {
  final TvShowRepository repository;

  GetOnAirTvShows(this.repository);

  Future<Either<Failure, List<TvShow>>> execute() {
    return repository.getOnAirTvShows();
  }
}
