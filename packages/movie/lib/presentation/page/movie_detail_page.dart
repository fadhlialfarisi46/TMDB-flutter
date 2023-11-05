/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 4:33 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/3/23, 8:56 PM
 *
 */

import 'package:core/common/constants.dart';
import 'package:core/common/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movie_detail_bloc/movie_detail_bloc.dart';
import '../widget/detail_content.dart';

class MovieDetailPage extends StatefulWidget {
  final int id;
  const MovieDetailPage({super.key, required this.id});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<MovieDetailBloc>(context)
          .add(FetchMovieDetail(widget.id));
      BlocProvider.of<MovieDetailBloc>(context)
          .add(LoadWatchlistStatus(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MovieDetailBloc, MovieDetailState>(
        listener: (context, state) async {
          if (state.watchlistMessage ==
                  MovieDetailBloc.watchlistAddSuccessMessage ||
              state.watchlistMessage ==
                  MovieDetailBloc.watchlistRemoveSuccessMessage) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.watchlistMessage),
            ));
          } else {
            await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(state.watchlistMessage),
                  );
                });
          }
        },
        listenWhen: (previousState, currentState) =>
            previousState.watchlistMessage != currentState.watchlistMessage &&
            currentState.watchlistMessage != '',
        builder: (context, state) {
          if (state.movieDetailState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.movieDetailState == RequestState.loaded) {
            final movie = state.movieDetail!;
            return SafeArea(
              child: DetailContent(
                movie: movie,
                isAddedWatchlist: state.isAddedToWatchlist,
                recommendations: state.movieRecommendations,
              ),
            );
          } else if (state.movieDetailState == RequestState.error) {
            return Center(child: Text(state.message, style: kSubtitle));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
