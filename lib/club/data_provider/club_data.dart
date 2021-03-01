import 'dart:convert';
import 'dart:core';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:soccer_frontend/club/models/club.dart';

class ClubDataProvider {
  final _baseUrl = 'http://10.0.0.2:3000';
  final http.Client httpClient;

  ClubDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Club> createClub(Club club) async {
    final response = await httpClient.post(
      Uri.http('10.0.0.2:3000', '/clubs'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'clubName': club.clubName,
      }),
    );

    if (response.statusCode == 200) {
      return Club.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create club.');
    }
  }

  Future<List<Club>> getClubs() async {
    final response = await httpClient.get('$_baseUrl/clubs');

    if (response.statusCode == 200) {
      final clubs = jsonDecode(response.body) as List;
      return clubs.map((clubs) => Club.fromJson(clubs)).toList();
    } else {
      throw Exception('Failed to load clubs.');
    }
  }

  Future<void> updateClub(Club club) async {
    final response = await httpClient.put(
      '$_baseUrl/clubs/${club.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset= UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'id': club.id,
        'clubName': club.clubName,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update club.');
    }
  }

  Future<void> deleteClub(String id) async {
    final response = await httpClient.delete(
      '$_baseUrl/clubs/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete club');
    }
  }
}
