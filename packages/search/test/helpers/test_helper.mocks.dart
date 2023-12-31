// Mocks generated by Mockito 5.4.2 from annotations
// in search/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i19;
import 'dart:typed_data' as _i20;

import 'package:core/common/failure.dart' as _i7;
import 'package:core/data/datasources/db/database_helper.dart' as _i17;
import 'package:core/data/datasources/movie_local_data_source.dart' as _i11;
import 'package:core/data/datasources/movie_remote_data_source.dart' as _i10;
import 'package:core/data/datasources/tvshow_local_data_source.dart' as _i16;
import 'package:core/data/datasources/tvshow_remote_data_source.dart' as _i15;
import 'package:core/data/models/models.dart' as _i3;
import 'package:core/domain/entities/movie.dart' as _i8;
import 'package:core/domain/entities/movie_detail.dart' as _i9;
import 'package:core/domain/entities/tvshow.dart' as _i13;
import 'package:core/domain/entities/tvshow_detail.dart' as _i14;
import 'package:core/domain/repositories/movie_repository.dart' as _i5;
import 'package:core/domain/repositories/tvshow_repository.dart' as _i12;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i18;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieDetailResponse_1 extends _i1.SmartFake
    implements _i3.MovieDetailResponse {
  _FakeMovieDetailResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDetailTvShowResponse_2 extends _i1.SmartFake
    implements _i3.DetailTvShowResponse {
  _FakeDetailTvShowResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_3 extends _i1.SmartFake implements _i4.Response {
  _FakeResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_4 extends _i1.SmartFake
    implements _i4.StreamedResponse {
  _FakeStreamedResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i5.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #getNowPlayingMovies,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i9.MovieDetail>>.value(
            _FakeEither_0<_i7.Failure, _i9.MovieDetail>(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.MovieDetail>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #getMovieRecommendations,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #searchMovies,
            [query],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveWatchlist(
          _i9.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [movie],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [movie],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeWatchlist(
          _i9.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [movie],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);

  @override
  _i6.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #getWatchlistMovies,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i10.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i3.MovieModel>> getNowPlayingMovies() => (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue: _i6.Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]),
      ) as _i6.Future<List<_i3.MovieModel>>);

  @override
  _i6.Future<List<_i3.MovieModel>> getPopularMovies() => (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i6.Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]),
      ) as _i6.Future<List<_i3.MovieModel>>);

  @override
  _i6.Future<List<_i3.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue: _i6.Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]),
      ) as _i6.Future<List<_i3.MovieModel>>);

  @override
  _i6.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i6.Future<_i3.MovieDetailResponse>.value(
            _FakeMovieDetailResponse_1(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.MovieDetailResponse>);

  @override
  _i6.Future<List<_i3.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue: _i6.Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]),
      ) as _i6.Future<List<_i3.MovieModel>>);

  @override
  _i6.Future<List<_i3.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue: _i6.Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]),
      ) as _i6.Future<List<_i3.MovieModel>>);
}

/// A class which mocks [MovieLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieLocalDataSource extends _i1.Mock
    implements _i11.MovieLocalDataSource {
  MockMovieLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchlist(_i3.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [movie],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);

  @override
  _i6.Future<String> removeWatchlist(_i3.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);

  @override
  _i6.Future<_i3.MovieTable?> getMovieById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getMovieById,
          [id],
        ),
        returnValue: _i6.Future<_i3.MovieTable?>.value(),
      ) as _i6.Future<_i3.MovieTable?>);

  @override
  _i6.Future<List<_i3.MovieTable>> getWatchlistMovies() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i6.Future<List<_i3.MovieTable>>.value(<_i3.MovieTable>[]),
      ) as _i6.Future<List<_i3.MovieTable>>);

  @override
  _i6.Future<void> cacheNowPlayingMovies(List<_i3.MovieTable>? movies) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheNowPlayingMovies,
          [movies],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<List<_i3.MovieTable>> getCachedNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedNowPlayingMovies,
          [],
        ),
        returnValue: _i6.Future<List<_i3.MovieTable>>.value(<_i3.MovieTable>[]),
      ) as _i6.Future<List<_i3.MovieTable>>);

  @override
  _i6.Future<void> cachePopularMovies(List<_i3.MovieTable>? movies) =>
      (super.noSuchMethod(
        Invocation.method(
          #cachePopularMovies,
          [movies],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<List<_i3.MovieTable>> getCachedPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedPopularMovies,
          [],
        ),
        returnValue: _i6.Future<List<_i3.MovieTable>>.value(<_i3.MovieTable>[]),
      ) as _i6.Future<List<_i3.MovieTable>>);

  @override
  _i6.Future<void> cacheTopRatedMovies(List<_i3.MovieTable>? movies) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheTopRatedMovies,
          [movies],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<List<_i3.MovieTable>> getCachedTopRatedMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedTopRatedMovies,
          [],
        ),
        returnValue: _i6.Future<List<_i3.MovieTable>>.value(<_i3.MovieTable>[]),
      ) as _i6.Future<List<_i3.MovieTable>>);
}

/// A class which mocks [TvShowRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvShowRepository extends _i1.Mock implements _i12.TvShowRepository {
  MockTvShowRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>> searchTvShows(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvShows,
          [query],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>>.value(
                _FakeEither_0<_i7.Failure, List<_i13.TvShow>>(
          this,
          Invocation.method(
            #searchTvShows,
            [query],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>>);

  @override
  _i6.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> insertWatchListTvShow(
          _i14.TvShowDetail? tvShowDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchListTvShow,
          [tvShowDetail],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #insertWatchListTvShow,
            [tvShowDetail],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeWatchlistTvShow(
          _i14.TvShowDetail? tvShowDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTvShow,
          [tvShowDetail],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlistTvShow,
            [tvShowDetail],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);

  @override
  _i6.Future<bool> getTvShowById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvShowById,
          [id],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>>
      getWatchlistTvShows() => (super.noSuchMethod(
            Invocation.method(
              #getWatchlistTvShows,
              [],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i13.TvShow>>(
              this,
              Invocation.method(
                #getWatchlistTvShows,
                [],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>> getOnAirTvShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getOnAirTvShows,
          [],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>>.value(
                _FakeEither_0<_i7.Failure, List<_i13.TvShow>>(
          this,
          Invocation.method(
            #getOnAirTvShows,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>> getPopularTvShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTvShows,
          [],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>>.value(
                _FakeEither_0<_i7.Failure, List<_i13.TvShow>>(
          this,
          Invocation.method(
            #getPopularTvShows,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>> getTopRatedTvShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvShows,
          [],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>>.value(
                _FakeEither_0<_i7.Failure, List<_i13.TvShow>>(
          this,
          Invocation.method(
            #getTopRatedTvShows,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i14.TvShowDetail>> getDetailTvShow(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDetailTvShow,
          [id],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, _i14.TvShowDetail>>.value(
                _FakeEither_0<_i7.Failure, _i14.TvShowDetail>(
          this,
          Invocation.method(
            #getDetailTvShow,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i14.TvShowDetail>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>>
      getRecommendationTvShow(int? id) => (super.noSuchMethod(
            Invocation.method(
              #getRecommendationTvShow,
              [id],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i13.TvShow>>(
              this,
              Invocation.method(
                #getRecommendationTvShow,
                [id],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i13.TvShow>>>);
}

/// A class which mocks [TvShowRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvShowRemoteDataSource extends _i1.Mock
    implements _i15.TvShowRemoteDataSource {
  MockTvShowRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i3.TvShowModel>> searchTvShows(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvShows,
          [query],
        ),
        returnValue:
            _i6.Future<List<_i3.TvShowModel>>.value(<_i3.TvShowModel>[]),
      ) as _i6.Future<List<_i3.TvShowModel>>);

  @override
  _i6.Future<List<_i3.TvShowModel>> getPopularTvShows() => (super.noSuchMethod(
        Invocation.method(
          #getPopularTvShows,
          [],
        ),
        returnValue:
            _i6.Future<List<_i3.TvShowModel>>.value(<_i3.TvShowModel>[]),
      ) as _i6.Future<List<_i3.TvShowModel>>);

  @override
  _i6.Future<List<_i3.TvShowModel>> getOnAirTvShows() => (super.noSuchMethod(
        Invocation.method(
          #getOnAirTvShows,
          [],
        ),
        returnValue:
            _i6.Future<List<_i3.TvShowModel>>.value(<_i3.TvShowModel>[]),
      ) as _i6.Future<List<_i3.TvShowModel>>);

  @override
  _i6.Future<List<_i3.TvShowModel>> getTopRatedTvShows() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvShows,
          [],
        ),
        returnValue:
            _i6.Future<List<_i3.TvShowModel>>.value(<_i3.TvShowModel>[]),
      ) as _i6.Future<List<_i3.TvShowModel>>);

  @override
  _i6.Future<List<_i3.TvShowModel>> getRecommendationTvShow(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRecommendationTvShow,
          [id],
        ),
        returnValue:
            _i6.Future<List<_i3.TvShowModel>>.value(<_i3.TvShowModel>[]),
      ) as _i6.Future<List<_i3.TvShowModel>>);

  @override
  _i6.Future<_i3.DetailTvShowResponse> getDetailTvShow(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDetailTvShow,
          [id],
        ),
        returnValue: _i6.Future<_i3.DetailTvShowResponse>.value(
            _FakeDetailTvShowResponse_2(
          this,
          Invocation.method(
            #getDetailTvShow,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.DetailTvShowResponse>);
}

/// A class which mocks [TvShowLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvShowLocalDataSource extends _i1.Mock
    implements _i16.TvShowLocalDataSource {
  MockTvShowLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchListTvShow(_i3.TvShowTable? tvShowTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchListTvShow,
          [tvShowTable],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);

  @override
  _i6.Future<String> removeWatchlistTvShow(_i3.TvShowTable? tvShowTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTvShow,
          [tvShowTable],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);

  @override
  _i6.Future<_i3.TvShowTable?> getTvShowById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvShowById,
          [id],
        ),
        returnValue: _i6.Future<_i3.TvShowTable?>.value(),
      ) as _i6.Future<_i3.TvShowTable?>);

  @override
  _i6.Future<List<_i3.TvShowTable>> getWatchlistTvShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvShows,
          [],
        ),
        returnValue:
            _i6.Future<List<_i3.TvShowTable>>.value(<_i3.TvShowTable>[]),
      ) as _i6.Future<List<_i3.TvShowTable>>);

  @override
  _i6.Future<void> cacheOnAirTvShows(List<_i3.TvShowTable>? tvShows) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheOnAirTvShows,
          [tvShows],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<List<_i3.TvShowTable>> getCachedOnAirTvShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedOnAirTvShows,
          [],
        ),
        returnValue:
            _i6.Future<List<_i3.TvShowTable>>.value(<_i3.TvShowTable>[]),
      ) as _i6.Future<List<_i3.TvShowTable>>);

  @override
  _i6.Future<void> cachePopularTvShows(List<_i3.TvShowTable>? tvShows) =>
      (super.noSuchMethod(
        Invocation.method(
          #cachePopularTvShows,
          [tvShows],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<List<_i3.TvShowTable>> getCachedPopularTvShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedPopularTvShows,
          [],
        ),
        returnValue:
            _i6.Future<List<_i3.TvShowTable>>.value(<_i3.TvShowTable>[]),
      ) as _i6.Future<List<_i3.TvShowTable>>);

  @override
  _i6.Future<void> cacheTopRatedTvShows(List<_i3.TvShowTable>? tvShows) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheTopRatedTvShows,
          [tvShows],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<List<_i3.TvShowTable>> getCachedTopRatedTvShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedTopRatedTvShows,
          [],
        ),
        returnValue:
            _i6.Future<List<_i3.TvShowTable>>.value(<_i3.TvShowTable>[]),
      ) as _i6.Future<List<_i3.TvShowTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i17.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i18.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i6.Future<_i18.Database?>.value(),
      ) as _i6.Future<_i18.Database?>);

  @override
  _i6.Future<int> insertWatchlist(_i3.MovieTable? movie) => (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [movie],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);

  @override
  _i6.Future<int> removeWatchlist(_i3.MovieTable? movie) => (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);

  @override
  _i6.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieById,
          [id],
        ),
        returnValue: _i6.Future<Map<String, dynamic>?>.value(),
      ) as _i6.Future<Map<String, dynamic>?>);

  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i6.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i6.Future<List<Map<String, dynamic>>>);

  @override
  _i6.Future<int> insertWatchListTvShow(_i3.TvShowTable? tvShowTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchListTvShow,
          [tvShowTable],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);

  @override
  _i6.Future<int> removeWatchlistTvShow(_i3.TvShowTable? tvShowTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTvShow,
          [tvShowTable],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);

  @override
  _i6.Future<Map<String, dynamic>?> getTvShowById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvShowById,
          [id],
        ),
        returnValue: _i6.Future<Map<String, dynamic>?>.value(),
      ) as _i6.Future<Map<String, dynamic>?>);

  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistTvShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvShows,
          [],
        ),
        returnValue: _i6.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i6.Future<List<Map<String, dynamic>>>);

  @override
  _i6.Future<void> insertCacheTransactionMovies(
    List<_i3.MovieTable>? movies,
    String? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertCacheTransactionMovies,
          [
            movies,
            category,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<List<Map<String, dynamic>>> getCacheMovies(String? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCacheMovies,
          [category],
        ),
        returnValue: _i6.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i6.Future<List<Map<String, dynamic>>>);

  @override
  _i6.Future<int> clearCacheMovies(String? category) => (super.noSuchMethod(
        Invocation.method(
          #clearCacheMovies,
          [category],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);

  @override
  _i6.Future<void> insertCacheTransactionTvShows(
    List<_i3.TvShowTable>? tvShows,
    String? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertCacheTransactionTvShows,
          [
            tvShows,
            category,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<List<Map<String, dynamic>>> getCacheTvShows(String? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCacheTvShows,
          [category],
        ),
        returnValue: _i6.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i6.Future<List<Map<String, dynamic>>>);

  @override
  _i6.Future<int> clearCacheTvShows(String? category) => (super.noSuchMethod(
        Invocation.method(
          #clearCacheTvShows,
          [category],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<_i4.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<_i4.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i19.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<_i4.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i19.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<_i4.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i19.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<_i4.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i19.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);

  @override
  _i6.Future<_i20.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i20.Uint8List>.value(_i20.Uint8List(0)),
      ) as _i6.Future<_i20.Uint8List>);

  @override
  _i6.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i6.Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_4(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i6.Future<_i4.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
