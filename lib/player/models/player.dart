import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Player extends Equatable {
  Player({
    this.id,
    @required this.playerName,
    @required this.playerNumber,
    @required this.clubId,
  });

  final int id;
  final String playerName;
  final String playerNumber;
  final String clubId;

  @override
  List<Object> get props => [id, playerName, playerNumber, clubId];

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      playerName: json['playerName'],
      playerNumber: json['playerNumber'],
      clubId: json['clubId'],
    );
  }

  @override
  String toString() => 'Player {$id, $playerName, $playerNumber, $clubId}';
}
