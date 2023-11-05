/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:42 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 12:42 PM
 *
 */

import 'package:core/domain/entities/tvshow.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/usecases.dart';

part 'onair_tvshow_event.dart';

part 'onair_tvshow_state.dart';

class OnairTvshowBloc extends Bloc<OnairTvshowEvent, OnairTvshowState> {
  final GetOnAirTvShows getOnAirTvShows;

  OnairTvshowBloc(this.getOnAirTvShows) : super(OnairTvshowEmpty()) {
    on<OnairTvshowEvent>((event, emit) async {
      emit(OnairTvshowLoading());
      final result = await getOnAirTvShows.execute();
      result.fold(
        (l) => emit(OnairTvshowError(l.message)),
        (r) => emit(OnairTvshowLoaded(r)),
      );
    });
  }
}
