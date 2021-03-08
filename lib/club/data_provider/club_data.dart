import 'dart:convert';
import 'dart:core';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:soccer_frontend/club/models/club.dart';

class ClubDataProvider {
  final _baseUrl = 'http://10.0.2.2:8888';
  final http.Client httpClient;

  ClubDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Club> createClub(Club club) async {
    final response = await httpClient.post(
      Uri.http('10.0.2.2:8888', '/v1/club'),
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
    final response = await httpClient.get('$_baseUrl/v1/club');
    if (response.statusCode == 200) {
      final clubs = jsonDecode(response.body) as List;
      return clubs.map((club) => Club.fromJson(club)).toList();
    } else {
      throw Exception('Failed to load clubs.');
    }
  }

  Future<Club> getClubById(int id) async {
    final response = await httpClient.get('$_baseUrl/v1/club/$id');
    if (response.statusCode == 200) {
      final club = jsonDecode(response.body);
      return Club.fromJson(club);
    } else {
      throw Exception('Failed to load club');
    }
  }

  Future<void> updateClub(Club club) async {
    final response = await httpClient.put(
      '$_baseUrl/v1/club/${club.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': club.id,
        'clubName': club.clubName,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update club.');
    }
  }

  Future<void> deleteClub(int id) async {
    final response = await httpClient.delete(
      '$_baseUrl/v1/club/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete club');
    }
  }
}
