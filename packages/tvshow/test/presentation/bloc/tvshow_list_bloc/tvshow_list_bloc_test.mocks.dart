// Mocks generated by Mockito 5.4.2 from annotations
// in tvshow/test/presentation/bloc/tvshow_list_bloc/tvshow_list_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:core/common/failure.dart' as _i6;
import 'package:core/domain/entities/tvshow.dart' as _i7;
import 'package:core/domain/repositories/tvshow_repository.dart' as _i2;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tvshow/domain/usecase/usecases.dart' as _i4;

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

class _FakeTvShowRepository_0 extends _i1.SmartFake
    implements _i2.TvShowRepository {
  _FakeTvShowRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetOnAirTvShows].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetOnAirTvShows extends _i1.Mock implements _i4.GetOnAirTvShows {
  MockGetOnAirTvShows() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvShowRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvShowRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvShowRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.TvShow>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.TvShow>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.TvShow>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.TvShow>>>);
}

/// A class which mocks [GetPopularTvShows].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPopularTvShows extends _i1.Mock implements _i4.GetPopularTvShows {
  MockGetPopularTvShows() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvShowRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvShowRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvShowRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.TvShow>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.TvShow>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.TvShow>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.TvShow>>>);
}

/// A class which mocks [GetTopRatedTvShows].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRatedTvShows extends _i1.Mock
    implements _i4.GetTopRatedTvShows {
  MockGetTopRatedTvShows() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvShowRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvShowRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvShowRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.TvShow>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.TvShow>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.TvShow>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.TvShow>>>);
}
