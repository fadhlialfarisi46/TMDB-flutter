/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 1:19 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/3/23, 9:44 PM
 *  
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvshow/presentation/widget/tvshow_card.dart';
import 'package:flutter/material.dart';

import '../bloc/top_rated_tvshow_bloc/top_rated_tvshow_bloc.dart';

class TopRatedTvShowPage extends StatefulWidget {
  const TopRatedTvShowPage({super.key});

  @override
  State<TopRatedTvShowPage> createState() => _TopRatedTvShowPageState();
}

class _TopRatedTvShowPageState extends State<TopRatedTvShowPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => BlocProvider.of<TopRatedTvshowBloc>(context, listen: false)
          .add(TopRatedTvshowEvent()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Tv Shows'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedTvshowBloc, TopRatedTvshowState>(
          builder: (_, state) {
            if (state is TopRatedTvShowsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedTvShowsLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvShow = state.tvShows[index];
                  return TvShowCard(
                    tvShow: tvShow,
                  );
                },
                itemCount: state.tvShows.length,
              );
            } else {
              return const Center(
                key: Key('error_message'),
                child: Text('Failed'),
              );
            }
          },
        ),
      ),
    );
  }
}
