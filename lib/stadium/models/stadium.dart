import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Stadium extends Equatable {
  final int id;
  final String stadiumName;

  Stadium({
    this.id,
    @required this.stadiumName,
  });

  @override
  List<Object> get props => [id, stadiumName];

  factory Stadium.fromJson(Map<String, dynamic> json) {
    return Stadium(
      id: json['id'],
      stadiumName: json['stadiumName'],
    );
  }

  @override
  String toString() => 'Stadium id: $id, stadiumName: $stadiumName';
}
