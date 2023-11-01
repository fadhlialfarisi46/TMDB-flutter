/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:49 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:49 PM
 *
 */
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tvshow.dart';
import 'package:flutter/foundation.dart';

import '../../domain/usecases/get_watchlist_tvshows.dart';

class WatchlistTvShowNotifier extends ChangeNotifier {
  var _watchlistTvShows = <TvShow>[];

  List<TvShow> get watchlistTvShows => _watchlistTvShows;

  var _watchlistState = RequestState.Empty;

  RequestState get watchlistState => _watchlistState;

  String _message = '';

  String get message => _message;

  WatchlistTvShowNotifier({required this.getWatchlistTvShows});

  final GetWatchlistTvShows getWatchlistTvShows;

  Future<void> fetchwatchlistTvShows() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTvShows.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvShowsData) {
        if (tvShowsData.isEmpty) {
          _watchlistState = RequestState.Empty;
          _message = 'You don\'t have TvShow watchlist';
          notifyListeners();
          return;
        }

        _watchlistState = RequestState.Loaded;
        _watchlistTvShows = tvShowsData;
        notifyListeners();
      },
    );
  }
}
