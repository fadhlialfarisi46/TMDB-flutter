/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:48 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 12:48 PM
 *
 */
part of 'watchlist_tvshow_bloc.dart';

abstract class WatchlistTvShowState extends Equatable {
  const WatchlistTvShowState();

  @override
  List<Object> get props => [];
}

class WatchlistTvShowEmpty extends WatchlistTvShowState {
  final String message;

  const WatchlistTvShowEmpty(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistTvShowLoading extends WatchlistTvShowState {}

class WatchlistTvShowError extends WatchlistTvShowState {
  final String message;

  const WatchlistTvShowError(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistTvShowHasData<T> extends WatchlistTvShowState {
  final List<T> watchlistResult;

  const WatchlistTvShowHasData(this.watchlistResult);

  @override
  List<Object> get props => [watchlistResult];
}
