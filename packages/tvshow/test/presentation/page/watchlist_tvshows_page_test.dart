/*
 * *
 *  * Created by fadhlialfarisi on 11/5/23, 10:40 AM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/5/23, 10:40 AM
 *
 */
import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/entities/tvshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvshow/tvshow.dart';

class WatchlistTvShowEventFake extends Fake implements WatchlistTvShowEvent {}

class WatchlistTvShowStateFake extends Fake implements WatchlistTvShowState {}

class MockWatchlistTvShowBloc
    extends MockBloc<WatchlistTvShowEvent, WatchlistTvShowState>
    implements WatchlistTvShowBloc {}

void main() {
  late MockWatchlistTvShowBloc mockWatchlistTvShowBloc;

  setUpAll(() {
    registerFallbackValue(WatchlistTvShowEventFake());
    registerFallbackValue(WatchlistTvShowStateFake());
  });

  setUp(() {
    mockWatchlistTvShowBloc = MockWatchlistTvShowBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<WatchlistTvShowBloc>.value(
      value: mockWatchlistTvShowBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockWatchlistTvShowBloc.state)
        .thenReturn(WatchlistTvShowLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(const WatchlistTvShowsPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockWatchlistTvShowBloc.state)
        .thenReturn(const WatchlistTvShowHasData(<TvShow>[]));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(const WatchlistTvShowsPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockWatchlistTvShowBloc.state)
        .thenReturn(const WatchlistTvShowError('Failed'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(const WatchlistTvShowsPage()));

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Empty',
      (WidgetTester tester) async {
    when(() => mockWatchlistTvShowBloc.state)
        .thenReturn(const WatchlistTvShowEmpty('You haven\'t added any yet'));

    final textFinder = find.byKey(const Key('empty_message'));

    await tester.pumpWidget(_makeTestableWidget(const WatchlistTvShowsPage()));

    expect(textFinder, findsOneWidget);
  });
}
