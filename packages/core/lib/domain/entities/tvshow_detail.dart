/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:12 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:12 PM
 *
 */
import 'package:core/domain/entities/season.dart';
import 'package:equatable/equatable.dart';

import 'genre.dart';

class TvShowDetail extends Equatable {
  TvShowDetail({
    required this.adult,
    required this.backdropPath,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.id,
    required this.languages,
    required this.lastAirDate,
    required this.name,
    this.nextEpisodeToAir,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.seasons,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String backdropPath;
  List<int> episodeRunTime;
  DateTime firstAirDate;
  List<Genre> genres;
  int id;
  List<String> languages;
  DateTime lastAirDate;
  String name;
  dynamic nextEpisodeToAir;
  int numberOfEpisodes;
  int numberOfSeasons;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  List<Season> seasons;
  String status;
  String tagline;
  String type;
  double voteAverage;
  int voteCount;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        episodeRunTime,
        firstAirDate,
        genres,
        id,
        languages,
        lastAirDate,
        name,
        nextEpisodeToAir,
        numberOfEpisodes,
        numberOfSeasons,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        seasons,
        status,
        tagline,
        voteAverage,
        voteCount
      ];
}
