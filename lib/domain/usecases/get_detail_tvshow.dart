/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:38 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:38 PM
 *
 */
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tvshow_detail.dart';
import 'package:ditonton/domain/repositories/tvshow_repository.dart';

import '../../common/failure.dart';

class GetDetailTvShow {
  final TvShowRepository repository;

  GetDetailTvShow(this.repository);

  Future<Either<Failure, TvShowDetail>> execute(int id) {
    return repository.getDetailTvShow(id);
  }
}
