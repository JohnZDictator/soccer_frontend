import 'package:equatable/equatable.dart';
import 'package:soccer_frontend/club/models/club.dart';

class ClubState extends Equatable {
  const ClubState();

  @override
  List<Object> get props => [];
}

class ClubLoading extends ClubState {}

class ClubLoadSuccess extends ClubState {
  final List<Club> clubs;
  ClubLoadSuccess([this.clubs = const []]);

  @override
  List<Object> get props => [clubs];
}

class ClubOperationFailure extends ClubState {}
