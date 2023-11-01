/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:57 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:57 PM
 *
 */
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tvshow.dart';
import 'package:ditonton/domain/usecases/search_tvshows.dart';
import 'package:flutter/foundation.dart';

class TvShowSearchNotifier extends ChangeNotifier {
  final SearchTvShows searchTvShows;

  TvShowSearchNotifier({required this.searchTvShows});

  RequestState _state = RequestState.Empty;

  RequestState get state => _state;

  List<TvShow> _searchTvShowsResult = [];

  List<TvShow> get searchTvShowsResult => _searchTvShowsResult;

  String _message = '';

  String get message => _message;

  Future<void> fetchTvShowSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    if (query.isEmpty) {
      _state = RequestState.Empty;
      _message = 'Try input some keyword';
      notifyListeners();
    } else {
      final result = await searchTvShows.execute(query);
      result.fold(
        (failure) {
          _message = failure.message;
          _state = RequestState.Error;
          notifyListeners();
        },
        (data) {
          if (data.isEmpty) {
            _message = 'Go find another keyword';
            _state = RequestState.Empty;
          } else {
            _searchTvShowsResult = data;
            _state = RequestState.Loaded;
          }
          notifyListeners();
        },
      );
    }
  }
}
