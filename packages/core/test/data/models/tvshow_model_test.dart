/*
 * *
 *  * Created by fadhlialfarisi on 11/2/23, 8:39 AM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/2/23, 8:39 AM
 *
 */
import 'package:core/data/models/models.dart';
import 'package:core/domain/entities/tvshow.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTvShowModel = TvShowModel(
      backdropPath: "/eiRLR7HN0hdyYsahegb0FP1Yra0.jpg",
      firstAirDate: DateTime.tryParse("2023-11-03"),
      genreIds: [18, 9648],
      id: 110531,
      name: "Pretty Little Liars: Original Sin",
      originCountry: ["US"],
      originalLanguage: "en",
      originalName: "Pretty Little Liars: Original Sin",
      overview:
          "Twenty years ago, a series of tragic events almost ripped the blue-collar town of Millwood apart. Now, in the present day, a group of disparate teen girls finds themselves tormented by an unknown Assailant and made to pay for the secret sin their parents committed two decades ago, as well as their own.",
      popularity: 627.108,
      posterPath: "/igmLgglembi9mZ2RYQRaGKigbvq.jpg",
      voteAverage: 7.9,
      voteCount: 47);

  final tTvShow = TvShow(
      backdropPath: "/eiRLR7HN0hdyYsahegb0FP1Yra0.jpg",
      firstAirDate: DateTime.tryParse("2023-11-03"),
      genreIds: [18, 9648],
      id: 110531,
      name: "Pretty Little Liars: Original Sin",
      originCountry: ["US"],
      originalLanguage: "en",
      originalName: "Pretty Little Liars: Original Sin",
      overview:
          "Twenty years ago, a series of tragic events almost ripped the blue-collar town of Millwood apart. Now, in the present day, a group of disparate teen girls finds themselves tormented by an unknown Assailant and made to pay for the secret sin their parents committed two decades ago, as well as their own.",
      popularity: 627.108,
      posterPath: "/igmLgglembi9mZ2RYQRaGKigbvq.jpg",
      voteAverage: 7.9,
      voteCount: 47);

  test('should be a subclass of TvShow entity', () async {
    final result = tTvShowModel.toEntity();
    expect(result, tTvShow);
  });
}
