/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:35 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/3/23, 9:38 PM
 *
 */

part of 'usecases.dart';

class GetDetailTvShow {
  final TvShowRepository repository;

  GetDetailTvShow(this.repository);

  Future<Either<Failure, TvShowDetail>> execute(int id) {
    return repository.getDetailTvShow(id);
  }
}
