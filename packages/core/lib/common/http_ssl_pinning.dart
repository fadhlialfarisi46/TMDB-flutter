/*
 * *
 *  * Created by fadhlialfarisi on 11/4/23, 4:43 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 11/4/23, 4:43 PM
 *
 */
import 'package:core/common/shared.dart';
import 'package:http/http.dart' as http;

class HttpSSLPinning {
  static Future<http.Client> get _instance async =>
      _clientInstance ??= await Shared.createLEClient();
  static http.Client? _clientInstance;

  static http.Client get client => _clientInstance ?? http.Client();

  static Future<void> init() async {
    _clientInstance = await _instance;
  }
}
