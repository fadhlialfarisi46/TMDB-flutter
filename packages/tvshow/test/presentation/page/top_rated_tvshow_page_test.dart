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
import 'package:tvshow/presentation/bloc/top_rated_tvshow_bloc/top_rated_tvshow_bloc.dart';
import 'package:tvshow/presentation/page/top_rated_tvshow_page.dart';

class TopRatedTvShowsEventFake extends Fake implements TopRatedTvshowEvent {}

class TopRatedTvshowStateFake extends Fake implements TopRatedTvshowState {}

class MockTopRatedTvShowsBloc
    extends MockBloc<TopRatedTvshowEvent, TopRatedTvshowState>
    implements TopRatedTvshowBloc {}

void main() {
  late MockTopRatedTvShowsBloc mockTopRatedTvShowsBloc;

  setUpAll(() {
    registerFallbackValue(TopRatedTvShowsEventFake());
    registerFallbackValue(TopRatedTvshowStateFake());
  });

  setUp(() {
    mockTopRatedTvShowsBloc = MockTopRatedTvShowsBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TopRatedTvshowBloc>.value(
      value: mockTopRatedTvShowsBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockTopRatedTvShowsBloc.state)
        .thenReturn(TopRatedTvShowsLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(const TopRatedTvShowPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockTopRatedTvShowsBloc.state)
        .thenReturn(const TopRatedTvShowsLoaded(<TvShow>[]));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(const TopRatedTvShowPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockTopRatedTvShowsBloc.state)
        .thenReturn(const TopRatedTvShowsError('Failed'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(const TopRatedTvShowPage()));

    expect(textFinder, findsOneWidget);
  });
}
