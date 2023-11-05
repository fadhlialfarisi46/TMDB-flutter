/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:44 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 12:44 PM
 *
 */
import 'package:core/domain/entities/tvshow.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/usecases.dart';

part 'popular_tvshow_event.dart';
part 'popular_tvshow_state.dart';

class PopularTvshowBloc extends Bloc<PopularTvshowEvent, PopularTvShowsState> {
  final GetPopularTvShows getPopularTvShows;

  PopularTvshowBloc(this.getPopularTvShows) : super(PopularTvShowsEmpty()) {
    on<PopularTvshowEvent>((event, emit) async {
      emit(PopularTvShowsLoading());
      final result = await getPopularTvShows.execute();
      result.fold(
        (l) => emit(PopularTvShowsError(l.message)),
        (r) => emit(PopularTvShowsLoaded(r)),
      );
    });
  }
}
