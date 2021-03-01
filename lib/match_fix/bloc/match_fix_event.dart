import 'package:equatable/equatable.dart';
import 'package:soccer_frontend/match_fix/models/match_fix.dart';

abstract class MatchFixEvent extends Equatable {
  const MatchFixEvent();
}

class MatchFixLoad extends MatchFixEvent {
  const MatchFixLoad();

  @override
  List<Object> get props => [];
}

class MatchFixCreate extends MatchFixEvent {
  final MatchFix matchFix;
  const MatchFixCreate(this.matchFix);

  @override
  List<Object> get props => [matchFix];

  @override
  String toString() => 'MatchFixCreated {MatchFix: $matchFix}';
}

class MatchFixUpdate extends MatchFixEvent {
  final MatchFix matchFix;
  const MatchFixUpdate(this.matchFix);

  @override
  List<Object> get props => [matchFix];

  @override
  String toString() => 'MatchFixUpdated {MatchFix: $matchFix}';
}

class MatchFixDelete extends MatchFixEvent {
  final MatchFix matchFix;
  const MatchFixDelete(this.matchFix);

  @override
  List<Object> get props => [matchFix];

  @override
  String toString() => 'MatchFixDeleted {MatchFix: $matchFix}';
}
