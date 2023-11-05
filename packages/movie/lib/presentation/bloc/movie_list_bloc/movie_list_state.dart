/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 4:15 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 4:15 PM
 *
 */
part of 'movie_list_bloc.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

class MovieListEmpty extends MovieListState {}

class MovieListLoading extends MovieListState {}

class MovieListLoaded extends MovieListState {
  final List<Movie> movies;

  const MovieListLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MoviesListError extends MovieListState {
  final String message;

  const MoviesListError(this.message);

  @override
  List<Object> get props => [message];
}
