/*
 * *
 *  * Created by fadhlialfarisi on 11/5/23, 11:10 AM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/5/23, 11:10 AM
 *
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvshow/presentation/widget/tvshow_card.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  group('TvShow card Widget Test', () {
    Widget makeTestableWidget() {
      return MaterialApp(
          home: Scaffold(
              body: TvShowCard(
        tvShow: testTvshow,
      )));
    }

    testWidgets('Testing all widget shows', (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget());
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(InkWell), findsOneWidget);
      expect(find.byType(ClipRRect), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.byType(RatingBarIndicator), findsOneWidget);
    });
  });
}
