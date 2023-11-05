/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 1:11 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 1:11 PM
 *
 */

part of 'top_rated_tvshow_bloc.dart';

abstract class TopRatedTvshowState extends Equatable {
  const TopRatedTvshowState();

  @override
  List<Object?> get props => [];
}

class TopRatedTvShowsEmpty extends TopRatedTvshowState {}

class TopRatedTvShowsLoading extends TopRatedTvshowState {}

class TopRatedTvShowsLoaded extends TopRatedTvshowState {
  final List<TvShow> tvShows;

  const TopRatedTvShowsLoaded(this.tvShows);

  @override
  List<Object?> get props => [tvShows];
}

class TopRatedTvShowsError extends TopRatedTvshowState {
  final String message;

  const TopRatedTvShowsError(this.message);

  @override
  List<Object?> get props => [message];
}
