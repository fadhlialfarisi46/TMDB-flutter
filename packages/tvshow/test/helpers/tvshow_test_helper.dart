/*
 * *
 *  * Created by fadhlialfarisi on 11/5/23, 10:00 AM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/2/23, 8:33 AM
 *  
 */
import 'package:core/domain/repositories/tvshow_repository.dart';
import 'package:http/http.dart' as http;

import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/data/datasources/tvshow_local_data_source.dart';
import 'package:core/data/datasources/tvshow_remote_data_source.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  TvShowRepository,
  TvShowRemoteDataSource,
  TvShowLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
