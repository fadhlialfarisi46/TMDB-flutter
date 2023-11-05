/*
 * *
 *  * Created by fadhlialfarisi on 11/5/23, 1:58 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/5/23, 1:58 PM
 *
 */
import 'package:bloc_test/bloc_test.dart';
import 'package:core/common/state_enum.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/presentation/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie/presentation/page/movie_detail_page.dart';

import '../../dummy_data/dummy_objects.dart';

class MovieDetailEventFake extends Fake implements MovieDetailEvent {}

class MovieDetailStateFake extends Fake implements MovieDetailState {}

class MockMovieDetailBloc extends MockBloc<MovieDetailEvent, MovieDetailState>
    implements MovieDetailBloc {}

void main() {
  late MockMovieDetailBloc mockMovieDetailBloc;

  setUpAll(() {
    registerFallbackValue(MovieDetailEventFake());
    registerFallbackValue(MovieDetailStateFake());
  });

  setUp(() {
    mockMovieDetailBloc = MockMovieDetailBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<MovieDetailBloc>.value(
      value: mockMovieDetailBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Detail Movie Page should display Progressbar when loading',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state).thenReturn(MovieDetailState.initial()
        .copyWith(movieDetailState: RequestState.loading));

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('should display loading when recommendationState loading',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(MovieDetailState.initial().copyWith(
      movieDetailState: RequestState.loaded,
      movieDetail: testMovieDetail,
      movieRecommendationState: RequestState.loading,
      movieRecommendations: <Movie>[],
      isAddedToWatchlist: false,
    ));

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(progressBarFinder, findsWidgets);
  });

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(MovieDetailState.initial().copyWith(
      movieDetailState: RequestState.loaded,
      movieDetail: testMovieDetail,
      movieRecommendationState: RequestState.loaded,
      movieRecommendations: [testMovie],
      isAddedToWatchlist: false,
    ));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(MovieDetailState.initial().copyWith(
      movieDetailState: RequestState.loaded,
      movieDetail: testMovieDetail,
      movieRecommendationState: RequestState.loaded,
      movieRecommendations: [testMovie],
      isAddedToWatchlist: true,
    ));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    whenListen(
        mockMovieDetailBloc,
        Stream.fromIterable([
          MovieDetailState.initial().copyWith(
            movieDetailState: RequestState.loaded,
            movieDetail: testMovieDetail,
            movieRecommendationState: RequestState.loaded,
            movieRecommendations: [testMovie],
            isAddedToWatchlist: false,
          ),
          MovieDetailState.initial().copyWith(
            movieDetailState: RequestState.loaded,
            movieDetail: testMovieDetail,
            movieRecommendationState: RequestState.loaded,
            movieRecommendations: [testMovie],
            isAddedToWatchlist: false,
            watchlistMessage: 'Added to Watchlist',
          ),
        ]),
        initialState: MovieDetailState.initial());

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));
    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when removed from watchlist',
      (WidgetTester tester) async {
    whenListen(
        mockMovieDetailBloc,
        Stream.fromIterable([
          MovieDetailState.initial().copyWith(
            movieDetailState: RequestState.loaded,
            movieDetail: testMovieDetail,
            movieRecommendationState: RequestState.loaded,
            movieRecommendations: [testMovie],
            isAddedToWatchlist: false,
          ),
          MovieDetailState.initial().copyWith(
            movieDetailState: RequestState.loaded,
            movieDetail: testMovieDetail,
            movieRecommendationState: RequestState.loaded,
            movieRecommendations: [testMovie],
            isAddedToWatchlist: false,
            watchlistMessage: 'Removed from Watchlist',
          ),
        ]),
        initialState: MovieDetailState.initial());

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));
    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Removed from Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    whenListen(
        mockMovieDetailBloc,
        Stream.fromIterable([
          MovieDetailState.initial().copyWith(
            movieDetailState: RequestState.loaded,
            movieDetail: testMovieDetail,
            movieRecommendationState: RequestState.loaded,
            movieRecommendations: [testMovie],
            isAddedToWatchlist: false,
          ),
          MovieDetailState.initial().copyWith(
            movieDetailState: RequestState.loaded,
            movieDetail: testMovieDetail,
            movieRecommendationState: RequestState.loaded,
            movieRecommendations: [testMovie],
            isAddedToWatchlist: false,
            watchlistMessage: 'Failed',
          ),
          MovieDetailState.initial().copyWith(
            movieDetailState: RequestState.loaded,
            movieDetail: testMovieDetail,
            movieRecommendationState: RequestState.loaded,
            movieRecommendations: [testMovie],
            isAddedToWatchlist: false,
            watchlistMessage: 'Failed ',
          ),
        ]),
        initialState: MovieDetailState.initial());

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));
    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton, warnIfMissed: false);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });

  testWidgets(
      'Detail Movie Page should display Error Text when No Internet Network (Error)',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state).thenReturn(MovieDetailState.initial()
        .copyWith(
            movieDetailState: RequestState.error,
            message: 'Failed to connect to the network'));

    final textErrorBarFinder = find.text('Failed to connect to the network');

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));
    await tester.pump();

    expect(textErrorBarFinder, findsOneWidget);
  });
}
