import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Club extends Equatable {
  Club({this.id, @required this.clubName});

  final String id;
  final String clubName;

  @override
  List<Object> get props => [id, clubName];

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      id: json['id'],
      clubName: json['clubName'],
    );
  }

  @override
  String toString() => 'Club {id: $id, clubName: $clubName}';
}
