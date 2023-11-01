/*
 * *
 *  * Created by fadhlialfarisi on 10/31/23, 9:30 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/31/23, 9:29 PM
 *
 */

import 'dart:convert';

import 'package:ditonton/common/exception.dart';
import 'package:http/http.dart' as http;

import '../models/tvshow_detail_model.dart';
import '../models/tvshow_model.dart';
import '../models/tvshow_response.dart';

abstract class TvShowRemoteDataSource {
  Future<List<TvShowModel>> searchTvShows(String query);
  Future<List<TvShowModel>> getPopularTvShows();
  Future<List<TvShowModel>> getOnAirTvShows();
  Future<List<TvShowModel>> getTopRatedTvShows();
  Future<List<TvShowModel>> getRecommendationTvShow(int id);
  Future<DetailTvShowResponse> getDetailTvShow(int id);
}

class TvShowRemoteDataSourceImpl implements TvShowRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  TvShowRemoteDataSourceImpl({required this.client});

  @override
  Future<DetailTvShowResponse> getDetailTvShow(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return DetailTvShowResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowModel>> getOnAirTvShows() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowModel>> getPopularTvShows() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowModel>> getRecommendationTvShow(int id) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowModel>> getTopRatedTvShows() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowModel>> searchTvShows(String query) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }
}
