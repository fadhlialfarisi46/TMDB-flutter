/*
 * *
 *  * Created by fadhlialfarisi on 11/5/23, 10:39 AM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/5/23, 10:39 AM
 *
 */
import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/entities/tvshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvshow/tvshow.dart';

class PopularTvShowsEventFake extends Fake implements PopularTvshowEvent {}

class PopularTvShowsStateFake extends Fake implements PopularTvShowsState {}

class MockPopularTvShowsBloc
    extends MockBloc<PopularTvshowEvent, PopularTvShowsState>
    implements PopularTvshowBloc {}

void main() {
  late MockPopularTvShowsBloc mockPopularTvShowsBloc;

  setUpAll(() {
    registerFallbackValue(PopularTvShowsEventFake());
    registerFallbackValue(PopularTvShowsStateFake());
  });

  setUp(() {
    mockPopularTvShowsBloc = MockPopularTvShowsBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<PopularTvshowBloc>.value(
      value: mockPopularTvShowsBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockPopularTvShowsBloc.state)
        .thenReturn(PopularTvShowsLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(const PopularTvShowPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockPopularTvShowsBloc.state)
        .thenReturn(const PopularTvShowsLoaded(<TvShow>[]));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(const PopularTvShowPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockPopularTvShowsBloc.state)
        .thenReturn(const PopularTvShowsError('Failed'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(const PopularTvShowPage()));

    expect(textFinder, findsOneWidget);
  });
}
