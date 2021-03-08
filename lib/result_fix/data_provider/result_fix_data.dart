import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:soccer_frontend/result_fix/models/result_fix.dart';

class ResultFixDataProvider {
  ResultFixDataProvider({this.httpClient})
      : assert(
          httpClient != null,
        );
  final http.Client httpClient;

  final _baseUrl = 'http://10.0.2.2:8888';

  Future<List<ResultFix>> getResultFix() async {
    final response = await http.get('$_baseUrl/v1/game_analysis');
    if (response.statusCode == 200) {
      final resultFixs = jsonDecode(response.body) as List;
      return resultFixs.map((res) => ResultFix.fromJson(res)).toList();
    } else {
      throw Exception('Failed to get Result fix.');
    }
  }

  Future<ResultFix> getResultFixById(int id) async {
    final response = await http.get('$_baseUrl/v1/game_analysis/$id');
    if (response.statusCode == 200) {
      return ResultFix.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get result fix by id');
    }
  }

  Future<ResultFix> createResultFix(ResultFix resultFix) async {
    final response = await http.post(
      '$_baseUrl/v1/game_analysis',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'score1': resultFix.score1,
        'penality1': resultFix.penality1,
        'freeKick1': resultFix.freeKick1,
        'ballPossession1': resultFix.ballPossession1,
        'score2': resultFix.score2,
        'penality2': resultFix.penality2,
        'freeKick2': resultFix.freeKick2,
        'ballPossession2': resultFix.ballPossession2,
        'matchFixId': resultFix.matchFixId,
      }),
    );
    if (response.statusCode == 200) {
      return ResultFix.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create result Fix.');
    }
  }

  Future<void> updateResultFix(ResultFix resultFix) async {
    final response = await http.put(
      '$_baseUrl/v1/game_analysis/${resultFix.matchFixId}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': resultFix.id,
        'score1': resultFix.score1,
        'penality1': resultFix.penality1,
        'freeKick1': resultFix.freeKick1,
        'ballPossession1': resultFix.ballPossession1,
        'score2': resultFix.score2,
        'penality2': resultFix.penality2,
        'freeKick2': resultFix.freeKick2,
        'ballPossession2': resultFix.ballPossession2,
        'matchFixId': resultFix.matchFixId,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update Result fix.');
    }
  }

  Future<void> deleteResultFix(int id) async {
    final response = await http.delete(
      '$_baseUrl/v1/game_analysis/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete Result fix.');
    }
  }
}
