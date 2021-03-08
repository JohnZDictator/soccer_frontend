import 'package:equatable/equatable.dart';
import 'package:soccer_frontend/result_fix/models/result_fix.dart';

class ResultFixState extends Equatable {
  const ResultFixState();

  @override
  List<Object> get props => [];
}

class ResultFixUninitialized extends ResultFixState {}

class ResultFixLoading extends ResultFixState {}

class ResultFixLoadSuccess extends ResultFixState {
  ResultFixLoadSuccess([this.resultFixs = const []]);
  final List<ResultFix> resultFixs;

  @override
  List<Object> get props => [resultFixs];
}

class ResultFixOperationFailure extends ResultFixState {}
