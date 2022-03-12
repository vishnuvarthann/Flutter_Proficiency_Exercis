
import 'package:counntry_test/countries_response.dart';
import 'package:counntry_test/service.dart';
import 'package:flutter/material.dart';

class CountryList extends StatelessWidget {
  const CountryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<CountriesResponse>(
          future: TodoService.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final CountriesResponse data = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(data.title ?? ""),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (c, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                child: Text(data.rows![index].title ?? ""),
                              ),
                            ),
                          );
                        },
                        itemCount: data.rows?.length ?? 0,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Text("Loading");
            }
          }),
    );
  }
}



import 'dart:convert';
import 'dart:async';
import 'package:counntry_test/countries_response.dart';
import 'package:http/http.dart' as http;

class TodoService {
 static Future<CountriesResponse> fetchData() async {
    http.Response response = await http.get(
        Uri.parse("https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"),
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
