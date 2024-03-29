import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:soccer_frontend/match_fix/models/models.dart';

class MatchFixDataProvider {
  final _baseUrl = 'http://10.0.2.2:8888';
  final http.Client httpClient;

  MatchFixDataProvider({@required this.httpClient})
      : assert(httpClient != null);

  Future<MatchFix> createMatchFix(MatchFix matchFix) async {
    final response = await httpClient.post(
      Uri.http('$_baseUrl', '/v1/matchFix'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'clubs': matchFix.clubs,
        'fixDate': matchFix.fixDate,
        'stadium': matchFix.stadium,
      }),
    );

    if (response.statusCode == 200) {
      return MatchFix.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create MatchFix.');
    }
  }

  Future<List<MatchFix>> getMatchFix() async {
    final response = await httpClient.get('$_baseUrl/v1/matchFix');
    if (response.statusCode == 200) {
      final matchFixs = jsonDecode(response.body) as List;
      return matchFixs
          .map((matchFixs) => MatchFix.fromJson(matchFixs))
          .toList();
    } else {
      throw Exception('Failed to load MatchFix');
    }
  }

  Future<void> updateMatchFix(MatchFix matchFix) async {
    final response = await httpClient.put(
      '$_baseUrl/v1/matchFix/${matchFix.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': matchFix.id,
        'clubs': matchFix.clubs,
        'fixDate': matchFix.fixDate,
        'stadium': matchFix.stadium,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update MatchFix.');
    }
  }

  Future<void> deleteMatchFix(int id) async {
    final response = await http.delete(
      '$_baseUrl/v1/matchFix/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete MatchFix.');
    }
  }
}
