import 'package:equatable/equatable.dart';
import 'package:soccer_frontend/result_fix/models/result_fix.dart';

abstract class ResultFixEvent extends Equatable {
  const ResultFixEvent();
}

class ResultFixLoad extends ResultFixEvent {
  const ResultFixLoad();

  @override
  List<Object> get props => [];
}

class ResultFixCreate extends ResultFixEvent {
  const ResultFixCreate(this.resultFix);
  final ResultFix resultFix;

  @override
  List<Object> get props => [resultFix];

  @override
  String toString() => 'ResultFix Created {ResultFix: $resultFix}';
}

class ResultFixUpdate extends ResultFixEvent {
  const ResultFixUpdate(this.resultFix);
  final ResultFix resultFix;

  @override
  List<Object> get props => [resultFix];

  @override
  String toString() => 'ResultFix Updated {ResultFix: $resultFix}';
}

class ResultFixDelete extends ResultFixEvent {
  ResultFixDelete(this.resultFix);
  final ResultFix resultFix;

  @override
  List<Object> get props => [resultFix];

  @override
  String toString() => 'ResultFix Deleted {ResultFix: $resultFix}';
}
