/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:38 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 12:38 PM
 *
 */

part of 'detail_tvshow_bloc.dart';

abstract class DetailTvshowEvent extends Equatable {
  const DetailTvshowEvent();

  @override
  List<Object> get props => [];
}

class FetchDetailTvShow extends DetailTvshowEvent {
  final int id;

  const FetchDetailTvShow(this.id);

  @override
  List<Object> get props => [id];
}

class AddToWatchlist extends DetailTvshowEvent {
  final TvShowDetail tvShowDetail;

  const AddToWatchlist(this.tvShowDetail);

  @override
  List<Object> get props => [tvShowDetail];
}

class RemoveFromWatchlist extends DetailTvshowEvent {
  final TvShowDetail tvShowDetail;

  const RemoveFromWatchlist(this.tvShowDetail);

  @override
  List<Object> get props => [tvShowDetail];
}

class LoadWatchlistStatus extends DetailTvshowEvent {
  final int id;

  const LoadWatchlistStatus(this.id);

  @override
  List<Object> get props => [id];
}
