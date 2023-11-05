/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 1:09 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/3/23, 9:44 PM
 *
 */
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvshow/presentation/widget/tvshow_card.dart';
import 'package:flutter/material.dart';

import '../bloc/popular_tvshow_bloc/popular_tvshow_bloc.dart';

class PopularTvShowPage extends StatefulWidget {
  const PopularTvShowPage({super.key});

  @override
  State<PopularTvShowPage> createState() => _PopularTvShowPageState();
}

class _PopularTvShowPageState extends State<PopularTvShowPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        BlocProvider.of<PopularTvshowBloc>(context, listen: false)
            .add(PopularTvshowEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Tv Shows'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularTvshowBloc, PopularTvShowsState>(
          builder: (_, state) {
            if (state is PopularTvShowsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularTvShowsLoaded) {
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
