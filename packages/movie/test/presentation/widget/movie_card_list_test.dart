/*
 * *
 *  * Created by fadhlialfarisi on 11/5/23, 2:05 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/5/23, 2:05 PM
 *
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie/presentation/widget/movie_card_list.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  group('Movie card Widget Test', () {
    Widget makeTestableWidget() {
      return MaterialApp(
          home: Scaffold(
              body: MovieCard(
        movie: testMovie,
      )));
    }

    testWidgets('Testing if title movie shows', (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget());
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(InkWell), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(ClipRRect), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });
  });
}
