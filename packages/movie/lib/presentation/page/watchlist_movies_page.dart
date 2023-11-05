/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 4:41 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/3/23, 8:56 PM
 *
 */

import 'package:core/common/constants.dart';
import 'package:core/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart';

class WatchlistMoviesPage extends StatefulWidget {
  const WatchlistMoviesPage({Key? key}) : super(key: key);

  @override
  State<WatchlistMoviesPage> createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => BlocProvider.of<WatchlistMovieBloc>(context, listen: false)
          .add(WatchlistMovieEvent()),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    BlocProvider.of<WatchlistMovieBloc>(context, listen: false)
        .add(WatchlistMovieEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchlistMovieBloc, WatchlistMovieState>(
          builder: (_, state) {
            if (state is WatchlistMovieLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WatchlistMovieHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.watchlistResult[index];
                  return MovieCard(
                    movie: movie,
                  );
                },
                itemCount: state.watchlistResult.length,
              );
            } else if (state is WatchlistMovieEmpty) {
              return Center(
                key: const Key('empty_message'),
                child: Text(
                  state.message,
                  style: kHeading6,
                ),
              );
            } else if (state is WatchlistMovieError) {
              return Center(
                key: const Key('error_message'),
                child: Text(
                  state.message,
                  style: kHeading6,
                ),
              );
            } else {
              return const Center();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
