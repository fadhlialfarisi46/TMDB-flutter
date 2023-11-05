/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:13 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 12:13 PM
 *
 */
part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchEmpty extends SearchState {
  final String message;

  const SearchEmpty(this.message);

  @override
  List<Object> get props => [message];
}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchHasData<T> extends SearchState {
  final List<T> searchResult;

  const SearchHasData(this.searchResult);

  @override
  List<Object> get props => [searchResult];
}
