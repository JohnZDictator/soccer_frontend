import 'package:equatable/equatable.dart';
import 'package:soccer_frontend/club/models/models.dart';
import 'package:soccer_frontend/stadium/models/stadium.dart';
import 'package:meta/meta.dart';

class MatchFix extends Equatable {
  final int id;
  final List<Club> clubs;
  final DateTime fixDate;
  final Stadium stadium;

  MatchFix({
    @required this.id,
    @required this.clubs,
    @required this.fixDate,
    @required this.stadium,
  });

  @override
  List<Object> get props => [id, clubs, fixDate, stadium];

  factory MatchFix.fromJson(Map<String, dynamic> json) {
    return MatchFix(
      id: json['id'],
      clubs: json['clubs'],
      fixDate: json['fixDate'],
      stadium: json['stadium'],
    );
  }

  @override
  String toString() =>
      'MatchFix id: $id, clubs: $clubs, fixDate: $fixDate, stadium: $stadium';
}
