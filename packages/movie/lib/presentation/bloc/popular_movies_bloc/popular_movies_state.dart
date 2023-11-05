/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 4:17 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 4:17 PM
 *
 */
part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object?> get props => [];
}

class PopularMoviesEmpty extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> movies;

  const PopularMoviesLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class PopularMoviesError extends PopularMoviesState {
  final String message;

  const PopularMoviesError(this.message);

  @override
  List<Object?> get props => [message];
}
