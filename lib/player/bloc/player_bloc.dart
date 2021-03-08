import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:soccer_frontend/player/bloc/player_event.dart';
import 'package:soccer_frontend/player/bloc/player_state.dart';
import 'package:soccer_frontend/player/repository/player_repository.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc({@required this.playerRepository})
      : assert(playerRepository != null),
        super(PlayerUninitializedState());
  final PlayerRepository playerRepository;

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    if (event is PlayerLoad) {
      yield PlayerLoading();
      try {
        final players = await playerRepository.getPlayers();
        yield PlayerLoadSuccess(players);
      } catch (_) {
        yield PlayerOperationFailure();
      }
    }
    if (event is PlayerCreate) {
      try {
        await playerRepository.createPlayer(event.player);
        final players = await playerRepository.getPlayers();
        yield PlayerLoadSuccess(players);
      } catch (_) {
        yield PlayerOperationFailure();
      }
    }
    if (event is PlayerUpdate) {
      try {
        await playerRepository.updatePlayer(event.player);
        final players = await playerRepository.getPlayers();
        yield PlayerLoadSuccess(players);
      } catch (_) {
        yield PlayerOperationFailure();
      }
    }
    if (event is PlayerDelete) {
      try {
        await playerRepository.deletePlayer(event.player.id);
        final players = await playerRepository.getPlayers();
        yield PlayerLoadSuccess(players);
      } catch (_) {
        yield PlayerOperationFailure();
      }
    }
  }
}
