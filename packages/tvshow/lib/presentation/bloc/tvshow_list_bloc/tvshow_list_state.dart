/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:46 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 12:46 PM
 *
 */
part of 'tvshow_list_bloc.dart';

abstract class TvshowListState extends Equatable {
  const TvshowListState();

  @override
  List<Object> get props => [];
}

class TvshowListEmpty extends TvshowListState {}

class TvshowListLoading extends TvshowListState {}

class TvshowListLoaded extends TvshowListState {
  final List<TvShow> tvShows;

  const TvshowListLoaded(this.tvShows);

  @override
  List<Object> get props => [tvShows];
}

class TvshowListError extends TvshowListState {
  final String message;

  const TvshowListError(this.message);

  @override
  List<Object> get props => [message];
}
