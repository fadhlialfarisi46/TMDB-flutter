/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:22 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:22 PM
 *
 */

import 'package:dartz/dartz.dart';

import '../../common/failure.dart';
import '../entities/tvshow.dart';
import '../entities/tvshow_detail.dart';

abstract class TvShowRepository {
  Future<Either<Failure, List<TvShow>>> searchTvShows(String query);
  Future<bool> isAddedToWatchlist(int id);
  Future<Either<Failure, String>> insertWatchListTvShow(
      TvShowDetail tvShowDetail);
  Future<Either<Failure, String>> removeWatchlistTvShow(
      TvShowDetail tvShowDetail);
  Future<bool> getTvShowById(int id);
  Future<Either<Failure, List<TvShow>>> getWatchlistTvShows();
  Future<Either<Failure, List<TvShow>>> getOnAirTvShows();
  Future<Either<Failure, List<TvShow>>> getPopularTvShows();
  Future<Either<Failure, List<TvShow>>> getTopRatedTvShows();
  Future<Either<Failure, TvShowDetail>> getDetailTvShow(int id);
  Future<Either<Failure, List<TvShow>>> getRecommendationTvShow(int id);
}
