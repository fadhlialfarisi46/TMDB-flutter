/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:38 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 12:38 PM
 *
 */

import 'package:core/common/state_enum.dart';
import 'package:core/domain/entities/tvshow.dart';
import 'package:core/domain/entities/tvshow_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/usecases.dart';

part 'detail_tvshow_event.dart';

part 'detail_tvshow_state.dart';

class DetailTvshowBloc extends Bloc<DetailTvshowEvent, DetailTvshowState> {
  final GetDetailTvShow getDetailTvShow;
  final GetRecommendationTvShows getRecommendationTvShow;
  final GetWatchListByIdTvShow getWatchListByIdTvShow;
  final InsertWatchlistTvShow insertWatchlistTvShow;
  final RemoveWatchlistTvShow removeWatchlistTvShow;

  DetailTvshowBloc({
    required this.getDetailTvShow,
    required this.getRecommendationTvShow,
    required this.getWatchListByIdTvShow,
    required this.insertWatchlistTvShow,
    required this.removeWatchlistTvShow,
  }) : super(DetailTvshowState.initial()) {
    on<FetchDetailTvShow>((event, emit) async {
      emit(state.copyWith(tvShowDetailState: RequestState.loading));

      final detailResult = await getDetailTvShow.execute(event.id);
      final recommendationResult =
          await getRecommendationTvShow.execute(event.id);

      detailResult.fold(
        (l) => emit(state.copyWith(
          tvShowDetailState: RequestState.error,
          message: l.message,
        )),
        (tvshow) => {
          emit(state.copyWith(
            tvShowRecommendationsState: RequestState.loading,
            tvShowDetail: tvshow,
            tvShowDetailState: RequestState.loaded,
          )),
          recommendationResult.fold(
              (l) => emit(
                    state.copyWith(
                      tvShowRecommendationsState: RequestState.error,
                      message: l.message,
                    ),
                  ),
              (r) => emit(state.copyWith(
                    tvShowRecommendationsState: RequestState.loaded,
                    tvShowRecommendations: r,
                  ))),
        },
      );
    });
    on<AddToWatchlist>((event, emit) async {
      final result = await insertWatchlistTvShow.execute(event.tvShowDetail);

      result.fold((failure) {
        emit(state.copyWith(watchlistMessage: failure.message));
      }, (successMessage) {
        emit(state.copyWith(watchlistMessage: successMessage));
      });

      add(LoadWatchlistStatus(event.tvShowDetail.id));
    });
    on<RemoveFromWatchlist>((event, emit) async {
      final result = await removeWatchlistTvShow.execute(event.tvShowDetail);

      result.fold((failure) {
        emit(state.copyWith(watchlistMessage: failure.message));
      }, (successMessage) {
        emit(state.copyWith(watchlistMessage: successMessage));
      });

      add(LoadWatchlistStatus(event.tvShowDetail.id));
    });
    on<LoadWatchlistStatus>((event, emit) async {
      final result = await getWatchListByIdTvShow.execute(event.id);
      emit(state.copyWith(isAddedToWatchlist: result));
    });
  }
}
