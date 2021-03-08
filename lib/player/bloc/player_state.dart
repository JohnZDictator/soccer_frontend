import 'package:equatable/equatable.dart';
import 'package:soccer_frontend/player/models/player.dart';

class PlayerState extends Equatable {
  const PlayerState();

  @override
  List<Object> get props => [];
}

class PlayerUninitializedState extends PlayerState {}

class PlayerLoading extends PlayerState {}

class PlayerLoadSuccess extends PlayerState {
  PlayerLoadSuccess([this.players = const []]);
  final List<Player> players;

  @override
  List<Object> get props => [players];
}

class PlayerOperationFailure extends PlayerState {}
