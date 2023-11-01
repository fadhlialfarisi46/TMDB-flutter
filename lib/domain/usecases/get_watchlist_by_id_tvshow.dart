/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:41 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:41 PM
 *
 */

import 'package:ditonton/domain/repositories/tvshow_repository.dart';

class GetWatchListByIdTvShow {
  final TvShowRepository repository;

  GetWatchListByIdTvShow(this.repository);

  Future<bool> execute(int id) async {
    return repository.getTvShowById(id);
  }
}
