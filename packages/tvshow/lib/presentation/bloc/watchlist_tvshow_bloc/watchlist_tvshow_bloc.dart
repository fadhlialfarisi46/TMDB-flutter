/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:46 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 12:46 PM
 *
 */
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/usecases.dart';

part 'watchlist_tvshow_event.dart';
part 'watchlist_tvshow_state.dart';

class WatchlistTvShowBloc
    extends Bloc<WatchlistTvShowEvent, WatchlistTvShowState> {
  final GetWatchlistTvShows getWatchlistTvShow;

  WatchlistTvShowBloc(this.getWatchlistTvShow)
      : super(const WatchlistTvShowEmpty('')) {
    on<WatchlistTvShowEvent>((event, emit) async {
      emit(WatchlistTvShowLoading());
      final result = await getWatchlistTvShow.execute();
      result.fold((l) => emit(WatchlistTvShowError(l.message)), (r) {
        emit(WatchlistTvShowHasData(r));
        if (r.isEmpty) {
          emit(const WatchlistTvShowEmpty('You haven\'t added any TvShow yet'));
        }
      });
    });
  }
}
