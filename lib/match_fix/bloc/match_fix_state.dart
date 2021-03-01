import 'package:equatable/equatable.dart';
import 'package:soccer_frontend/match_fix/models/match_fix.dart';

abstract class MatchFixState extends Equatable {
  const MatchFixState();

  @override
  List<Object> get props => [];
}

class MatchFixLoading extends MatchFixState {}

class MatchFixLoadSuccess extends MatchFixState {
  final List<MatchFix> matchFixs;
  MatchFixLoadSuccess([this.matchFixs = const []]);

  @override
  List<Object> get props => [matchFixs];
}

class MatchFixOperationFailure extends MatchFixState {}
