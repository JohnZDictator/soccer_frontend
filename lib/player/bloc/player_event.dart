import 'package:equatable/equatable.dart';
import 'package:soccer_frontend/player/models/player.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();
}

class PlayerLoad extends PlayerEvent {
  const PlayerLoad();

  @override
  List<Object> get props => [];
}

class PlayerCreate extends PlayerEvent {
  const PlayerCreate(this.player);
  final Player player;

  @override
  List<Object> get props => [player];

  @override
  String toString() => 'Player Created {$player}';
}

class PlayerUpdate extends PlayerEvent {
  const PlayerUpdate(this.player);
  final Player player;

  @override
  List<Object> get props => [player];

  @override
  String toString() => 'Player Updated {$player}';
}

class PlayerDelete extends PlayerEvent {
  const PlayerDelete(this.player);
  final Player player;

  @override
  List<Object> get props => [player];

  @override
  String toString() => 'Player Deleted {$player}';
}
