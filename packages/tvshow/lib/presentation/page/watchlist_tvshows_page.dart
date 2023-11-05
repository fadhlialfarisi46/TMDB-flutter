/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 3:56 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/3/23, 9:44 PM
 *
 */
import 'package:core/common/constants.dart';
import 'package:core/common/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvshow/presentation/widget/tvshow_card.dart';
import 'package:flutter/material.dart';

import '../bloc/watchlist_tvshow_bloc/watchlist_tvshow_bloc.dart';

class WatchlistTvShowsPage extends StatefulWidget {
  const WatchlistTvShowsPage({super.key});

  @override
  State<WatchlistTvShowsPage> createState() => _WatchlistTvShowsPageState();
}

class _WatchlistTvShowsPageState extends State<WatchlistTvShowsPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => BlocProvider.of<WatchlistTvShowBloc>(context, listen: false)
          .add(WatchlistTvShowEvent()),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    BlocProvider.of<WatchlistTvShowBloc>(context, listen: false)
        .add(WatchlistTvShowEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TvShow Watchlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchlistTvShowBloc, WatchlistTvShowState>(
          builder: (_, state) {
            if (state is WatchlistTvShowLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WatchlistTvShowHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvshow = state.watchlistResult[index];
                  return TvShowCard(
                    tvShow: tvshow,
                  );
                },
                itemCount: state.watchlistResult.length,
              );
            } else if (state is WatchlistTvShowEmpty) {
              return Center(
                key: const Key('empty_message'),
                child: Text(
                  state.message,
                  style: kHeading6,
                ),
              );
            } else if (state is WatchlistTvShowError) {
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
