import 'package:soccer_frontend/match_fix/match_fix.dart';
import 'package:meta/meta.dart';

class MatchFixRepository {
  final MatchFixDataProvider matchFixDataProvider;
  MatchFixRepository({@required this.matchFixDataProvider})
      : assert(matchFixDataProvider != null);

  Future<MatchFix> createMatchFix(MatchFix matchFix) async {
    return await matchFixDataProvider.createMatchFix(matchFix);
  }

  Future<List<MatchFix>> getMatchFix() async {
    return await matchFixDataProvider.getMatchFix();
  }

  Future<void> updateMatchFix(MatchFix matchFix) async {
    return await matchFixDataProvider.updateMatchFix(matchFix);
  }

  Future<void> deleteMatchFix(String id) async {
    return await matchFixDataProvider.deleteMatchFix(id);
  }
}
