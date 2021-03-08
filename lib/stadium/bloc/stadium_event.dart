import 'package:equatable/equatable.dart';
import 'package:soccer_frontend/stadium/models/stadium.dart';

abstract class StadiumEvent extends Equatable {
  const StadiumEvent();
}

class StadiumLoad extends StadiumEvent {
  @override
  List<Object> get props => [];
}

class StadiumCreate extends StadiumEvent {
  StadiumCreate(this.stadium);
  final Stadium stadium;

  @override
  List<Object> get props => [stadium];

  @override
  String toString() => 'Stadium Created {Stadium: $stadium}';
}

class StadiumUpdate extends StadiumEvent {
  StadiumUpdate(this.stadium);
  final Stadium stadium;

  @override
  List<Object> get props => [stadium];

  @override
  String toString() => 'Stadium Updated {Stadium: $stadium}';
}

class StadiumDelete extends StadiumEvent {
  StadiumDelete(this.stadium);
  final Stadium stadium;

  @override
  List<Object> get props => [stadium];

  @override
  String toString() => 'Stadium Deleted {Stadium: $stadium}';
}
