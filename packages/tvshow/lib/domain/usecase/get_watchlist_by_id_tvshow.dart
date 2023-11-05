/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:36 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:42 PM
 *
 */

part of 'usecases.dart';

class GetWatchListByIdTvShow {
  final TvShowRepository repository;

  GetWatchListByIdTvShow(this.repository);

  Future<bool> execute(int id) async {
    return repository.getTvShowById(id);
  }
}
