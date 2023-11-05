/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:13 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 12:13 PM
 *
 */

part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class OnQueryChanged extends SearchEvent {
  final String query;

  const OnQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}
