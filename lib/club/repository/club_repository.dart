import 'package:meta/meta.dart';
import 'package:soccer_frontend/club/data_provider/club_data.dart';
import 'package:soccer_frontend/club/models/club.dart';

class ClubRepository {
  ClubRepository({@required this.clubDataProvider})
      : assert(clubDataProvider != null);
  final ClubDataProvider clubDataProvider;

  Future<Club> createClub(Club club) async {
    return await clubDataProvider.createClub(club);
  }

  Future<List<Club>> getClubs() async{
    return await clubDataProvider.getClubs();
  }

  Future<void> updateClub(Club club) async{
    return await clubDataProvider.updateClub(club);
  }

  Future<void> deleteClub(String id) async{
    return await clubDataProvider.deleteClub(id);
  }
}
