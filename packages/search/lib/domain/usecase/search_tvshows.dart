/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:12 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:44 PM
 *
 */
import 'package:core/common/failure.dart';
import 'package:core/domain/entities/tvshow.dart';
import 'package:core/domain/repositories/tvshow_repository.dart';
import 'package:dartz/dartz.dart';

class SearchTvShows {
  final TvShowRepository repository;

  SearchTvShows(this.repository);

  Future<Either<Failure, List<TvShow>>> execute(String query) {
    return repository.searchTvShows(query);
  }
}
