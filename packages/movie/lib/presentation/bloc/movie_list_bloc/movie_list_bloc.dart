/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 4:15 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 4:15 PM
 *
 */
import 'package:core/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/usecase/get_now_playing_movies.dart';
import 'package:movie/domain/usecase/get_popular_movies.dart';
import 'package:movie/domain/usecase/get_top_rated_movies.dart';

part 'movie_list_event.dart';

part 'movie_list_state.dart';

class NowPlayingMovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final GetNowPlayingMovies getNowPlayingMovies;

  NowPlayingMovieListBloc(this.getNowPlayingMovies) : super(MovieListEmpty()) {
    on<MovieListEvent>((event, emit) async {
      emit(MovieListLoading());
      final result = await getNowPlayingMovies.execute();
      result.fold(
        (l) => emit(MoviesListError(l.message)),
        (r) => emit(MovieListLoaded(r)),
      );
    });
  }
}

class PopularMovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final GetPopularMovies getPopularMovies;

  PopularMovieListBloc(this.getPopularMovies) : super(MovieListEmpty()) {
    on<MovieListEvent>((event, emit) async {
      emit(MovieListLoading());
      final result = await getPopularMovies.execute();
      result.fold(
        (l) => emit(MoviesListError(l.message)),
        (r) => emit(MovieListLoaded(r)),
      );
    });
  }
}

class TopRatedMovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final GetTopRatedMovies getTopRatedMovies;

  TopRatedMovieListBloc(this.getTopRatedMovies) : super(MovieListEmpty()) {
    on<MovieListEvent>((event, emit) async {
      emit(MovieListLoading());
      final result = await getTopRatedMovies.execute();
      result.fold(
        (l) => emit(MoviesListError(l.message)),
        (r) => emit(MovieListLoaded(r)),
      );
    });
  }
}
