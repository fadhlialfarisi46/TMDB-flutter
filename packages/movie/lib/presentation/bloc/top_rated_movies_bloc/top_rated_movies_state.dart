/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 4:18 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 4:18 PM
 *
 */
part of 'top_rated_movies_bloc.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object?> get props => [];
}

class TopRatedMoviesEmpty extends TopRatedMoviesState {}

class TopRatedMoviesLoading extends TopRatedMoviesState {}

class TopRatedMoviesLoaded extends TopRatedMoviesState {
  final List<Movie> movies;

  const TopRatedMoviesLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class TopRatedMoviesError extends TopRatedMoviesState {
  final String message;

  const TopRatedMoviesError(this.message);

  @override
  List<Object?> get props => [message];
}
