import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_frontend/match_fix/match_fix.dart';
import 'package:soccer_frontend/match_fix/repository/match_fix_repository.dart';

class MatchFixBloc extends Bloc<MatchFixEvent, MatchFixState> {
  final MatchFixRepository matchFixRepository;
  MatchFixBloc({this.matchFixRepository})
      : assert(matchFixRepository != null),
        super(MatchFixLoading());

  @override
  Stream<MatchFixState> mapEventToState(event) async* {
    if (event is MatchFixLoad) {
      yield MatchFixLoading();
      try {
        final matchFixs = await matchFixRepository.getMatchFix();
        yield MatchFixLoadSuccess(matchFixs);
      } catch (_) {
        yield MatchFixOperationFailure();
      }
    }

    if (event is MatchFixCreate) {
      try {
        await matchFixRepository.createMatchFix(event.matchFix);
        final matchFixs = await matchFixRepository.getMatchFix();
        yield MatchFixLoadSuccess(matchFixs);
      } catch (_) {
        yield MatchFixOperationFailure();
      }
    }

    if (event is MatchFixUpdate) {
      try {
        await matchFixRepository.updateMatchFix(event.matchFix);
        final matchFixs = await matchFixRepository.getMatchFix();
        yield MatchFixLoadSuccess(matchFixs);
      } catch (_) {
        yield MatchFixOperationFailure();
      }
    }

    if (event is MatchFixDelete) {
      try {
        await matchFixRepository.deleteMatchFix(event.matchFix.id);
        final matchFixs = await matchFixRepository.getMatchFix();
        yield MatchFixLoadSuccess(matchFixs);
      } catch (_) {
        yield MatchFixOperationFailure();
      }
    }
  }
}
