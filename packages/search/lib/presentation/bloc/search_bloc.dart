/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:13 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 12:13 PM
 *
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/usecase/search_movies.dart';
import '../../domain/usecase/search_tvshows.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchMoviesBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovies _searchMovies;

  SearchMoviesBloc(this._searchMovies) : super(const SearchEmpty('')) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;
      emit(SearchLoading());
      final result = await _searchMovies.execute(query);
      result.fold((l) => emit(SearchError(l.message)), (r) {
        emit(SearchHasData(r));
        if (r.isEmpty) {
          emit(const SearchEmpty('No results found with that keyword'));
        }
      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}

class SearchTvShowsBloc extends Bloc<SearchEvent, SearchState> {
  final SearchTvShows _searchTvShows;

  SearchTvShowsBloc(this._searchTvShows) : super(const SearchEmpty('')) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;
      emit(SearchLoading());
      final result = await _searchTvShows.execute(query);
      result.fold((l) => emit(SearchError(l.message)), (r) {
        emit(SearchHasData(r));
        if (r.isEmpty) {
          emit(const SearchEmpty('No results found with that keyword'));
        }
      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}

EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
