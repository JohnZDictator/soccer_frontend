import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soccer_frontend/stadium/models/stadium.dart';

class StadiumDataProvider {
  StadiumDataProvider({@required this.httpClient}) : assert(httpClient != null);
  final http.Client httpClient;

  final _baseUrl = 'http://10.0.2.2:8888';

  Future<List<Stadium>> getStadium() async {
    final response = await httpClient.get('$_baseUrl/v1/stadium');
    if (response.statusCode == 200) {
      final stadiums = jsonDecode(response.body) as List;
      return stadiums.map((s) => Stadium.fromJson(s)).toList();
    } else {
      throw Exception('Failed to fetch stadiums.');
    }
  }

  Future<Stadium> getStadiumById(int id) async {
    final response = await httpClient.get('$_baseUrl/v1/stadium/$id');
    if (response.statusCode == 200) {
      return Stadium.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch stadium by id.');
    }
  }

  Future<Stadium> createStadium(Stadium stadium) async {
    final response = await httpClient.post(
      '$_baseUrl/v1/stadium',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'stadiumName': stadium.stadiumName,
      }),
    );
    if (response.statusCode == 200) {
      return Stadium.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create stadium.');
    }
  }

  Future<void> updateStadium(Stadium stadium) async {
    final response = await httpClient.put(
      '$_baseUrl/v1/stadium/${stadium.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'id': stadium.id,
        'stadiumName': stadium.stadiumName,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update stadium');
    }
  }

  Future<void> deleteStadium(int id) async {
    final response = await httpClient.delete('$_baseUrl/v1/stadium/$id');
    if (response.statusCode != 200) {
      throw Exception('Failed to delete stadium.');
    }
  }
}
