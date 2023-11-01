/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:44 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:44 PM
 *
 */
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tvshow.dart';
import 'package:ditonton/domain/repositories/tvshow_repository.dart';

class SearchTvShows {
  final TvShowRepository repository;

  SearchTvShows(this.repository);

  Future<Either<Failure, List<TvShow>>> execute(String query) {
    return repository.searchTvShows(query);
  }
}
