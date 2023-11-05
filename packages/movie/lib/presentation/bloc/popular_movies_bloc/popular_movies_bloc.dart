/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 4:17 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 4:17 PM
 *
 */
import 'package:core/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/get_popular_movies.dart';

part 'popular_movies_event.dart';

part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc(this.getPopularMovies) : super(PopularMoviesEmpty()) {
    on<PopularMoviesEvent>((event, emit) async {
      emit(PopularMoviesLoading());
      final result = await getPopularMovies.execute();
      result.fold(
        (l) => emit(PopularMoviesError(l.message)),
        (r) => emit(PopularMoviesLoaded(r)),
      );
    });
  }
}
