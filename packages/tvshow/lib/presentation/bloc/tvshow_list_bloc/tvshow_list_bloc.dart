/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:46 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 12:46 PM
 *
 */
import 'package:core/domain/entities/tvshow.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/usecases.dart';

part 'tvshow_list_event.dart';
part 'tvshow_list_state.dart';

class OnAirTvshowListBloc extends Bloc<TvshowEvent, TvshowListState> {
  final GetOnAirTvShows getOnAirTvShow;

  OnAirTvshowListBloc(this.getOnAirTvShow) : super(TvshowListEmpty()) {
    on<TvshowEvent>((event, emit) async {
      emit(TvshowListLoading());
      final result = await getOnAirTvShow.execute();
      result.fold((l) => emit(TvshowListError(l.message)),
          (r) => emit(TvshowListLoaded(r)));
    });
  }
}

class PopularTvshowListBloc extends Bloc<TvshowEvent, TvshowListState> {
  final GetPopularTvShows getPopularTvShows;

  PopularTvshowListBloc(this.getPopularTvShows) : super(TvshowListEmpty()) {
    on<TvshowEvent>((event, emit) async {
      emit(TvshowListLoading());
      final result = await getPopularTvShows.execute();
      result.fold((l) => emit(TvshowListError(l.message)),
          (r) => emit(TvshowListLoaded(r)));
    });
  }
}

class TopRatedTvshowListBloc extends Bloc<TvshowEvent, TvshowListState> {
  final GetTopRatedTvShows getTopRatedTvShows;

  TopRatedTvshowListBloc(this.getTopRatedTvShows) : super(TvshowListEmpty()) {
    on<TvshowEvent>((event, emit) async {
      emit(TvshowListLoading());
      final result = await getTopRatedTvShows.execute();
      result.fold((l) => emit(TvshowListError(l.message)),
          (r) => emit(TvshowListLoaded(r)));
    });
  }
}
