/*
 * *
 *  * Created by fadhlialfarisi on 11/5/23, 10:39 AM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/5/23, 10:39 AM
 *
 */
import 'package:bloc_test/bloc_test.dart';
import 'package:core/common/state_enum.dart';
import 'package:core/domain/entities/tvshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvshow/tvshow.dart';

import '../../dummy_data/dummy_objects.dart';

class DetailTvShowEventFake extends Fake implements DetailTvshowEvent {}

class DetailTvShowStateFake extends Fake implements DetailTvshowState {}

class MockDetailTvShowBloc
    extends MockBloc<DetailTvshowEvent, DetailTvshowState>
    implements DetailTvshowBloc {}

void main() {
  late MockDetailTvShowBloc mockDetailTvShowBloc;

  setUpAll(() {
    registerFallbackValue(DetailTvShowEventFake());
    registerFallbackValue(DetailTvShowStateFake());
  });

  setUp(() => mockDetailTvShowBloc = MockDetailTvShowBloc());

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<DetailTvshowBloc>.value(
      value: mockDetailTvShowBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Detail page should display circular progress when loading',
      (WidgetTester tester) async {
    when(() => mockDetailTvShowBloc.state).thenReturn(
        DetailTvshowState.initial()
            .copyWith(tvShowDetailState: RequestState.loading));

    final circularProgressIndicator = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const DetailTvShowPage(id: 1)));

    expect(circularProgressIndicator, findsOneWidget);
  });

  testWidgets('should display loading when recommendationState loading',
      (WidgetTester tester) async {
    when(() => mockDetailTvShowBloc.state)
        .thenReturn(DetailTvshowState.initial().copyWith(
      tvShowDetailState: RequestState.loaded,
      tvShowDetail: testTvShowDetail,
      tvShowRecommendationsState: RequestState.loading,
      tvShowRecommendations: <TvShow>[],
      isAddedToWatchlist: false,
    ));

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const DetailTvShowPage(id: 1)));

    expect(progressBarFinder, findsWidgets);
  });

  testWidgets(
      'Watchlist button should display add icon when Tv Show not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockDetailTvShowBloc.state)
        .thenReturn(DetailTvshowState.initial().copyWith(
      tvShowDetailState: RequestState.loaded,
      tvShowDetail: testTvShowDetail,
      tvShowRecommendationsState: RequestState.loaded,
      tvShowRecommendations: <TvShow>[],
      isAddedToWatchlist: false,
    ));

    final watchlistButtonIcon = find.byIcon(Icons.favorite_border_outlined);

    await tester.pumpWidget(makeTestableWidget(const DetailTvShowPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when Tv Show is added to wathclist',
      (WidgetTester tester) async {
    when(() => mockDetailTvShowBloc.state)
        .thenReturn(DetailTvshowState.initial().copyWith(
      tvShowDetailState: RequestState.loaded,
      tvShowDetail: testTvShowDetail,
      tvShowRecommendationsState: RequestState.loaded,
      tvShowRecommendations: <TvShow>[],
      isAddedToWatchlist: true,
    ));

    final watchlistButtonIcon = find.byIcon(Icons.favorite);

    await tester.pumpWidget(makeTestableWidget(const DetailTvShowPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    whenListen(
        mockDetailTvShowBloc,
        Stream.fromIterable([
          DetailTvshowState.initial().copyWith(
            tvShowDetailState: RequestState.loaded,
            tvShowDetail: testTvShowDetail,
            tvShowRecommendationsState: RequestState.loaded,
            tvShowRecommendations: <TvShow>[],
            isAddedToWatchlist: false,
          ),
          DetailTvshowState.initial().copyWith(
            tvShowDetailState: RequestState.loaded,
            tvShowDetail: testTvShowDetail,
            tvShowRecommendationsState: RequestState.loaded,
            tvShowRecommendations: <TvShow>[],
            isAddedToWatchlist: false,
            watchlistMessage: 'Added to TvShow Watchlist',
          ),
        ]),
        initialState: DetailTvshowState.initial());

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(makeTestableWidget(const DetailTvShowPage(id: 1)));
    await tester.pump();

    expect(find.byIcon(Icons.favorite_border_outlined), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to TvShow Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when removed from watchlist',
      (WidgetTester tester) async {
    whenListen(
        mockDetailTvShowBloc,
        Stream.fromIterable([
          DetailTvshowState.initial().copyWith(
            tvShowDetailState: RequestState.loaded,
            tvShowDetail: testTvShowDetail,
            tvShowRecommendationsState: RequestState.loaded,
            tvShowRecommendations: <TvShow>[],
            isAddedToWatchlist: false,
          ),
          DetailTvshowState.initial().copyWith(
            tvShowDetailState: RequestState.loaded,
            tvShowDetail: testTvShowDetail,
            tvShowRecommendationsState: RequestState.loaded,
            tvShowRecommendations: <TvShow>[],
            isAddedToWatchlist: false,
            watchlistMessage: 'Removed from TvShow Watchlist',
          ),
        ]),
        initialState: DetailTvshowState.initial());

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(makeTestableWidget(const DetailTvShowPage(id: 1)));
    await tester.pump();

    expect(find.byIcon(Icons.favorite_border_outlined), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Removed from TvShow Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    whenListen(
        mockDetailTvShowBloc,
        Stream.fromIterable([
          DetailTvshowState.initial().copyWith(
            tvShowDetailState: RequestState.loaded,
            tvShowDetail: testTvShowDetail,
            tvShowRecommendationsState: RequestState.loaded,
            tvShowRecommendations: <TvShow>[],
            isAddedToWatchlist: false,
          ),
          DetailTvshowState.initial().copyWith(
            tvShowDetailState: RequestState.loaded,
            tvShowDetail: testTvShowDetail,
            tvShowRecommendationsState: RequestState.loaded,
            tvShowRecommendations: <TvShow>[],
            isAddedToWatchlist: false,
            watchlistMessage: 'Failed',
          ),
          DetailTvshowState.initial().copyWith(
            tvShowDetailState: RequestState.loaded,
            tvShowDetail: testTvShowDetail,
            tvShowRecommendationsState: RequestState.loaded,
            tvShowRecommendations: <TvShow>[],
            isAddedToWatchlist: false,
            watchlistMessage: 'Failed ',
          ),
        ]),
        initialState: DetailTvshowState.initial());

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(makeTestableWidget(const DetailTvShowPage(id: 1)));
    await tester.pump();

    expect(find.byIcon(Icons.favorite_border_outlined), findsOneWidget);

    await tester.tap(watchlistButton, warnIfMissed: false);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });

  testWidgets(
      'Detail Tv Show Page should display Error Text when No Internet Network (Error)',
      (WidgetTester tester) async {
    when(() => mockDetailTvShowBloc.state).thenReturn(
        DetailTvshowState.initial().copyWith(
            tvShowDetailState: RequestState.error,
            message: 'Failed to connect to the network'));

    final textErrorBarFinder = find.text('Failed to connect to the network');

    await tester.pumpWidget(makeTestableWidget(const DetailTvShowPage(id: 1)));
    await tester.pump();

    expect(textErrorBarFinder, findsOneWidget);
  });
}
