/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:55 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:55 PM
 *
 */
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/movie_search_notifier.dart';
import 'package:ditonton/presentation/provider/tvshow_search_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:ditonton/presentation/widgets/tvshow_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/search';
  final String type;

  SearchPage({required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                if (type == movie) {
                  Provider.of<MovieSearchNotifier>(context, listen: false)
                      .fetchMovieSearch(query);
                } else {
                  Provider.of<TvShowSearchNotifier>(context, listen: false)
                      .fetchTvShowSearch(query);
                }
              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            if (type == movie)
              _buildMovieConsumer()
            else
              _buildTvShowConsumer(),
          ],
        ),
      ),
    );
  }

  Consumer<MovieSearchNotifier> _buildMovieConsumer() {
    return Consumer<MovieSearchNotifier>(
      builder: (context, data, child) {
        if (data.state == RequestState.Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (data.state == RequestState.Loaded) {
          final resultMovie = data.searchResult;
          return Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final movie = resultMovie[index];
                return MovieCard(movie);
              },
              itemCount: resultMovie.length,
            ),
          );
        }
        if (data.state == RequestState.Empty ||
            data.state == RequestState.Error) {
          return Expanded(
            child: Center(
              child: Text(
                data.message,
                style: kHeading6,
              ),
            ),
          );
        }

        return Expanded(child: Container());
      },
    );
  }

  Consumer<TvShowSearchNotifier> _buildTvShowConsumer() {
    return Consumer<TvShowSearchNotifier>(
      builder: (context, data, child) {
        if (data.state == RequestState.Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (data.state == RequestState.Loaded) {
          final resultTvShow = data.searchTvShowsResult;
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final tvShow = resultTvShow[index];
                return TvShowCard(tvShow: tvShow);
              },
              itemCount: resultTvShow.length,
            ),
          );
        }
        if (data.state == RequestState.Empty ||
            data.state == RequestState.Error) {
          return Expanded(
            child: Center(
              child: Text(
                data.message,
                style: kHeading6,
              ),
            ),
          );
        }

        return Expanded(child: Container());
      },
    );
  }
}
