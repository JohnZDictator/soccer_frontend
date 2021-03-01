import 'package:equatable/equatable.dart';
import 'package:soccer_frontend/club/models/club.dart';

abstract class ClubEvent extends Equatable {
  const ClubEvent();
}

class ClubLoad extends ClubEvent {
  const ClubLoad();

  @override
  List<Object> get props => [];
}

class ClubCreate extends ClubEvent {
  final Club club;

  const ClubCreate(this.club);

  @override
  List<Object> get props => [club];

  @override
  String toString() => 'Club Created {club: $club}';
}

class ClubUpdate extends ClubEvent {
  final Club club;

  const ClubUpdate(this.club);

  @override
  List<Object> get props => [club];

  @override
  String toString() => 'Club Updated] {club: $club}';
}

class ClubDelete extends ClubEvent {
  final Club club;

  const ClubDelete(this.club);

  @override
  List<Object> get props => [club];

  @override
  String toString() => 'Club Deleted {club: $club}';
}
