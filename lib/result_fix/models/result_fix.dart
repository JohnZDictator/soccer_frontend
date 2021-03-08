import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ResultFix extends Equatable {
  ResultFix({
    this.id,
    this.score1,
    this.penality1,
    this.freeKick1,
    this.ballPossession1,
    this.score2,
    this.penality2,
    this.freeKick2,
    this.ballPossession2,
    @required this.matchFixId,
  });

  final int id;
  final int score1;
  final int penality1;
  final int freeKick1;
  final double ballPossession1;
  final int score2;
  final int penality2;
  final int freeKick2;
  final double ballPossession2;
  final String matchFixId;

  @override
  List<Object> get props => [
        id,
        score1,
        penality1,
        freeKick1,
        ballPossession1,
        score2,
        penality2,
        freeKick2,
        ballPossession2,
        matchFixId,
      ];

  factory ResultFix.fromJson(Map<String, dynamic> json) {
    return ResultFix(
      id: json['id'],
      score1: json['score1'],
      penality1: json['penality1'],
      freeKick1: json['freeKick1'],
      ballPossession1: json['ballPossession1'],
      score2: json['score2'],
      penality2: json['penality2'],
      freeKick2: json['freeKick2'],
      ballPossession2: json['ballPossession2'],
      matchFixId: json['matchFixId'],
    );
  }

  @override
  String toString() => '''Result Fix {
    id: $id,
    score1: $score1,
    penality1: $penality1 ,
    freeKick1: $freeKick1,
    ballPossession1: $ballPossession1,
    score2: $score2,
    penality2: $penality2,
    freeKick2: $freeKick2,
    ballPossession2: $ballPossession2,
    matchFixId: $matchFixId,
  }''';
}
