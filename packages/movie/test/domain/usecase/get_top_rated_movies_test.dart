/*
 * *
 *  * Created by fadhlialfarisi on 11/5/23, 1:40 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/5/23, 9:50 AM
 *
 */

import 'package:core/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/usecase/get_top_rated_movies.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTopRatedMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetTopRatedMovies(mockMovieRepository);
  });

  final tMovies = <Movie>[];

  test('should get list of movies from repository', () async {
    // arrange
    when(mockMovieRepository.getTopRatedMovies())
        .thenAnswer((_) async => Right(tMovies));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tMovies));
  });
}