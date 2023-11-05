/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 1:11 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 1:11 PM
 *
 */

import 'package:core/domain/entities/tvshow.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/usecases.dart';

part 'top_rated_tvshow_event.dart';
part 'top_rated_tvshow_state.dart';

class TopRatedTvshowBloc
    extends Bloc<TopRatedTvshowEvent, TopRatedTvshowState> {
  final GetTopRatedTvShows getTopRatedTvShows;

  TopRatedTvshowBloc(this.getTopRatedTvShows) : super(TopRatedTvShowsEmpty()) {
    on<TopRatedTvshowEvent>((event, emit) async {
      emit(TopRatedTvShowsLoading());
      final result = await getTopRatedTvShows.execute();
      result.fold(
        (l) => emit(TopRatedTvShowsError(l.message)),
        (r) => emit(TopRatedTvShowsLoaded(r)),
      );
    });
  }
}
