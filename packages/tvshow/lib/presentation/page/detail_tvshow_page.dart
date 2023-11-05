/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 12:51 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/3/23, 9:04 PM
 *
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/common/constants.dart';
import 'package:core/common/routes.dart';
import 'package:core/common/state_enum.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/tvshow.dart';
import 'package:core/domain/entities/tvshow_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../bloc/detail_tvshow_bloc/detail_tvshow_bloc.dart';

class DetailTvShowPage extends StatefulWidget {
  final int id;

  const DetailTvShowPage({super.key, required this.id});

  @override
  State<DetailTvShowPage> createState() => _DetailTvShowPageState();
}

class _DetailTvShowPageState extends State<DetailTvShowPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<DetailTvshowBloc>(context)
          .add(FetchDetailTvShow(widget.id));
      BlocProvider.of<DetailTvshowBloc>(context)
          .add(LoadWatchlistStatus(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DetailTvshowBloc, DetailTvshowState>(
        listener: (context, state) {
          if (state.watchlistMessage == watchlistAddTvShowSuccessMessage ||
              state.watchlistMessage == watchlistRemoveTvShowSuccessMessage) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.watchlistMessage),
            ));
          } else {
            showDialog(
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
          if (state.tvShowDetailState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.tvShowDetailState == RequestState.loaded) {
            debugPrint('tvshow ${state.tvShowDetail}');
            final tvShow = state.tvShowDetail!;
            return SafeArea(
              child: DetailContentTvShow(
                tvShow: tvShow,
                isAddedToWatchlist: state.isAddedToWatchlist,
                recommendations: state.tvShowRecommendations,
              ),
            );
          } else if (state.tvShowDetailState == RequestState.error) {
            return Center(child: Text(state.message, style: kSubtitle));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class DetailContentTvShow extends StatelessWidget {
  final TvShowDetail tvShow;
  final bool isAddedToWatchlist;
  final List<TvShow> recommendations;

  const DetailContentTvShow(
      {Key? key,
      required this.tvShow,
      required this.isAddedToWatchlist,
      required this.recommendations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '$BASE_IMAGE_URL${tvShow.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                tvShow.name,
                                style: kHeading5,
                              ),
                            ),
                            Center(
                              child: Text(
                                '"${tvShow.tagline}"',
                                style: kSubtitle,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            _buildWatchlistButton(context),
                            Text(
                              _showGenres(tvShow.genres),
                            ),
                            _buildRatingBar(),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              tvShow.overview.isNotEmpty
                                  ? tvShow.overview
                                  : 'no overview',
                            ),
                            const SizedBox(height: 16),
                            tvShow.seasons.isNotEmpty
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "Season",
                                        style: kHeading6,
                                      ),
                                      _buildSeasonContainer()
                                    ],
                                  )
                                : Container(),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            _buildRecommendationBloc(),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            minChildSize: 0.25,
          ),
        ),
        _buildBackButton(context)
      ],
    );
  }

  BlocBuilder<DetailTvshowBloc, DetailTvshowState> _buildRecommendationBloc() {
    return BlocBuilder<DetailTvshowBloc, DetailTvshowState>(
      builder: (context, state) {
        if (state.tvShowRecommendationsState == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.tvShowRecommendationsState == RequestState.error) {
          return Text(state.message);
        } else if (state.tvShowRecommendationsState == RequestState.loaded) {
          return SizedBox(
            height: 150,
            child: state.tvShowRecommendations.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final tvshow = state.tvShowRecommendations[index];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              DETAIL_TVSHOW_ROUTE,
                              arguments: tvshow.id,
                            );
                          },
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w500${tvshow.posterPath}',
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: state.tvShowRecommendations.length,
                  )
                : Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: Text('No recommendation', style: kBodyText),
                  ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Row _buildRatingBar() {
    return Row(
      children: [
        RatingBarIndicator(
          rating: tvShow.voteAverage / 2,
          itemCount: 5,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: kMikadoYellow,
          ),
          itemSize: 24,
        ),
        Text('${tvShow.voteAverage / 2}')
      ],
    );
  }

  ElevatedButton _buildWatchlistButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (!isAddedToWatchlist) {
          context.read<DetailTvshowBloc>().add(AddToWatchlist(tvShow));
          context.read<DetailTvshowBloc>().add(LoadWatchlistStatus(tvShow.id));
        } else {
          context.read<DetailTvshowBloc>().add(RemoveFromWatchlist(tvShow));
          context.read<DetailTvshowBloc>().add(LoadWatchlistStatus(tvShow.id));
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isAddedToWatchlist
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border_outlined),
          const Text('Watchlist'),
        ],
      ),
    );
  }

  SizedBox _buildSeasonContainer() {
    return SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final tv = tvShow.seasons[index];
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                child: CachedNetworkImage(
                  imageUrl: 'https://image.tmdb.org/t/p/w500${tv.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            );
          },
          itemCount: tvShow.seasons.length,
        ));
  }

  Padding _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: kRichBlack,
        foregroundColor: Colors.white,
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  String _showGenres(List<Genre> genres) {
    return genres.map((e) => e.name).toList().join(', ');
  }
}
