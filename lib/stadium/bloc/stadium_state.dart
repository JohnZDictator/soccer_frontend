import 'package:equatable/equatable.dart';
import 'package:soccer_frontend/stadium/models/stadium.dart';

class StadiumState extends Equatable {
  const StadiumState();

  @override
  List<Object> get props => [];
}

class StadiumStateUninitialized extends StadiumState {}

class StadiumLoading extends StadiumState {}

class StadiumLoadSuccess extends StadiumState {
  const StadiumLoadSuccess([this.stadiums = const []]);
  final List<Stadium> stadiums;

  @override
  List<Object> get props => [stadiums];
}

class StadiumOperationFailure extends StadiumState {}
