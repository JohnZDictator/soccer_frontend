import 'package:meta/meta.dart';
import 'package:soccer_frontend/player/data_provider/player_data.dart';
import 'package:soccer_frontend/player/models/player.dart';

class PlayerRepository {
  PlayerRepository({@required this.playerDataProvider})
      : assert(playerDataProvider != null);
  final PlayerDataProvider playerDataProvider;

  Future<List<Player>> getPlayers() async {
    return await playerDataProvider.getPlayers();
  }

  Future<Player> getPlayerById(int id) async {
    return await playerDataProvider.getPlayerById(id);
  }

  Future<Player> createPlayer(Player player) async {
    return await playerDataProvider.createPlayer(player);
  }

  Future<void> updatePlayer(Player player) async {
    return await playerDataProvider.updatePlayer(player);
  }

  Future<void> deletePlayer(int id) async {
    return await playerDataProvider.deletePlayer(id);
  }
}
