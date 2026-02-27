import 'dart:convert';

import 'package:qunova/core/network/api_endpoints.dart';
import 'package:qunova/features/home/data/models/response_data_model.dart';
import 'package:http/http.dart' as http;

class HomeReposiotry {
  static Future<BackendResModel> fetchData() async {
    http.Response? response;
    Map<String, String> requestHeaders = {"Content-Type": "application/json"};
    try {
      response = await http.get(
        Uri.parse(
          '${ApiEndpoints.baseUrl}${ApiEndpoints.homepageDataEndpoint}',
        ),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return BackendResModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get data');
    }
  }
}
