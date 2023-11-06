/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 1:22 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/3/23, 9:44 PM
 *
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/common/constants.dart';
import 'package:core/common/routes.dart';
import 'package:core/common/utils.dart';
import 'package:core/domain/entities/tvshow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/tvshow_list_bloc/tvshow_list_bloc.dart';

class TvShowPage extends StatefulWidget {
  const TvShowPage({Key? key}) : super(key: key);

  @override
  State<TvShowPage> createState() => _TvShowPageState();
}

class _TvShowPageState extends State<TvShowPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<PopularTvshowListBloc>(context).add(const TvshowEvent());
      BlocProvider.of<OnAirTvshowListBloc>(context).add(const TvshowEvent());
      BlocProvider.of<TopRatedTvshowListBloc>(context).add(const TvshowEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Shows'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SEARCH_ROUTE, arguments: tvshow);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TOP_RATED_TVSHOW_ROUTE),
              ),
              BlocBuilder<TopRatedTvshowListBloc, TvshowListState>(
                  builder: (_, state) {
                if (state is TvshowListLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvshowListLoaded) {
                  return TvShowList(tvShows: state.tvShows);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'On Air',
                onTap: () => Navigator.pushNamed(context, ONAIR_TVSHOW_ROUTE),
              ),
              BlocBuilder<OnAirTvshowListBloc, TvshowListState>(
                  builder: (_, state) {
                if (state is TvshowListLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvshowListLoaded) {
                  return TvShowList(tvShows: state.tvShows);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Popular',
                onTap: () => Navigator.pushNamed(context, POPULAR_TVSHOW_ROUTE),
              ),
              BlocBuilder<PopularTvshowListBloc, TvshowListState>(
                  builder: (_, state) {
                if (state is TvshowListLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvshowListLoaded) {
                  return TvShowList(tvShows: state.tvShows);
                } else {
                  return const Text('Failed');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}

class TvShowList extends StatelessWidget {
  final List<TvShow> tvShows;

  const TvShowList({super.key, required this.tvShows});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tvShow = tvShows[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    DETAIL_TVSHOW_ROUTE,
                    arguments: tvShow.id,
                  );
                },
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: CachedNetworkImage(
                        imageUrl: '$BASE_IMAGE_URL${tvShow.posterPath}',
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Container(
                        height: 25,
                        padding: const EdgeInsets.all(4),
                        color: Colors.black12.withOpacity(0.5),
                        child: Text(
                          tvShow.firstAirDate!.year.toString(),
                        ),
                      ),
                    )
                  ],
                )),
          );
        },
        itemCount: tvShows.length,
      ),
    );
  }
}
