import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:soccer_frontend/player/models/player.dart';

class PlayerDataProvider {
  PlayerDataProvider({@required this.httpClient}) : assert(httpClient != null);
  final http.Client httpClient;

  final _baseUrl = "http://10.0.2.2:8888";

  Future<List<Player>> getPlayers() async {
    final response = await http.get('$_baseUrl/v1/player');
    if (response.statusCode == 200) {
      final players = jsonDecode(response.body) as List;
      return players.map((player) => Player.fromJson(player)).toList();
    } else {
      throw Exception('Failed to load Players.');
    }
  }

  Future<Player> getPlayerById(int id) async {
    final response = await http.get('$_baseUrl/v1/player/$id');
    if (response.statusCode == 200) {
      return Player.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed To get Player By id.');
    }
  }

  Future<Player> createPlayer(Player player) async {
    final response = await http.post(
      Uri.http('$_baseUrl', '/v1/player'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'playerName': player.playerName,
        'playerNumber': player.playerNumber,
        'clubId': player.clubId,
      }),
    );
    if (response.statusCode == 200) {
      return Player.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create player.');
    }
  }

  Future<void> updatePlayer(Player player) async {
    final response = await http.put(
      '$_baseUrl/v1/player/${player.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': player.id,
        'playerName': player.playerName,
        'playerNumber': player.playerNumber,
        'clubId': player.clubId,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update player.');
    }
  }

  Future<void> deletePlayer(int id) async {
    final response = await http.delete(
      '$_baseUrl/v1/player/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete Player');
    }
  }
}
