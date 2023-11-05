/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 4:12 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 8:04 PM
 *
 */

import 'package:core/domain/repositories/movie_repository.dart';

class GetWatchListStatus {
  final MovieRepository repository;

  GetWatchListStatus(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlist(id);
  }
}
