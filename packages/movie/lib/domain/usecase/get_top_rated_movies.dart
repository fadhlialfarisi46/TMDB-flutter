/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 4:12 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 8:04 PM
 *
 */

import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/repositories/movie_repository.dart';

class GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getTopRatedMovies();
  }
}
