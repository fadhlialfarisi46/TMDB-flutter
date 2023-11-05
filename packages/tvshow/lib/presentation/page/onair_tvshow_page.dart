/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 1:06 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/3/23, 9:44 PM
 *
 */
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvshow/presentation/widget/tvshow_card.dart';
import 'package:flutter/material.dart';

import '../bloc/onair_tvshow_bloc/onair_tvshow_bloc.dart';

class OnAirTvShowPage extends StatefulWidget {
  const OnAirTvShowPage({super.key});

  @override
  State<OnAirTvShowPage> createState() => _OnAirTvShowPageState();
}

class _OnAirTvShowPageState extends State<OnAirTvShowPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => BlocProvider.of<OnairTvshowBloc>(context, listen: false)
          .add(OnairTvshowEvent()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On Air Tv Shows'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<OnairTvshowBloc, OnairTvshowState>(
          builder: (_, state) {
            if (state is OnairTvshowLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is OnairTvshowLoaded) {
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
