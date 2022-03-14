import 'dart:convert';
import 'dart:async';
import 'package:continental_poc/Model/CountriesResponse.dart';

import 'package:http/http.dart' as http;
import 'package:continental_poc/EnvUrl/env.dart';

class TodoService {
  Future<CountriesResponse> fetchData() async {
    http.Response response = await http.get(
        Uri.parse(EnvironmentConstant.BASE_URL),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      CountriesResponse temp = CountriesResponse.fromJson(jsonMap);
      return temp;
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
