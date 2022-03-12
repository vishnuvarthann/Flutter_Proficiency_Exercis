import 'dart:convert';
import 'dart:async';
import 'package:continental_poc/Model/model_data.dart';
import 'package:http/http.dart' as http;
import 'package:continental_poc/EnvUrl/env.dart';

class TodoService {
  Future<List<JsonData>> fetchData() async {
    http.Response response = await http.get(
        Uri.parse(EnvironmentConstant.BASE_URL),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      var jsontitle = jsonMap['title'] as String;
      print(jsontitle);

      List<JsonData> temp = (jsonMap['rows'] as List)
          .map((itemWord) => JsonData.fromJson(itemWord))
          .toList();
      return temp;
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
