/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:18 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/3/23, 9:51 PM
 *
 */

import 'package:core/common/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/widget/movie_card_list.dart';
import 'package:tvshow/presentation/widget/tvshow_card.dart';
import 'package:flutter/material.dart';

import '../bloc/search_bloc.dart';

class SearchPage extends StatelessWidget {
  final String type;

  const SearchPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                if (type == movie) {
                  context.read<SearchMoviesBloc>().add(OnQueryChanged(query));
                } else {
                  context.read<SearchTvShowsBloc>().add(OnQueryChanged(query));
                }
              },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            if (type == movie) _buildMovieBloc() else _buildTvShowBloc(),
          ],
        ),
      ),
    );
  }

  BlocBuilder<SearchTvShowsBloc, SearchState> _buildTvShowBloc() {
    return BlocBuilder<SearchTvShowsBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchHasData) {
          final result = state.searchResult;
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final tvShow = result[index];
                return TvShowCard(
                  tvShow: tvShow,
                );
              },
              itemCount: result.length,
            ),
          );
        } else if (state is SearchEmpty) {
          return Expanded(
            child: Center(
              child: Text(
                state.message,
                style: kHeading6,
              ),
            ),
          );
        } else if (state is SearchError) {
          return Expanded(
            child: Center(
              child: Text(
                state.message,
                style: kHeading6,
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  BlocBuilder<SearchMoviesBloc, SearchState> _buildMovieBloc() {
    return BlocBuilder<SearchMoviesBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchHasData) {
          final result = state.searchResult;
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final movie = result[index];
                return MovieCard(
                  movie: movie,
                );
              },
              itemCount: result.length,
            ),
          );
        } else if (state is SearchEmpty) {
          return Expanded(
            child: Center(
              child: Text(
                state.message,
                style: kHeading6,
              ),
            ),
          );
        } else if (state is SearchError) {
          return Expanded(
            child: Center(
              child: Text(
                state.message,
                style: kHeading6,
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
