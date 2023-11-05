/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 4:10 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 8:04 PM
 *
 */

import 'package:core/common/failure.dart';
import 'package:core/domain/entities/movie_detail.dart';
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, MovieDetail>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}
